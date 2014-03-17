--!	@file
--!	@brief 1chのDRV8312/32のPWM信号を発生



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package PWMGenerator_pkg is
	component PWMGenerator is
		generic(
			DUTY_WIDTH		: integer;
			MIN_DUTY		: integer;
			MAX_DUTY		: integer
		);
		port(
			CLK_SYS			: in	std_logic;
			CLK_PWM			: in	std_logic;
			
			RESET			: in	std_logic;
			
			OMSP_SYNC		: in	std_logic;
			
			PWM_OUT			: out	std_logic_vector(2 downto 0);
			nRESET_OUT		: out	std_logic_vector(2 downto 0);
			nFAULT_IN		: in	std_logic;
			nOTW_IN			: in	std_logic;
			
			REG_DUTY		: in	signed(DUTY_WIDTH downto 0);
			REG_OT			: out	std_logic;
			REG_OC			: out	std_logic;
			
			PHASE_EN		: in	std_logic_vector(2 downto 0);
			PHASE_POL		: in	std_logic_vector(2 downto 0)
		);
	end component;
end PWMGenerator_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.synchronizer_pkg.all;

entity PWMGenerator is
	generic(
		DUTY_WIDTH		: integer;	-- 符号を含まないデューティ比のビット幅
		MIN_DUTY		: integer;	-- 最小のデューティ比
		MAX_DUTY		: integer	-- 最大のデューティ比
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		CLK_PWM			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- 同期信号
		OMSP_SYNC		: in	std_logic;
		
	-- モータードライバ
		PWM_OUT			: out	std_logic_vector(2 downto 0);
		nRESET_OUT		: out	std_logic_vector(2 downto 0);
		nFAULT_IN		: in	std_logic;
		nOTW_IN			: in	std_logic;
		
	-- レジスタ
		REG_DUTY		: in	signed(DUTY_WIDTH downto 0);	-- デューティ比
		REG_OT			: out	std_logic;						-- 過熱
		REG_OC			: out	std_logic;						-- 過電流
		
	-- 相
		PHASE_EN		: in	std_logic_vector(2 downto 0);	-- 相出力有効
		PHASE_POL		: in	std_logic_vector(2 downto 0)	-- 相出力極性
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of PWMGenerator is
	
	-- 定数
	constant FILTER_LENGTH	: integer := 4;
	
	-- ラッチした値
	signal latched_duty		: unsigned(DUTY_WIDTH downto 0) := to_unsigned(0, DUTY_WIDTH+1);
	signal latched_en		: std_logic_vector(2 downto 0) := "000";
	signal latched_pol		: std_logic_vector(2 downto 0) := "000";
	
	-- PWMカウンタ
	signal pwm_enable		: std_logic := '0';
	signal pwm_ch_enable	: std_logic;
	signal pwm_ch_on		: std_logic;
	signal pwm_counter		: unsigned(DUTY_WIDTH downto 0) := unsigned(to_signed(-1, DUTY_WIDTH+1));
	
	-- PWM出力FF
	signal pwm_out_ff		: std_logic_vector(2 downto 0) := "000";
	signal nreset_out_ff	: std_logic_vector(2 downto 0) := "000";
	
	-- ハンドシェーク
	signal req_latch		: std_logic := '0';	-- デューティ比のラッチ要求
	signal ack_latch		: std_logic;
	
	-- 過電流・過熱信号
	signal oc_inv_ff		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal ot_inv_ff		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal oc_latch			: std_logic := '0';
	signal ot_latch			: std_logic := '0';
	signal oc_omsp_sync		: std_logic := '0';
	signal ot_omsp_sync		: std_logic := '0';
	
	
begin
	
	-- 制御信号のラッチ
	
	oc_latch	<= '1' when oc_inv_ff = 0 else '0';
	ot_latch	<= '1' when ot_inv_ff = 0 else '0';
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (RESET = '1') then
				-- リセット
				latched_duty	<= to_unsigned(0, DUTY_WIDTH+1);
				latched_en		<= "000";
				latched_pol		<= "000";
				
				oc_omsp_sync	<= '0';
				ot_omsp_sync	<= '0';
				REG_OT			<= '0';
				REG_OC			<= '0';
				
			else
				-- 動作中
				if (ack_latch = '1') then
					-- 入力値をラッチ
					latched_duty	<= to_unsigned(abs(to_integer(REG_DUTY)), DUTY_WIDTH+1);
					latched_en		<= PHASE_EN;
					latched_pol		<= PHASE_POL;
				end if;
				
				if (OMSP_SYNC = '0') then
					oc_omsp_sync	<= oc_omsp_sync or oc_latch;
					ot_omsp_sync	<= ot_omsp_sync or ot_latch;
				else
					oc_omsp_sync	<= '0';
					ot_omsp_sync	<= '0';
					REG_OC			<= oc_omsp_sync;
					REG_OT			<= ot_omsp_sync;
				end if;
				
			end if;
			
			-- 過電流・過熱信号のグリッチフィルタ
			oc_inv_ff	<= oc_inv_ff(FILTER_LENGTH-2 downto 0) & nFAULT_IN;
			ot_inv_ff	<= ot_inv_ff(FILTER_LENGTH-2 downto 0) & nOTW_IN;
			
			
		end if;
	end process;
	
	
	
	-- モータードライバ制御
	pwm_enable	<= '1' when pwm_counter < MAX_DUTY else '0';
	pwm_ch_on	<= pwm_ch_enable when pwm_counter < latched_duty else '0';
	
	process(RESET, CLK_PWM)
	begin
		if (rising_edge(CLK_PWM)) then
			-- 上昇エッジ
			
			pwm_out_ff		<= and_vector(and_vector(latched_pol, pwm_ch_on), pwm_enable);
			nreset_out_ff	<= latched_en;
			
			PWM_OUT			<= pwm_out_ff;
			nRESET_OUT		<= nreset_out_ff;
			
			if (RESET = '1') then
				-- リセット
				pwm_ch_enable	<= '0';
				pwm_counter		<= '0' & unsigned(to_signed(-1, DUTY_WIDTH));
				
			else
				-- 動作中
				
				-- カウンタをデクリメント
				pwm_counter(DUTY_WIDTH) <= '0';
				pwm_counter(DUTY_WIDTH-1 downto 0) <= pwm_counter(DUTY_WIDTH-1 downto 0) - 1;
				
				-- カウンタが0に達したら設定値の更新を要求
				if (pwm_counter = 0) then
					pwm_ch_enable <= '1';
				elsif (oc_latch = '1') then
					pwm_ch_enable <= '0';
				end if;
				
			end if;
		end if;
	end process;
	
	
	
	-- 更新要求
	req_latch <= '1' when pwm_counter = 0 else '0';
	LatchHandshake : UnidirHandshake port map(CLK_SYS, ack_latch, CLK_PWM, req_latch);
	
	
	
end;
 