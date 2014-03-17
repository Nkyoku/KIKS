--!	@file
--!	@brief クアッド三相モーターコントローラ(矩形波駆動)



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package BLDCControllerQuad_pkg is
	component BLDCControllerQuad is
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
			
			BAWVU_UPDATE	: in	std_logic;
			BAWVU_IN_0		: in	std_logic_vector(4 downto 0);
			BAWVU_IN_1		: in	std_logic_vector(4 downto 0);
			BAWVU_IN_2		: in	std_logic_vector(4 downto 0);
			BAWVU_IN_3		: in	std_logic_vector(4 downto 0);
			
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
			
			PBUS_EN			: in	std_logic;
			PBUS_WR			: in	std_logic;
			PBUS_WAIT		: out	std_logic;
			PBUS_ADDR		: in	std_logic_vector(15 downto 0);
			PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end BLDCControllerQuad_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.BLDCControllerQuad_pkg.all;
use work.PhaseGenerator_pkg.all;
use work.PWMGeneratorQuad_pkg.all;
use work.QuadratureDecoder_pkg.all;

entity BLDCControllerQuad is
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
		BAWVU_UPDATE	: in	std_logic;
		BAWVU_IN_0		: in	std_logic_vector(4 downto 0);
		BAWVU_IN_1		: in	std_logic_vector(4 downto 0);
		BAWVU_IN_2		: in	std_logic_vector(4 downto 0);
		BAWVU_IN_3		: in	std_logic_vector(4 downto 0);
		
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
		
	-- Pバス
		PBUS_EN			: in	std_logic;
		PBUS_WR			: in	std_logic;
		PBUS_WAIT		: out	std_logic;
		PBUS_ADDR		: in	std_logic_vector(15 downto 0);
		PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of BLDCControllerQuad is
	
	-- 定数
	constant DUTY_WIDTH	: integer := 12;	-- 符号部分を含まないビット幅
	constant DEC_WIDTH	: integer := 16;	-- QDECの計数ビット幅
	
	-- Pバス
	constant PBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant PBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_wr_cr		: std_logic;
	signal pbus_rd_sr		: std_logic;
	signal pbus_rd_duty		: std_logic_vector(3 downto 0);
	signal pbus_wr_duty		: std_logic_vector(3 downto 0);
	signal pbus_rd_rot		: std_logic_vector(3 downto 0);
	signal pbus_rd_pwm		: std_logic_vector(3 downto 0);
	
	signal pbus_reg_test	: std_logic_vector(1 downto 0) := "00";
	signal pxbus_reg_gtr	: std_logic := '0';
	signal pxbus_reg_en		: std_logic_vector(3 downto 0) := "0000";
	signal pxbus_reg_br		: std_logic_vector(3 downto 0) := "0000";
	signal pxbus_reg_oc		: std_logic_vector(3 downto 0);
	signal pxbus_reg_ot		: std_logic_vector(3 downto 0);
	signal pxbus_reg_ot_oc	: std_logic_vector(7 downto 0);
	signal pxbus_reg_duty0	: signed(DUTY_WIDTH downto 0) := to_signed(0, DUTY_WIDTH+1);
	signal pxbus_reg_duty1	: signed(DUTY_WIDTH downto 0) := to_signed(0, DUTY_WIDTH+1);
	signal pxbus_reg_duty2	: signed(DUTY_WIDTH downto 0) := to_signed(0, DUTY_WIDTH+1);
	signal pxbus_reg_duty3	: signed(DUTY_WIDTH downto 0) := to_signed(0, DUTY_WIDTH+1);
	signal pxbus_reg_rot0	: signed(DEC_WIDTH-1 downto 0);
	signal pxbus_reg_rot1	: signed(DEC_WIDTH-1 downto 0);
	signal pxbus_reg_rot2	: signed(DEC_WIDTH-1 downto 0);
	signal pxbus_reg_rot3	: signed(DEC_WIDTH-1 downto 0);
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFE0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"001F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_cr		: std_logic;
	signal xbus_rd_sr		: std_logic;
	signal xbus_wr_duty		: std_logic_vector(3 downto 0);
	signal xbus_rd_rot		: std_logic_vector(3 downto 0);
	
	-- PWM
	signal phase_en_0		: std_logic_vector(2 downto 0);
	signal phase_en_1		: std_logic_vector(2 downto 0);
	signal phase_en_2		: std_logic_vector(2 downto 0);
	signal phase_en_3		: std_logic_vector(2 downto 0);
	signal phase_pol_0		: std_logic_vector(2 downto 0);
	signal phase_pol_1		: std_logic_vector(2 downto 0);
	signal phase_pol_2		: std_logic_vector(2 downto 0);
	signal phase_pol_3		: std_logic_vector(2 downto 0);
	
	
	
	
	
	
