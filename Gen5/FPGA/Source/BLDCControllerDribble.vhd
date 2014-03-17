--!	@file
--!	@brief 三相モーターコントローラ(ドリブル用 矩形波駆動)



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package BLDCControllerDribble_pkg is
	component BLDCControllerDribble is
		generic(
			PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			CLK_PWM			: in	std_logic;
			
			OMSP_SYNC		: in	std_logic;
			
			RESET			: in	std_logic;
			OMSP_RESET		: in	std_logic;
			
			WVU_UPDATE		: in	std_logic;
			WVU_IN			: in	std_logic_vector(2 downto 0);
			
			PWM_OUT			: out	std_logic_vector(2 downto 0);
			nRESET_OUT		: out	std_logic_vector(2 downto 0);
			nFAULT_IN		: in	std_logic;
			nOTW_IN			: in	std_logic;
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			PBUS_EN			: in	std_logic;
			PBUS_WR			: in	std_logic;
			PBUS_WAIT		: out	std_logic;
			PBUS_ADDR		: in	std_logic_vector(15 downto 0);
			PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end BLDCControllerDribble_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.PhaseGenerator_pkg.all;
use work.PWMGenerator_pkg.all;

entity BLDCControllerDribble is
	generic(
		PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		CLK_PWM			: in	std_logic;
	
	-- 同期信号
		OMSP_SYNC		: in	std_logic;
	
	-- リセット
		RESET			: in	std_logic;
		OMSP_RESET		: in	std_logic;
	
	-- センサー入力
		WVU_UPDATE		: in	std_logic;
		WVU_IN			: in	std_logic_vector(2 downto 0);
		
	-- モータードライバ
		PWM_OUT			: out	std_logic_vector(2 downto 0);
		nRESET_OUT		: out	std_logic_vector(2 downto 0);
		nFAULT_IN		: in	std_logic;
		nOTW_IN			: in	std_logic;
	
	-- XBUS
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- PBUS
		PBUS_EN			: in	std_logic;
		PBUS_WR			: in	std_logic;
		PBUS_WAIT		: out	std_logic;
		PBUS_ADDR		: in	std_logic_vector(15 downto 0);
		PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of BLDCControllerDribble is
	
	-- 定数
	constant DUTY_WIDTH	: integer := 12;	-- 符号部分を含まないビット幅
	
	-- Pバス
	constant PBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant PBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_wr_cr		: std_logic;
	signal pbus_rd_sr		: std_logic;
	signal pbus_rd_duty		: std_logic;
	signal pbus_wr_duty		: std_logic;
	signal pbus_rd_pwm		: std_logic;
	
	signal pbus_reg_test	: std_logic_vector(1 downto 0) := "00";
	signal pxbus_reg_gtr	: std_logic := '0';
	signal pxbus_reg_en		: std_logic := '0';
	signal pxbus_reg_oc		: std_logic;
	signal pxbus_reg_ot		: std_logic;
	signal pxbus_reg_duty	: signed(DUTY_WIDTH downto 0) := to_signed(0, DUTY_WIDTH+1);
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFE0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"001F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_cr		: std_logic;
	signal xbus_rd_sr		: std_logic;
	signal xbus_wr_duty		: std_logic;
	--signal xbus_rd_rot		: std_logic;
	
	-- PWM
	signal phase_en			: std_logic_vector(2 downto 0);
	signal phase_pol		: std_logic_vector(2 downto 0);
	
	
	
	
	
	
begin
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (PBUS_BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and PBUS_ADDRESS_MASK;
	
	pbus_wr_cr		<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0000" else '0';
	pbus_rd_sr		<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0001" else '0';
	pbus_rd_duty	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0002" else '0';
	pbus_wr_duty	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0002" else '0';
	pbus_rd_pwm		<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0004" else '0';
	
	PBUS_WAIT <= '0';
	
	PBUS_DATA_OUT <=X"00" & "00" & pxbus_reg_ot & pxbus_reg_oc & pxbus_reg_gtr & "000"	when pbus_rd_sr = '1' else
					std_logic_vector(resize(pxbus_reg_duty, 16))	when pbus_rd_duty = '1' else
					X"00" & "00" & phase_en & phase_pol				when pbus_rd_pwm = '1' else
					X"0000";
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_cr		<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0000" else '0';
	xbus_rd_sr		<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';
	xbus_wr_duty	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0004" else '0';
	
	XBUS_DATA_OUT <=X"00" & "00" & pxbus_reg_ot & pxbus_reg_oc & pxbus_reg_gtr & "000"	when xbus_rd_sr = '1' else
					X"0000";
	
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			
			if (RESET = '1') then
				-- リセット
				pbus_reg_test	<= "00";
				pxbus_reg_gtr	<= '0';
				pxbus_reg_en	<= '0';
				pxbus_reg_duty	<= to_signed(0, DUTY_WIDTH+1);
				
			else
				-- 動作中
				
				if (pxbus_reg_gtr = '0') then
					-- モーター制御は外部CPU
					
					-- PバスからのCRライト
					if (pbus_wr_cr = '1') then
						pxbus_reg_gtr	<= PBUS_DATA_IN(3);
						if (PBUS_DATA_IN(3) = '0') then
							-- GTR=0のまま
							pbus_reg_test	<= PBUS_DATA_IN(2 downto 1);
							pxbus_reg_en	<= PBUS_DATA_IN(4);
						else
							-- GTR=1に
							pbus_reg_test	<= "00";
							pxbus_reg_en	<= '0';
							
							pxbus_reg_duty	<= to_signed(0, DUTY_WIDTH+1);
						end if;
					else
						-- PバスからのDUTYライト
						if (pbus_wr_duty = '1') then
							pxbus_reg_duty	<= signed(PBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
					end if;
				else
					-- モーター制御はOMSP
					
					-- PバスからのCRライト
					if (pbus_wr_cr = '1') then
						pbus_reg_test	<= PBUS_DATA_IN(2 downto 1);
						pxbus_reg_gtr	<= PBUS_DATA_IN(3);
						pxbus_reg_en	<= PBUS_DATA_IN(4);
						
						if (PBUS_DATA_IN(3) = '0') then
							-- GTR=0のときのみDUTYをリセット
							pxbus_reg_duty	<= to_signed(0, DUTY_WIDTH+1);
						end if;
					else
						if (OMSP_RESET = '1') then
							-- OMSPリセット
							pxbus_reg_en	<= '0';
						else
							-- XバスからのCRライト
							if (xbus_wr_cr = '1') then
								pxbus_reg_en	<= XBUS_DATA_IN(1);
							end if;
						end if;
						
						-- XバスからのDUTYnライト
						if (xbus_wr_duty = '1') then
							pxbus_reg_duty	<= signed(XBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	
	
	
	
	
	
	-- PWM信号生成
	PWMGEN : PWMGenerator
		generic map(
			DUTY_WIDTH		=> DUTY_WIDTH,
			MIN_DUTY		=> 10,
			MAX_DUTY		=> 2**DUTY_WIDTH - 10
		)
		port map(
			CLK_SYS			=> CLK_SYS,
			CLK_PWM			=> CLK_PWM,
			RESET			=> RESET,
			OMSP_SYNC		=> OMSP_SYNC,
			PWM_OUT			=> PWM_OUT,
			nRESET_OUT		=> nRESET_OUT,
			nFAULT_IN		=> nFAULT_IN,
			nOTW_IN			=> nOTW_IN,
			REG_DUTY		=> pxbus_reg_duty,
			REG_OT			=> pxbus_reg_ot,
			REG_OC			=> pxbus_reg_oc,
			PHASE_EN		=> phase_en,
			PHASE_POL		=> phase_pol
		);
	
	
	
	-- 相信号生成
	PHASEGEN : PhaseGenerator
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			WVU_UPDATE		=> WVU_UPDATE,
			WVU_IN			=> WVU_IN,
			PHASE_EN_OUT	=> phase_en,
			PHASE_POL_OUT	=> phase_pol,
			ENABLE_IN		=> pxbus_reg_en,
			BRAKE_IN		=> '0',
			TEST_IN			=> pbus_reg_test,
			DIR_IN			=> pxbus_reg_duty(DUTY_WIDTH)
		);
	
	
end;