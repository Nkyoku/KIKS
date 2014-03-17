--!	@file
--!	@brief 4chのDRV8312/32のPWM信号を発生



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package PWMGeneratorQuad_pkg is
	component PWMGeneratorQuad is
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
			
			PWM_OUT_0		: out	std_logic_vector(2 downto 0);
			PWM_OUT_1		: out	std_logic_vector(2 downto 0);
			PWM_OUT_2		: out	std_logic_vector(2 downto 0);
			PWM_OUT_3		: out	std_logic_vector(2 downto 0);
			nRESET_OUT_0	: out	std_logic_vector(2 downto 0);
			nRESET_OUT_1	: out	std_logic_vector(2 downto 0);
			nRESET_OUT_2	: out	std_logic_vector(2 downto 0);
			nRESET_OUT_3	: out	std_logic_vector(2 downto 0);
			nFAULT_IN		: in	std_logic_vector(3 downto 0);
			nOTW_IN			: in	std_logic_vector(3 downto 0);
			
			REG_DUTY_0		: in	signed(DUTY_WIDTH downto 0);
			REG_DUTY_1		: in	signed(DUTY_WIDTH downto 0);
			REG_DUTY_2		: in	signed(DUTY_WIDTH downto 0);
			REG_DUTY_3		: in	signed(DUTY_WIDTH downto 0);
			REG_OT			: out	std_logic_vector(3 downto 0);
			REG_OC			: out	std_logic_vector(3 downto 0);
			
			PHASE_EN_0		: in	std_logic_vector(2 downto 0);
			PHASE_EN_1		: in	std_logic_vector(2 downto 0);
			PHASE_EN_2		: in	std_logic_vector(2 downto 0);
			PHASE_EN_3		: in	std_logic_vector(2 downto 0);
			PHASE_POL_0		: in	std_logic_vector(2 downto 0);
			PHASE_POL_1		: in	std_logic_vector(2 downto 0);
			PHASE_POL_2		: in	std_logic_vector(2 downto 0);
			PHASE_POL_3		: in	std_logic_vector(2 downto 0)
		);
	end component;
end PWMGeneratorQuad_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.synchronizer_pkg.all;

