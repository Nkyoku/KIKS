--!	@file
--!	@brief シフトレジスタを使った入出力



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package ShiftRegisterIO_pkg is
	component ShiftRegisterIO is
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			
			LED_CLK			: out	std_logic;
			LED_DO			: out	std_logic;
			
			MOT12_nLATCH	: out	std_logic;
			MOT12_CLK		: out	std_logic;
			MOT12_nDO		: in	std_logic;
			MOT345_nLATCH	: out	std_logic;
			MOT345_CLK		: out	std_logic;
			MOT345_nDO		: in	std_logic;
			
			LED_IN			: in	std_logic_vector(6 downto 0);
			BUZ_IN			: in	std_logic;
			
			MOT_UPDATE_OUT	: out	std_logic;
			MOT1_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
			MOT2_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
			MOT3_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
			MOT4_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
			MOT5_WVU_OUT	: out	std_logic_vector(2 downto 0);
			MOT12_POWERED	: out	std_logic;
			MOT345_POWERED	: out	std_logic
		);
	end component;
end ShiftRegisterIO_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

library work;
use work.misc_pkg.all;

entity ShiftRegisterIO is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
	
	-- リセット
		RESET			: in	std_logic;
	
	-- インジケータシリアル出力
		LED_CLK			: out	std_logic;
		LED_DO			: out	std_logic;
	
	-- モーターセンサーシリアル入力
		MOT12_nLATCH	: out	std_logic;
		MOT12_CLK		: out	std_logic;
		MOT12_nDO		: in	std_logic;		
		MOT345_nLATCH	: out	std_logic;
		MOT345_CLK		: out	std_logic;
		MOT345_nDO		: in	std_logic;
	
	-- インジケータ入力
		LED_IN			: in	std_logic_vector(6 downto 0);
		BUZ_IN			: in	std_logic;
	
	-- モーターセンサー出力
		MOT_UPDATE_OUT	: out	std_logic;
		MOT1_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
		MOT2_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
		MOT3_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
		MOT4_BAWVU_OUT	: out	std_logic_vector(4 downto 0);
		MOT5_WVU_OUT	: out	std_logic_vector(2 downto 0);
		MOT12_POWERED	: out	std_logic;
		MOT345_POWERED	: out	std_logic
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of ShiftRegisterIO is
	
	signal clk_sys_inv		: std_logic;
	
	-- インジケータ
	signal ind_cnt			: unsigned(7 downto 0) := "00000000";
	signal ind_sr			: std_logic_vector(7 downto 0) := X"00";
	signal ind_en			: std_logic;
	
	-- モーターセンサー
	signal mot_phase		: std_logic := '0';
	signal mot_cnt			: unsigned(3 downto 0) := "0000";
	signal mot_sr1			: std_logic_vector(15 downto 0) := X"0000";
	signal mot_sr2			: std_logic_vector(15 downto 0) := X"0000";
	
	signal mot12_clk_int	: std_logic := '0';
	signal mot345_clk_int	: std_logic := '0';
	signal mot12_nlatch_int		: std_logic := '1';
	signal mot345_nlatch_int	: std_logic := '1';
	
	signal mot_update_int	: std_logic := '0';
	signal mot1_bawvu_int	: std_logic_vector(4 downto 0) := "00000";
	signal mot2_bawvu_int	: std_logic_vector(4 downto 0) := "00000";
	signal mot3_bawvu_int	: std_logic_vector(4 downto 0) := "00000";
	signal mot4_bawvu_int	: std_logic_vector(4 downto 0) := "00000";
	signal mot5_wvu_int		: std_logic_vector(2 downto 0) := "000";
	signal mot12_pwred_int	: std_logic := '0';
	signal mot345_pwred_int	: std_logic := '0';
	
begin
	
	
	-- インジケータ
	ind_en	<= '1' when ind_cnt	< 8 else '0';
	LED_DO	<= ind_sr(7) and ind_en;
	
	clk_sys_inv <= not CLK_SYS;
	ind_oddr_inst : ODDR2
		generic map(
			DDR_ALIGNMENT	=> "C0",
			SRTYPE	=> "ASYNC"
		)
		port map(
			D0	=> '0',
			D1	=> '1',
			C0	=> CLK_SYS,
			C1	=> clk_sys_inv,
			CE	=> ind_en,
			R	=> '0',
			S	=> '0',
			Q	=> LED_CLK
		);
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			ind_cnt	<= ind_cnt + 1;
			if ((ind_cnt(2 downto 0) /= "111") or RESET = '1') then
				ind_sr	<= ind_sr(6 downto 0) & '0';
			else
				ind_sr	<= bit_swap(LED_IN) & BUZ_IN;
			end if;
		end if;
	end process;
	
	
	
	-- モーターセンサー
	MOT12_CLK		<= mot12_clk_int;
	MOT345_CLK		<= mot345_clk_int;
	MOT12_nLATCH	<= mot12_nlatch_int;
	MOT345_nLATCH	<= mot345_nlatch_int;
	MOT_UPDATE_OUT	<= mot_update_int;
	MOT1_BAWVU_OUT	<= mot1_bawvu_int;
	MOT2_BAWVU_OUT	<= mot2_bawvu_int;
	MOT3_BAWVU_OUT	<= mot3_bawvu_int;
	MOT4_BAWVU_OUT	<= mot4_bawvu_int;
	MOT5_WVU_OUT	<= mot5_wvu_int;
	MOT12_POWERED	<= mot12_pwred_int;
	MOT345_POWERED	<= mot345_pwred_int;
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			mot_phase <= not mot_phase;
			if (mot_phase = '0') then
				-- 正相
				mot12_clk_int	<= '0';
				mot345_clk_int	<= '0';
				
				mot_cnt	<= mot_cnt + 1;
				mot_sr1	<= mot_sr1(14 downto 0) & not MOT12_nDO;
				mot_sr2	<= mot_sr2(14 downto 0) & not MOT345_nDO;
				
				if (mot_cnt = 0) then
					mot_update_int	<= '1';
					mot1_bawvu_int	<= mot_sr1(0) & mot_sr1(1) & mot_sr1(5) & mot_sr1(7) & mot_sr1(6);
					mot2_bawvu_int	<= mot_sr1(12) & mot_sr1(13) & mot_sr1(11) & mot_sr1(9) & mot_sr1(10);
					mot3_bawvu_int	<= mot_sr2(0) & mot_sr2(1) & mot_sr2(5) & mot_sr2(7) & mot_sr2(6);
					mot4_bawvu_int	<= mot_sr2(12) & mot_sr2(13) & mot_sr2(10) & mot_sr2(8) & mot_sr2(9);
					mot5_wvu_int	<= mot_sr2(11) & mot_sr2(15) & mot_sr2(14);
					mot12_pwred_int	<= mot_sr1(8);
					mot345_pwred_int<= mot_sr2(4);
					
				else
					mot_update_int	<= '0';
				end if;
				
				if (mot_cnt = 15) then
					mot12_nlatch_int	<= '0';
					mot345_nlatch_int	<= '0';
				else
					mot12_nlatch_int	<= '1';
					mot345_nlatch_int	<= '1';
				end if;
				
			else
				-- 逆相
				mot12_clk_int	<= '1';
				mot345_clk_int	<= '1';
				
				mot_update_int	<= '0';
				
			end if;
		end if;
	end process;
	
	
	
	
	
end;
 