--!	@file
--!	@brief データメモリー 2KB



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package openMSP430_DMem_pkg is
	component openMSP430_DMem is
		port(
			CLK_SYS			: in	std_logic;
			
			APORT_nEN		: in	std_logic;
			APORT_nWR		: in	std_logic_vector(1 downto 0);
			APORT_ADDR		: in	std_logic_vector(9 downto 0);
			APORT_DATA_IN	: in	std_logic_vector(15 downto 0);
			APORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			BPORT_nEN		: in	std_logic;
			BPORT_nWR		: in	std_logic_vector(1 downto 0);
			BPORT_ADDR		: in	std_logic_vector(9 downto 0);
			BPORT_DATA_IN	: in	std_logic_vector(15 downto 0);
			BPORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			DMA_EN			: in	std_logic;
			DMA_WR			: in	std_logic;
			DMA_ADDR		: in	std_logic_vector(8 downto 0);
			DMA_DATA_IN		: in	std_logic_vector(31 downto 0);
			DMA_DATA_OUT	: out	std_logic_vector(31 downto 0)
		);
	end component;
end openMSP430_DMem_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity openMSP430_DMem is
	port(
		CLK_SYS			: in	std_logic;
		
	-- Aバス
		APORT_nEN		: in	std_logic;
		APORT_nWR		: in	std_logic_vector(1 downto 0);
		APORT_ADDR		: in	std_logic_vector(9 downto 0);
		APORT_DATA_IN	: in	std_logic_vector(15 downto 0);
		APORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- Bバス
		BPORT_nEN		: in	std_logic;
		BPORT_nWR		: in	std_logic_vector(1 downto 0);
		BPORT_ADDR		: in	std_logic_vector(9 downto 0);
		BPORT_DATA_IN	: in	std_logic_vector(15 downto 0);
		BPORT_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- DMAポート
		DMA_EN			: in	std_logic;
		DMA_WR			: in	std_logic;
		DMA_ADDR		: in	std_logic_vector(8 downto 0);
		DMA_DATA_IN		: in	std_logic_vector(31 downto 0);
		DMA_DATA_OUT	: out	std_logic_vector(31 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of openMSP430_DMem is
	
	-- DMEM
	signal a_dmem_dout		: std_logic_vector(31 downto 0);
	signal a_dmem_en		: std_logic;
	signal a_dmem_wr		: std_logic_vector(1 downto 0);
	
	signal b_dmem_dout		: std_logic_vector(31 downto 0);
	signal b_dmem_en		: std_logic;
	signal b_dmem_wr		: std_logic_vector(1 downto 0);
	
	
	
begin
	
	-- DMEMポート
	a_dmem_en <= not APORT_nEN;
	b_dmem_en <= not BPORT_nEN;
	a_dmem_wr <= APORT_nWR xor "11";
	b_dmem_wr <= BPORT_nWR xor "11";
	APORT_DATA_OUT <= a_dmem_dout(15 downto 0);
	BPORT_DATA_OUT <= b_dmem_dout(15 downto 0);
	
	
	-- BRAM
	bram_inst0 : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 18,
			DATA_WIDTH_B	=> 36,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (16bit)
			DOA					=> a_dmem_dout,
			DOPA				=> open,
			DIA(15 downto 0)	=> APORT_DATA_IN,
			DIA(31 downto 16)	=> X"0000",
			DIPA				=> X"0",
			
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 4)	=> APORT_ADDR(9 downto 0),
			ADDRA(3 downto 0)	=> "0000",
			ENA					=> a_dmem_en,
			WEA(0)				=> a_dmem_wr(0),
			WEA(2)				=> a_dmem_wr(0),
			WEA(1)				=> a_dmem_wr(1),
			WEA(3)				=> a_dmem_wr(1),
			
			-- ポートB (32bit)
			DOB					=> DMA_DATA_OUT,
			DOPB				=> open,
			DIB					=> DMA_DATA_IN,
			DIPB				=> X"0",
			
			CLKB				=> CLK_SYS,
			ADDRB(13 downto 5)	=> DMA_ADDR,
			ADDRB(4 downto 0)	=> "00000",
			ENB					=> DMA_EN,
			WEB(0)				=> DMA_WR,
			WEB(1)				=> DMA_WR,
			WEB(2)				=> DMA_WR,
			WEB(3)				=> DMA_WR,
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
	
	bram_inst1 : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 18,
			DATA_WIDTH_B	=> 18,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (16bit)
			DOA					=> b_dmem_dout,
			DOPA				=> open,
			DIA(15 downto 0)	=> BPORT_DATA_IN,
			DIA(31 downto 16)	=> "0000000000000000",
			DIPA				=> "0000",
			
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 4)	=> BPORT_ADDR(9 downto 0),
			ADDRA(3 downto 0)	=> "0000",
			ENA					=> b_dmem_en,
			WEA(0)				=> b_dmem_wr(0),
			WEA(2)				=> b_dmem_wr(0),
			WEA(1)				=> b_dmem_wr(1),
			WEA(3)				=> b_dmem_wr(1),
			
			-- ポートB (16bit)
			DOB					=> open,
			DOPB				=> open,
			DIB(15 downto 0)	=> X"0000",
			DIB(31 downto 16)	=> X"0000",
			DIPB				=> X"0",
			
			CLKB				=> '0',
			ADDRB(13 downto 4)	=> "0000000000",
			ADDRB(3 downto 0)	=> "0000",
			ENB					=> '0',
			WEB					=> X"0",
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
	
end;