entity PWMGeneratorQuad is
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
		PWM_OUT_0		: out	std_logic_vector(2 downto 0);
		PWM_OUT_1		: out	std_logic_vector(2 downto 0);
		PWM_OUT_2		: out	std_logic_vector(2 downto 0);
		PWM_OUT_3		: out	std_logic_vector(2 downto 0);
		nRESET_OUT_0	: out	std_logic_vector(2 downto 0);
		nRESET_OUT_1	: out	std_logic_vector(2 downto 0);
		nRESET_OUT_2	: out	std_logic_vector(2 downto 0);
		nRESET_OUT_3	: out	std_logic_vector(2 downto 0);
		nFAULT_IN		: in	std_logic_vector(3 downto 0);
		nOTW_IN			: in	std_logic_vector(3 downto 0);
		
	-- レジスタ
		REG_DUTY_0		: in	signed(DUTY_WIDTH downto 0);	-- デューティ比
		REG_DUTY_1		: in	signed(DUTY_WIDTH downto 0);
		REG_DUTY_2		: in	signed(DUTY_WIDTH downto 0);
		REG_DUTY_3		: in	signed(DUTY_WIDTH downto 0);
		REG_OT			: out	std_logic_vector(3 downto 0);	-- 過熱
		REG_OC			: out	std_logic_vector(3 downto 0);	-- 過電流
		
	-- 相
		PHASE_EN_0		: in	std_logic_vector(2 downto 0);	-- 相出力有効
		PHASE_EN_1		: in	std_logic_vector(2 downto 0);
		PHASE_EN_2		: in	std_logic_vector(2 downto 0);
		PHASE_EN_3		: in	std_logic_vector(2 downto 0);
		PHASE_POL_0		: in	std_logic_vector(2 downto 0);	-- 相出力極性
		PHASE_POL_1		: in	std_logic_vector(2 downto 0);
		PHASE_POL_2		: in	std_logic_vector(2 downto 0);
		PHASE_POL_3		: in	std_logic_vector(2 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of PWMGeneratorQuad is
	
	-- 定数
	constant FILTER_LENGTH	: integer := 4;
	
	-- ラッチした値
	signal latched_duty_0	: unsigned(DUTY_WIDTH downto 0) := to_unsigned(0, DUTY_WIDTH+1);
	signal latched_duty_1	: unsigned(DUTY_WIDTH downto 0) := to_unsigned(0, DUTY_WIDTH+1);
	signal latched_duty_2	: unsigned(DUTY_WIDTH downto 0) := to_unsigned(0, DUTY_WIDTH+1);
	signal latched_duty_3	: unsigned(DUTY_WIDTH downto 0) := to_unsigned(0, DUTY_WIDTH+1);
	signal latched_en_0		: std_logic_vector(2 downto 0) := "000";
	signal latched_en_1		: std_logic_vector(2 downto 0) := "000";
	signal latched_en_2		: std_logic_vector(2 downto 0) := "000";
	signal latched_en_3		: std_logic_vector(2 downto 0) := "000";
	signal latched_pol_0	: std_logic_vector(2 downto 0) := "000";
	signal latched_pol_1	: std_logic_vector(2 downto 0) := "000";
	signal latched_pol_2	: std_logic_vector(2 downto 0) := "000";
	signal latched_pol_3	: std_logic_vector(2 downto 0) := "000";
	
	-- PWMカウンタ
	signal pwm_enable		: std_logic := '0';
	signal pwm_ch_enable	: std_logic_vector(3 downto 0);
	signal pwm_ch_on		: std_logic_vector(3 downto 0);
	signal pwm_counter		: unsigned(DUTY_WIDTH downto 0) := unsigned(to_signed(-1, DUTY_WIDTH+1));
	
	-- PWM出力FF
	signal pwm_out_ff_0		: std_logic_vector(2 downto 0) := "000";
	signal pwm_out_ff_1		: std_logic_vector(2 downto 0) := "000";
	signal pwm_out_ff_2		: std_logic_vector(2 downto 0) := "000";
	signal pwm_out_ff_3		: std_logic_vector(2 downto 0) := "000";
	signal nreset_out_ff_0	: std_logic_vector(2 downto 0) := "000";
	signal nreset_out_ff_1	: std_logic_vector(2 downto 0) := "000";
	signal nreset_out_ff_2	: std_logic_vector(2 downto 0) := "000";
	signal nreset_out_ff_3	: std_logic_vector(2 downto 0) := "000";
	
	-- ハンドシェーク
	signal req_latch		: std_logic := '0';	-- デューティ比のラッチ要求
	signal ack_latch		: std_logic;
	
	-- 過電流・過熱信号
	signal oc_inv_ff_0		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal oc_inv_ff_1		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal oc_inv_ff_2		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal oc_inv_ff_3		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal ot_inv_ff_0		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal ot_inv_ff_1		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal ot_inv_ff_2		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal ot_inv_ff_3		: signed(FILTER_LENGTH-1 downto 0) := to_signed(-1, FILTER_LENGTH);
	signal oc_latch			: std_logic_vector(3 downto 0) := "0000";
	signal ot_latch			: std_logic_vector(3 downto 0) := "0000";
	signal oc_omsp_sync		: std_logic_vector(3 downto 0) := "0000";
	signal ot_omsp_sync		: std_logic_vector(3 downto 0) := "0000";
	
	
begin
	
	-- 制御信号のラッチ
	
	oc_latch(0)	<= '1' when oc_inv_ff_0 = 0 else '0';
	oc_latch(1)	<= '1' when oc_inv_ff_1 = 0 else '0';
	oc_latch(2)	<= '1' when oc_inv_ff_2 = 0 else '0';
	oc_latch(3)	<= '1' when oc_inv_ff_3 = 0 else '0';
	ot_latch(0)	<= '1' when ot_inv_ff_0 = 0 else '0';
	ot_latch(1)	<= '1' when ot_inv_ff_1 = 0 else '0';
	ot_latch(2)	<= '1' when ot_inv_ff_2 = 0 else '0';
	ot_latch(3)	<= '1' when ot_inv_ff_3 = 0 else '0';
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (RESET = '1') then
				-- リセット
				latched_duty_0	<= to_unsigned(0, DUTY_WIDTH+1);
				latched_duty_1	<= to_unsigned(0, DUTY_WIDTH+1);
				latched_duty_2	<= to_unsigned(0, DUTY_WIDTH+1);
				latched_duty_3	<= to_unsigned(0, DUTY_WIDTH+1);
				latched_en_0	<= "000";
				latched_en_1	<= "000";
				latched_en_2	<= "000";
				latched_en_3	<= "000";
				latched_pol_0	<= "000";
				latched_pol_1	<= "000";
				latched_pol_2	<= "000";
				latched_pol_3	<= "000";
				
				oc_omsp_sync	<= "0000";
				ot_omsp_sync	<= "0000";
				REG_OT			<= "0000";
				REG_OC			<= "0000";
				
			else
				-- 動作中
				if (ack_latch = '1') then
					-- 入力値をラッチ
					latched_duty_0	<= to_unsigned(abs(to_integer(REG_DUTY_0)), DUTY_WIDTH+1);
					latched_duty_1	<= to_unsigned(abs(to_integer(REG_DUTY_1)), DUTY_WIDTH+1);
					latched_duty_2	<= to_unsigned(abs(to_integer(REG_DUTY_2)), DUTY_WIDTH+1);
					latched_duty_3	<= to_unsigned(abs(to_integer(REG_DUTY_3)), DUTY_WIDTH+1);
					latched_en_0	<= PHASE_EN_0;
					latched_en_1	<= PHASE_EN_1;
					latched_en_2	<= PHASE_EN_2;
					latched_en_3	<= PHASE_EN_3;
					latched_pol_0	<= PHASE_POL_0;
					latched_pol_1	<= PHASE_POL_1;
					latched_pol_2	<= PHASE_POL_2;
					latched_pol_3	<= PHASE_POL_3;
				end if;
				
				if (OMSP_SYNC = '0') then
					oc_omsp_sync	<= oc_omsp_sync or oc_latch;
					ot_omsp_sync	<= ot_omsp_sync or ot_latch;
				else
					oc_omsp_sync	<= "0000";
					ot_omsp_sync	<= "0000";
					REG_OC			<= oc_omsp_sync;
					REG_OT			<= ot_omsp_sync;
				end if;
				
			end if;
			
			-- 過電流・過熱信号のグリッチフィルタ
			oc_inv_ff_0	<= oc_inv_ff_0(FILTER_LENGTH-2 downto 0) & nFAULT_IN(0);
			oc_inv_ff_1	<= oc_inv_ff_1(FILTER_LENGTH-2 downto 0) & nFAULT_IN(1);
			oc_inv_ff_2	<= oc_inv_ff_2(FILTER_LENGTH-2 downto 0) & nFAULT_IN(2);
			oc_inv_ff_3	<= oc_inv_ff_3(FILTER_LENGTH-2 downto 0) & nFAULT_IN(3);
			ot_inv_ff_0	<= ot_inv_ff_0(FILTER_LENGTH-2 downto 0) & nOTW_IN(0);
			ot_inv_ff_1	<= ot_inv_ff_1(FILTER_LENGTH-2 downto 0) & nOTW_IN(1);
			ot_inv_ff_2	<= ot_inv_ff_2(FILTER_LENGTH-2 downto 0) & nOTW_IN(2);
			ot_inv_ff_3	<= ot_inv_ff_3(FILTER_LENGTH-2 downto 0) & nOTW_IN(3);
			
			
		end if;
	end process;
	
	
	
	-- モータードライバ制御
	pwm_enable		<= '1' when pwm_counter < MAX_DUTY else '0';
	pwm_ch_on(0)	<= pwm_ch_enable(0) when pwm_counter < latched_duty_0 else '0';
	pwm_ch_on(1)	<= pwm_ch_enable(1) when pwm_counter < latched_duty_1 else '0';
	pwm_ch_on(2)	<= pwm_ch_enable(2) when pwm_counter < latched_duty_2 else '0';
	pwm_ch_on(3)	<= pwm_ch_enable(3) when pwm_counter < latched_duty_3 else '0';
	
	process(RESET, CLK_PWM)
	begin
		if (rising_edge(CLK_PWM)) then
			-- 上昇エッジ
			
			pwm_out_ff_0	<= and_vector(and_vector(latched_pol_0, pwm_ch_on(0)), pwm_enable);
			pwm_out_ff_1	<= and_vector(and_vector(latched_pol_1, pwm_ch_on(1)), pwm_enable);
			pwm_out_ff_2	<= and_vector(and_vector(latched_pol_2, pwm_ch_on(2)), pwm_enable);
			pwm_out_ff_3	<= and_vector(and_vector(latched_pol_3, pwm_ch_on(3)), pwm_enable);
			nreset_out_ff_0	<= latched_en_0;
			nreset_out_ff_1	<= latched_en_1;
			nreset_out_ff_2	<= latched_en_2;
			nreset_out_ff_3	<= latched_en_3;
			
			PWM_OUT_0		<= pwm_out_ff_0;
			PWM_OUT_1		<= pwm_out_ff_1;
			PWM_OUT_2		<= pwm_out_ff_2;
			PWM_OUT_3		<= pwm_out_ff_3;
			nRESET_OUT_0	<= nreset_out_ff_0;
			nRESET_OUT_1	<= nreset_out_ff_1;
			nRESET_OUT_2	<= nreset_out_ff_2;
			nRESET_OUT_3	<= nreset_out_ff_3;
			
			if (RESET = '1') then
				-- リセット
				pwm_ch_enable	<= "0000";
				pwm_counter		<= '0' & unsigned(to_signed(-1, DUTY_WIDTH));
				
			else
				-- 動作中
				
				-- カウンタをデクリメント
				pwm_counter(DUTY_WIDTH) <= '0';
				pwm_counter(DUTY_WIDTH-1 downto 0) <= pwm_counter(DUTY_WIDTH-1 downto 0) - 1;
				
				-- カウンタが0に達したら設定値の更新を要求
				if (pwm_counter = 0) then
					pwm_ch_enable <= "1111";
				else
					if (oc_latch(0) = '1') then
						pwm_ch_enable(0) <= '0';
					end if;
					if (oc_latch(1) = '1') then
						pwm_ch_enable(1) <= '0';
					end if;
					if (oc_latch(2) = '1') then
						pwm_ch_enable(2) <= '0';
					end if;
					if (oc_latch(3) = '1') then
						pwm_ch_enable(3) <= '0';
					end if;
				end if;
				
			end if;
		end if;
	end process;
	
	
	
	-- 更新要求
	req_latch <= '1' when pwm_counter = 0 else '0';
	LatchHandshake : UnidirHandshake port map(CLK_SYS, ack_latch, CLK_PWM, req_latch);
	
	
	
	
end;
 