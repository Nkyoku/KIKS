--!	@file
--!	@brief プログラムメモリー 8KB



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package openMSP430_PMem_pkg is
	component openMSP430_PMem is
		port(
			CLK_SYS			: in	std_logic;
			
			RUNNING			: in	std_logic;
			
			APORT_nEN		: in	std_logic;
			APORT_ADDR		: in	std_logic_vector(12 downto 0);
			APORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			BPORT_nEN		: in	std_logic;
			BPORT_ADDR		: in	std_logic_vector(12 downto 0);
			BPORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			PROG_WR			: in	std_logic;
			PROG_ADDR		: in	std_logic_vector(12 downto 0);
			PROG_DATA_IN	: in	std_logic_vector(15 downto 0)
		);
	end component;
end openMSP430_PMem_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library UNISIM;
use UNISIM.Vcomponents.all;

library work;
use work.misc_pkg.all;

entity openMSP430_PMem is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- プログラミング中フラグ
		RUNNING			: in	std_logic;
		
	-- Aバス
		APORT_nEN		: in	std_logic;
		APORT_ADDR		: in	std_logic_vector(12 downto 0);
		APORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- Bバス
		BPORT_nEN		: in	std_logic;
		BPORT_ADDR		: in	std_logic_vector(12 downto 0);
		BPORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- プログラムポート
		PROG_WR			: in	std_logic;
		PROG_ADDR		: in	std_logic_vector(12 downto 0);
		PROG_DATA_IN	: in	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of openMSP430_PMem is
	
	-- PMem
	signal a_pmem_addr		: std_logic_vector(12 downto 0);
	signal a_pmem_dout0		: std_logic_vector(31 downto 0);	-- MSB
	signal a_pmem_dout1		: std_logic_vector(31 downto 0);
	signal a_pmem_dout2		: std_logic_vector(31 downto 0);
	signal a_pmem_dout3		: std_logic_vector(31 downto 0);
	signal a_pmem_dout4		: std_logic_vector(31 downto 0);
	signal a_pmem_dout5		: std_logic_vector(31 downto 0);
	signal a_pmem_dout6		: std_logic_vector(31 downto 0);
	signal a_pmem_dout7		: std_logic_vector(31 downto 0);	-- LSB
	signal a_pmem_en		: std_logic;
	signal a_pmem_wr		: std_logic;
	signal a_pmem_wr4		: std_logic_vector(3 downto 0);
	
	signal b_pmem_dout0		: std_logic_vector(31 downto 0);	-- MSB
	signal b_pmem_dout1		: std_logic_vector(31 downto 0);
	signal b_pmem_dout2		: std_logic_vector(31 downto 0);
	signal b_pmem_dout3		: std_logic_vector(31 downto 0);
	signal b_pmem_dout4		: std_logic_vector(31 downto 0);
	signal b_pmem_dout5		: std_logic_vector(31 downto 0);
	signal b_pmem_dout6		: std_logic_vector(31 downto 0);
	signal b_pmem_dout7		: std_logic_vector(31 downto 0);	-- LSB
	signal b_pmem_en		: std_logic;
	
begin
	-- PMEM
	a_pmem_en <= not APORT_nEN or not RUNNING;
	b_pmem_en <= not BPORT_nEN and RUNNING;
	a_pmem_wr <= PROG_WR and not RUNNING;
	a_pmem_wr4 <= a_pmem_wr & a_pmem_wr & a_pmem_wr & a_pmem_wr;
	a_pmem_addr <= APORT_ADDR when RUNNING /= '0' else PROG_ADDR;
	APORT_DATA_OUT <= a_pmem_dout0(1 downto 0) & a_pmem_dout1(1 downto 0) & a_pmem_dout2(1 downto 0) & a_pmem_dout3(1 downto 0)
	                & a_pmem_dout4(1 downto 0) & a_pmem_dout5(1 downto 0) & a_pmem_dout6(1 downto 0) & a_pmem_dout7(1 downto 0);
	BPORT_DATA_OUT <= b_pmem_dout0(1 downto 0) & b_pmem_dout1(1 downto 0) & b_pmem_dout2(1 downto 0) & b_pmem_dout3(1 downto 0)
	                & b_pmem_dout4(1 downto 0) & b_pmem_dout5(1 downto 0) & b_pmem_dout6(1 downto 0) & b_pmem_dout7(1 downto 0);
	
	
	
	-- BRAM0 [15:14]
	bram_inst0 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout0,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(7 downto 6),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout0,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM1 [13:12]
	bram_inst1 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout1,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(5 downto 4),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout1,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM2 [11:10]
	bram_inst2 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout2,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(3 downto 2),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout2,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM3 [9:8]
	bram_inst3 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout3,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(1 downto 0),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout3,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM4 [7:6]
	bram_inst4 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout4,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(15 downto 14),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout4,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM5 [5:4]
	bram_inst5 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout5,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(13 downto 12),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout5,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM6 [3:2]
	bram_inst6 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout6,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(11 downto 10),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout6,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	-- BRAM7 [1:0]
	bram_inst7 : RAMB16BWER
	generic map(
		DATA_WIDTH_A	=> 2,
		DATA_WIDTH_B	=> 2,
		WRITE_MODE_A	=> "WRITE_FIRST",
		WRITE_MODE_B	=> "WRITE_FIRST",
		SIM_DEVICE		=> "SPARTAN6"
	)
	port map(
		-- ポートA (2bit)
		DOA					=> a_pmem_dout7,
		DOPA				=> open,
		DIA(1 downto 0)		=> PROG_DATA_IN(9 downto 8),
		DIA(3 downto 2)		=> "00",
		DIA(31 downto 4)	=> X"0000000",
		DIPA				=> X"0",
		
		CLKA				=> CLK_SYS,
		ADDRA(13 downto 1)	=> a_pmem_addr(12 downto 0),
		ADDRA(0)			=> '0',
		ENA					=> a_pmem_en,
		WEA					=> a_pmem_wr4,
		
		-- ポートB (2bit)
		DOB					=> b_pmem_dout7,
		DOPB				=> open,
		DIB					=> X"00000000",
		DIPB				=> X"0",
		
		CLKB				=> CLK_SYS,
		ADDRB(13 downto 1)	=> BPORT_ADDR(12 downto 0),
		ADDRB(0)			=> '0',
		ENB					=> b_pmem_en,
		WEB					=> X"0",
		
		-- リセット・レジスタ
		RSTA				=> '0',
		RSTB				=> '0',
		REGCEA				=> '1',
		REGCEB				=> '1'
	);
	
	
end;
 