--!	@file
--!	@brief DRV8312/32の三相信号を生成



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package PhaseGenerator_pkg is
	component PhaseGenerator is
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			
			WVU_UPDATE		: in	std_logic;
			WVU_IN			: in	std_logic_vector(2 downto 0);
			
			PHASE_EN_OUT	: out	std_logic_vector(2 downto 0);
			PHASE_POL_OUT	: out	std_logic_vector(2 downto 0);
			
			ENABLE_IN		: in	std_logic;
			BRAKE_IN		: in	std_logic;
			TEST_IN			: in	std_logic_vector(1 downto 0);
			DIR_IN			: in	std_logic
		);
	end component;
end PhaseGenerator_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;

entity PhaseGenerator is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- ホールセンサー
		WVU_UPDATE		: in	std_logic;
		WVU_IN			: in	std_logic_vector(2 downto 0);
		
	-- ゲート信号出力
		PHASE_EN_OUT	: out	std_logic_vector(2 downto 0);
		PHASE_POL_OUT	: out	std_logic_vector(2 downto 0);
		
	-- 制御入力
		ENABLE_IN		: in	std_logic;
		BRAKE_IN		: in	std_logic;
		TEST_IN			: in	std_logic_vector(1 downto 0);
		DIR_IN			: in	std_logic
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of PhaseGenerator is
	
	
	-- ホールセンサー
	signal hall_wvu_ff		: std_logic_vector(2 downto 0) := "000";
	signal hall_wvu_in		: std_logic_vector(2 downto 0) := "000";
	signal hall_wvu_xor		: std_logic_vector(2 downto 0);
	
	-- ゲート信号
	signal phase_en_mux		: std_logic_vector(2 downto 0);
	signal phase_pol_mux	: std_logic_vector(2 downto 0);
	signal phase_en_hall	: std_logic_vector(2 downto 0);	-- ホールセンサーによるゲート信号
	signal phase_pol_hall	: std_logic_vector(2 downto 0);
	signal phase_en_test	: std_logic_vector(2 downto 0);	-- テスト出力によるゲート信号
	signal phase_pol_test	: std_logic_vector(2 downto 0);
	
	
	
	
begin
	
	-- ホールセンサーからゲート信号を生成
	hall_wvu_xor	<= xor_vector(hall_wvu_in, DIR_IN);
	with hall_wvu_xor select
	phase_en_hall	<=	"101"	when "001",
						"011"	when "010",
						"110"	when "011",
						"110"	when "100",
						"011"	when "101",
						"101"	when "110",
						"000"	when others;
	with hall_wvu_xor select
	phase_pol_hall	<=	"001"	when "001",
						"010"	when "010",
						"010"	when "011",
						"100"	when "100",
						"001"	when "101",
						"100"	when "110",
						"000"	when others;
	
	-- テスト出力からゲート信号を生成
	with TEST_IN select
	phase_en_test	<=	"001"	when "01",
						"010"	when "10",
						"100"	when "11",
						"000"	when others;
	with TEST_IN select
	phase_pol_test	<=	"001"	when "01",
						"010"	when "10",
						"100"	when "11",
						"000"	when others;
	
	-- マルチプレクス
	phase_en_mux	<= phase_en_hall when TEST_IN = "00" else phase_en_test;
	phase_pol_mux	<= phase_pol_hall when TEST_IN = "00" else phase_pol_test;
	
	-- 出力
	PHASE_EN_OUT	<= and_vector(or_vector(phase_en_mux, BRAKE_IN), ENABLE_IN);
	PHASE_POL_OUT	<= and_vector(and_vector(phase_pol_mux, not BRAKE_IN), ENABLE_IN);
	
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			if (RESET = '1') then
				-- リセット
				hall_wvu_ff	<= "000";
				hall_wvu_in	<= "000";
				
			else
				if (WVU_UPDATE = '1') then
					-- 入力信号のフィルタリング
					hall_wvu_ff	<= WVU_IN;
					if (hall_wvu_ff = WVU_IN) then
						hall_wvu_in	<= hall_wvu_ff;
					end if;
				end if;
			end if;
		end if;
	end process;
	
	
	
	
	
	
end;
 