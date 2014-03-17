--!	@file
--!	@brief 波形観測部のメモリー



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package SignalScope_Mem_pkg is
	
	constant LOG_LENGTH		: integer := 11;
	
	component SignalScope_Mem is
		port(
			CLK_SYS			: in	std_logic;
			
			A_EN			: in	std_logic;
			A_WR			: in	std_logic;
			A_ADDR			: in	std_logic_vector(LOG_LENGTH-1 downto 0);
			A_DI			: in	std_logic_vector(15 downto 0);
			
			B_EN			: in	std_logic;
			B_ADDR			: in	std_logic_vector(LOG_LENGTH-1 downto 0);
			B_DO			: out	std_logic_vector(15 downto 0)
		);
	end component;
end SignalScope_Mem_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library work;
use work.SignalScope_Mem_pkg.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity SignalScope_Mem is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- 入力ポート
		A_EN			: in	std_logic;
		A_WR			: in	std_logic;
		A_ADDR			: in	std_logic_vector(LOG_LENGTH-1 downto 0);
		A_DI			: in	std_logic_vector(15 downto 0);
		
	-- 出力ポート
		B_EN			: in	std_logic;
		B_ADDR			: in	std_logic_vector(LOG_LENGTH-1 downto 0);
		B_DO			: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of SignalScope_Mem is
	
	-- ブロックRAM
	signal ram_a_wr			: std_logic_vector(3 downto 0);
	signal ram_b_en			: std_logic;
	signal ram_b_do0		: std_logic_vector(31 downto 0);
	signal ram_b_do1		: std_logic_vector(31 downto 0);
	
begin
	
	ram_a_wr	<= A_WR & A_WR & A_WR & A_WR;
	ram_b_en	<= B_EN and not A_EN;
	B_DO		<= ram_b_do1(7 downto 0) & ram_b_do0(7 downto 0);
	
	-- ブロックRAM
	bram_inst0 : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 9,
			DATA_WIDTH_B	=> 9,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (8bit) 書き込み
			DOA					=> open,
			DOPA				=> open,
			DIA(7 downto 0)		=> A_DI(7 downto 0),
			DIA(31 downto 8)	=> X"000000",
			DIPA				=> "0000",
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 3)	=> A_ADDR,
			ADDRA(2 downto 0)	=> "000",
			ENA					=> A_EN,
			WEA					=> ram_a_wr,
			
			-- ポートB (8bit) 読み込み
			DOB					=> ram_b_do0,
			DOPB				=> open,
			DIB					=> X"00000000",
			DIPB				=> "0000",
			CLKB				=> CLK_SYS,
			ADDRB(13 downto 3)	=> B_ADDR,
			ADDRB(2 downto 0)	=> "000",
			ENB					=> ram_b_en,
			WEB					=> "0000",
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
		
	bram_inst1 : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 9,
			DATA_WIDTH_B	=> 9,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (8bit) 書き込み
			DOA					=> open,
			DOPA				=> open,
			DIA(7 downto 0)		=> A_DI(15 downto 8),
			DIA(31 downto 8)	=> X"000000",
			DIPA				=> "0000",
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 3)	=> A_ADDR,
			ADDRA(2 downto 0)	=> "000",
			ENA					=> A_EN,
			WEA					=> ram_a_wr,
			
			-- ポートB (8bit) 読み込み
			DOB					=> ram_b_do1,
			DOPB				=> open,
			DIB					=> X"00000000",
			DIPB				=> "0000",
			CLKB				=> CLK_SYS,
			ADDRB(13 downto 3)	=> B_ADDR,
			ADDRB(2 downto 0)	=> "000",
			ENB					=> ram_b_en,
			WEB					=> "0000",
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
	
end;