begin
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (PBUS_BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and PBUS_ADDRESS_MASK;
	
	pbus_wr_cr		<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0000" else '0';
	pbus_rd_sr		<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0001" else '0';
	pbus_rd_duty(0)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0002" else '0';
	pbus_wr_duty(0)	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0002" else '0';
	pbus_rd_duty(1)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0003" else '0';
	pbus_wr_duty(1)	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0003" else '0';
	pbus_rd_duty(2)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0004" else '0';
	pbus_wr_duty(2)	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0004" else '0';
	pbus_rd_duty(3)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0005" else '0';
	pbus_wr_duty(3)	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0005" else '0';
	pbus_rd_rot(0)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0008" else '0';
	pbus_rd_rot(1)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0009" else '0';
	pbus_rd_rot(2)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"000A" else '0';
	pbus_rd_rot(3)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"000B" else '0';
	pbus_rd_pwm(0)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"000E" else '0';
	pbus_rd_pwm(1)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"000F" else '0';
	pbus_rd_pwm(2)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0010" else '0';
	pbus_rd_pwm(3)	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0011" else '0';
	
	PBUS_WAIT <= '0';
	
	PBUS_DATA_OUT <=X"0" & pxbus_reg_ot_oc & pxbus_reg_gtr & "000"	when pbus_rd_sr = '1' else
					std_logic_vector(resize(pxbus_reg_duty0, 16))	when pbus_rd_duty(0) = '1' else
					std_logic_vector(resize(pxbus_reg_duty1, 16))	when pbus_rd_duty(1) = '1' else
					std_logic_vector(resize(pxbus_reg_duty2, 16))	when pbus_rd_duty(2) = '1' else
					std_logic_vector(resize(pxbus_reg_duty3, 16))	when pbus_rd_duty(3) = '1' else
					std_logic_vector(resize(pxbus_reg_rot0, 16))	when pbus_rd_rot(0) = '1' else
					std_logic_vector(resize(pxbus_reg_rot1, 16))	when pbus_rd_rot(1) = '1' else
					std_logic_vector(resize(pxbus_reg_rot2, 16))	when pbus_rd_rot(2) = '1' else
					std_logic_vector(resize(pxbus_reg_rot3, 16))	when pbus_rd_rot(3) = '1' else
					X"00" & "00" & phase_en_0 & phase_pol_0			when pbus_rd_pwm(0) = '1' else
					X"00" & "00" & phase_en_1 & phase_pol_1			when pbus_rd_pwm(1) = '1' else
					X"00" & "00" & phase_en_2 & phase_pol_2			when pbus_rd_pwm(2) = '1' else
					X"00" & "00" & phase_en_3 & phase_pol_3			when pbus_rd_pwm(3) = '1' else
					X"0000";
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_cr		<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0000" else '0';
	xbus_rd_sr		<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';
	xbus_wr_duty(0)	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0004" else '0';
	xbus_wr_duty(1)	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0006" else '0';
	xbus_wr_duty(2)	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0008" else '0';
	xbus_wr_duty(3)	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"000A" else '0';
	xbus_rd_rot(0)	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0010" else '0';
	xbus_rd_rot(1)	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0012" else '0';
	xbus_rd_rot(2)	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0014" else '0';
	xbus_rd_rot(3)	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0016" else '0';
	
	XBUS_DATA_OUT <=X"0" & pxbus_reg_ot_oc & pxbus_reg_gtr & "000"	when xbus_rd_sr = '1' else
					std_logic_vector(resize(pxbus_reg_rot0, 16))	when xbus_rd_rot(0) = '1' else
					std_logic_vector(resize(pxbus_reg_rot1, 16))	when xbus_rd_rot(1) = '1' else
					std_logic_vector(resize(pxbus_reg_rot2, 16))	when xbus_rd_rot(2) = '1' else
					std_logic_vector(resize(pxbus_reg_rot3, 16))	when xbus_rd_rot(3) = '1' else
					X"0000";
	
	
	pxbus_reg_ot_oc <= pxbus_reg_ot(3) & pxbus_reg_oc(3) & pxbus_reg_ot(2) & pxbus_reg_oc(2)
	                 & pxbus_reg_ot(1) & pxbus_reg_oc(1) & pxbus_reg_ot(0) & pxbus_reg_oc(0);
	
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			
			if (RESET = '1') then
				-- リセット
				pbus_reg_test	<= "00";
				pxbus_reg_gtr	<= '0';
				pxbus_reg_en	<= "0000";
				pxbus_reg_br	<= "0000";
				pxbus_reg_duty0	<= to_signed(0, DUTY_WIDTH+1);
				pxbus_reg_duty1	<= to_signed(0, DUTY_WIDTH+1);
				pxbus_reg_duty2	<= to_signed(0, DUTY_WIDTH+1);
				pxbus_reg_duty3	<= to_signed(0, DUTY_WIDTH+1);
				
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
							pxbus_reg_en	<= PBUS_DATA_IN(7 downto 4);
							pxbus_reg_br	<= PBUS_DATA_IN(13 downto 10);
						else
							-- GTR=1に
							pbus_reg_test	<= "00";
							pxbus_reg_en	<= "0000";
							pxbus_reg_br	<= "0000";
							
							pxbus_reg_duty0	<= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty1 <= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty2 <= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty3 <= to_signed(0, DUTY_WIDTH+1);
						end if;
					else
						-- PバスからのDUTYnライト
						if (pbus_wr_duty(0) = '1') then
							pxbus_reg_duty0	<= signed(PBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (pbus_wr_duty(1) = '1') then
							pxbus_reg_duty1	<= signed(PBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (pbus_wr_duty(2) = '1') then
							pxbus_reg_duty2	<= signed(PBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (pbus_wr_duty(3) = '1') then
							pxbus_reg_duty3	<= signed(PBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
					end if;
				else
					-- モーター制御はOMSP
					
					-- PバスからのCRライト
					if (pbus_wr_cr = '1') then
						pbus_reg_test	<= PBUS_DATA_IN(2 downto 1);
						pxbus_reg_gtr	<= PBUS_DATA_IN(3);
						pxbus_reg_en	<= PBUS_DATA_IN(7 downto 4);
						pxbus_reg_br	<= PBUS_DATA_IN(13 downto 10);
						
						if (PBUS_DATA_IN(3) = '0') then
							-- GTR=0のときのみDUTYnをリセット
							pxbus_reg_duty0	<= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty1 <= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty2 <= to_signed(0, DUTY_WIDTH+1);
							pxbus_reg_duty3 <= to_signed(0, DUTY_WIDTH+1);
						end if;
					else
						if (OMSP_RESET = '1') then
							-- OMSPリセット
							pxbus_reg_en	<= "0000";
							pxbus_reg_br	<= "0000";
						else
							-- XバスからのCRライト
							if (xbus_wr_cr = '1') then
								if (XBUS_DATA_IN(1) = '1') then
									pxbus_reg_en	<= "1111";
								else
									pxbus_reg_en	<= "0000";
								end if;
								if (XBUS_DATA_IN(2) = '1') then
									pxbus_reg_br	<= "1111";
								else
									pxbus_reg_br	<= "0000";
								end if;
							end if;
						end if;
						
						-- XバスからのDUTYnライト
						if (xbus_wr_duty(0) = '1') then
							pxbus_reg_duty0	<= signed(XBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (xbus_wr_duty(1) = '1') then
							pxbus_reg_duty1	<= signed(XBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (xbus_wr_duty(2) = '1') then
							pxbus_reg_duty2	<= signed(XBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
						if (xbus_wr_duty(3) = '1') then
							pxbus_reg_duty3	<= signed(XBUS_DATA_IN(DUTY_WIDTH downto 0));
						end if;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	
	
	
	
	
	
	-- PWM信号生成
	QPWMGEN : PWMGeneratorQuad
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
			PWM_OUT_0		=> PWM_OUT_0,
			PWM_OUT_1		=> PWM_OUT_1,
			PWM_OUT_2		=> PWM_OUT_2,
			PWM_OUT_3		=> PWM_OUT_3,
			nRESET_OUT_0	=> nRESET_OUT_0,
			nRESET_OUT_1	=> nRESET_OUT_1,
			nRESET_OUT_2	=> nRESET_OUT_2,
			nRESET_OUT_3	=> nRESET_OUT_3,
			nFAULT_IN		=> nFAULT_IN,
			nOTW_IN			=> nOTW_IN,
			REG_DUTY_0		=> pxbus_reg_duty0,
			REG_DUTY_1		=> pxbus_reg_duty1,
			REG_DUTY_2		=> pxbus_reg_duty2,
			REG_DUTY_3		=> pxbus_reg_duty3,
			REG_OT			=> pxbus_reg_ot,
			REG_OC			=> pxbus_reg_oc,
			PHASE_EN_0		=> phase_en_0,
			PHASE_EN_1		=> phase_en_1,
			PHASE_EN_2		=> phase_en_2,
			PHASE_EN_3		=> phase_en_3,
			PHASE_POL_0		=> phase_pol_0,
			PHASE_POL_1		=> phase_pol_1,
			PHASE_POL_2		=> phase_pol_2,
			PHASE_POL_3		=> phase_pol_3
		);
	
	
	
	-- 相信号生成
	PHASEGEN0 : PhaseGenerator
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			WVU_UPDATE		=> BAWVU_UPDATE,
			WVU_IN			=> BAWVU_IN_0(2 downto 0),
			PHASE_EN_OUT	=> phase_en_0,
			PHASE_POL_OUT	=> phase_pol_0,
			ENABLE_IN		=> pxbus_reg_en(0),
			BRAKE_IN		=> pxbus_reg_br(0),
			TEST_IN			=> pbus_reg_test,
			DIR_IN			=> pxbus_reg_duty0(DUTY_WIDTH)
		);
	
	PHASEGEN1 : PhaseGenerator
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			WVU_UPDATE		=> BAWVU_UPDATE,
			WVU_IN			=> BAWVU_IN_1(2 downto 0),
			PHASE_EN_OUT	=> phase_en_1,
			PHASE_POL_OUT	=> phase_pol_1,
			ENABLE_IN		=> pxbus_reg_en(1),
			BRAKE_IN		=> pxbus_reg_br(1),
			TEST_IN			=> pbus_reg_test,
			DIR_IN			=> pxbus_reg_duty1(DUTY_WIDTH)
		);
	
	PHASEGEN2 : PhaseGenerator
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			WVU_UPDATE		=> BAWVU_UPDATE,
			WVU_IN			=> BAWVU_IN_2(2 downto 0),
			PHASE_EN_OUT	=> phase_en_2,
			PHASE_POL_OUT	=> phase_pol_2,
			ENABLE_IN		=> pxbus_reg_en(2),
			BRAKE_IN		=> pxbus_reg_br(2),
			TEST_IN			=> pbus_reg_test,
			DIR_IN			=> pxbus_reg_duty2(DUTY_WIDTH)
		);
	
	PHASEGEN3 : PhaseGenerator
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			WVU_UPDATE		=> BAWVU_UPDATE,
			WVU_IN			=> BAWVU_IN_3(2 downto 0),
			PHASE_EN_OUT	=> phase_en_3,
			PHASE_POL_OUT	=> phase_pol_3,
			ENABLE_IN		=> pxbus_reg_en(3),
			BRAKE_IN		=> pxbus_reg_br(3),
			TEST_IN			=> pbus_reg_test,
			DIR_IN			=> pxbus_reg_duty3(DUTY_WIDTH)
		);
	
	
	
	-- エンコーダ入力
	QDEC0 : QuadratureDecoder
		generic map(
			OUT_WIDTH		=> DEC_WIDTH
		)
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			BA_UPDATE		=> BAWVU_UPDATE,
			BA_IN			=> BAWVU_IN_0(4 downto 3),
			DEC_LATCH		=> OMSP_SYNC,
			DEC_OUT			=> pxbus_reg_rot0
		);
	
	QDEC1 : QuadratureDecoder
		generic map(
			OUT_WIDTH		=> DEC_WIDTH
		)
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			BA_UPDATE		=> BAWVU_UPDATE,
			BA_IN			=> BAWVU_IN_1(4 downto 3),
			DEC_LATCH		=> OMSP_SYNC,
			DEC_OUT			=> pxbus_reg_rot1
		);
	
	QDEC2 : QuadratureDecoder
		generic map(
			OUT_WIDTH		=> DEC_WIDTH
		)
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			BA_UPDATE		=> BAWVU_UPDATE,
			BA_IN			=> BAWVU_IN_2(4 downto 3),
			DEC_LATCH		=> OMSP_SYNC,
			DEC_OUT			=> pxbus_reg_rot2
		);
	
	QDEC3 : QuadratureDecoder
		generic map(
			OUT_WIDTH		=> DEC_WIDTH
		)
		port map(
			CLK_SYS			=> CLK_SYS,
			RESET			=> RESET,
			BA_UPDATE		=> BAWVU_UPDATE,
			BA_IN			=> BAWVU_IN_3(4 downto 3),
			DEC_LATCH		=> OMSP_SYNC,
			DEC_OUT			=> pxbus_reg_rot3
		);
	
	
	
	
end;
 