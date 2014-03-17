library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.WishboneBridge_pkg.all;
use work.SimpleSPI_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchSimpleSPI is
end TestBenchSimpleSPI;



architecture Simulation of TestBenchSimpleSPI is
	
	signal clk_sys		: std_logic;
	
	signal omsp_reset	: std_logic;
	
	signal spi_miso		: std_logic := '1';
	
	signal wb1_rst		: std_logic;
	signal wb1_cyc		: std_logic;
	signal wb1_stb		: std_logic;
	signal wb1_we		: std_logic;
	signal wb1_addr		: std_logic_vector(1 downto 0);
	signal wb1_dout		: std_logic_vector(7 downto 0);
	signal wb1_din		: std_logic_vector(7 downto 0);
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wr2		: std_logic_vector(1 downto 0);
	signal mem_wait		: std_logic := '0';
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	
	
	
	


begin
	-- Wishboneブリッジ1 SimpleSPI (BBUS:0x0060～0x0067)
	WBRIDGE1 : WishboneBridge
		generic map(
			XBUS_BASE_ADDRESS	=> X"0060",
			XBUS_BASE_MASK		=> X"FFF8",
			WB_ADDR_WIDTH		=> 2
		)
		port map(
			CLK_SYS			=> clk_sys,
			OMSP_RESET		=> omsp_reset,
			IRQ_IN			=> '0',
			IRQ_OUT			=> open,
			IRQ_ACC			=> '1',
			WB_RST_O		=> wb1_rst,
			WB_CYC_O		=> wb1_cyc,
			WB_STB_O		=> wb1_stb,
			WB_WE_O			=> wb1_we,
			WB_ADDR_O		=> wb1_addr,
			WB_DAT_O		=> wb1_dout,
			WB_DAT_I		=> wb1_din,
			XBUS_EN			=> mem_en,
			XBUS_WR			=> mem_wr2,
			XBUS_ADDR		=> mem_addr,
			XBUS_DATA_IN	=> mem_din,
			XBUS_DATA_OUT	=> mem_dout
		);
	
	-- Wishbone1 SimpleSPI
	SPIMST : SimpleSPI
		port map(
			clk_i			=> clk_sys,
			rst_i			=> wb1_rst,
			cyc_i			=> wb1_cyc,
			stb_i			=> wb1_stb,
			adr_i			=> wb1_addr,
			we_i			=> wb1_we,
			dat_i			=> wb1_dout,
			dat_o			=> wb1_din,
			ack_o			=> open,
			inta_o			=> open,
			sck_o			=> open,
			mosi_o			=> open,
			miso_i			=> spi_miso
		);
	
	-- 45MHz生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	-- データ生成
	mem_wr2 <= mem_wr & mem_wr;
	Bus_process : process begin
		-- リセット
		omsp_reset	<= '1';
		wait for 100 ns;
		omsp_reset	<= '0';
		wait for 1 us;
		
		-- バスアクセス
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0066", X"0001");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0060", X"0051");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0062", X"00C0");
		
		wait for 100 ns;
		
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0064", X"0072");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0064", X"0091");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0064", X"0074");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0064", X"0083");
		
		wait for 100 us;
		
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0062");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0064");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0064");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0064");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0064");
		wait for 50 ns;
		
		
		wait for 1 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	
	
	
end;
