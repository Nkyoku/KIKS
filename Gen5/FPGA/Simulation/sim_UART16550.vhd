library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.WishboneBridge_pkg.all;
use work.UART16550_pkg.all;
use work.BusTest_pkg.all;
use work.UARTTest_pkg.all;



entity TestBenchUART16550 is
end TestBenchUART16550;



architecture Simulation of TestBenchUART16550 is
	
	constant baudrate	: integer := 115200;
	
	signal clk_sys		: std_logic;
	
	signal omsp_reset	: std_logic;
	
	signal uart_rx		: std_logic := '1';
	
	signal wb1_rst		: std_logic;
	signal wb1_cyc		: std_logic;
	signal wb1_stb		: std_logic;
	signal wb1_we		: std_logic;
	signal wb1_addr		: std_logic_vector(2 downto 0);
	signal wb1_dout		: std_logic_vector(7 downto 0);
	signal wb1_din		: std_logic_vector(7 downto 0);
	signal wb1_irq		: std_logic;
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wr2		: std_logic_vector(1 downto 0);
	signal mem_wait		: std_logic := '0';
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	
	
	
	


begin
	-- Wishboneブリッジ1 UART16550 (BBUS:0x0050～0x005F)
	WBRIDGE1 : WishboneBridge
		generic map(
			XBUS_BASE_ADDRESS	=> X"0050",
			XBUS_BASE_MASK		=> X"FFF0",
			WB_ADDR_WIDTH		=> 3
		)
		port map(
			CLK_SYS			=> clk_sys,
			OMSP_RESET		=> omsp_reset,
			IRQ_IN			=> wb1_irq,
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
	
	-- Wishbone1 UART16550 (BBUS:0x0050～0x005F)
	UARTCON : UART16550
		port map(
			wb_clk_i		=> clk_sys,
			wb_rst_i		=> wb1_rst,
			wb_adr_i		=> wb1_addr,
			wb_dat_i		=> wb1_dout,
			wb_dat_o		=> wb1_din,
			wb_we_i			=> wb1_we,
			wb_stb_i		=> wb1_stb,
			wb_cyc_i		=> wb1_cyc,
			wb_ack_o		=> open,
			wb_sel_i		=> "1111",
			int_o			=> wb1_irq,
			stx_pad_o		=> open,
			srx_pad_i		=> uart_rx,
			rts_pad_o		=> open,
			cts_pad_i		=> '0',
			dtr_pad_o		=> open,
			dsr_pad_i		=> '1',
			ri_pad_i		=> '1',
			dcd_pad_i		=> '1'
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
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0056", X"0080");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0052", X"0000");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"0018");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0056", X"0003");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0054", X"0007");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0052", X"0001");
		
		wait for 100 ns;
		
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"00A5");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"0091");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"0076");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"0077");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0050", X"0010");
		
		wait for 200 us;
		
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0054");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0050");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0050");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0050");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0050");
		wait for 50 ns;
		
		
		--wait for 1 ms;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- データ生成
	UartRx_process : process begin
		uart_rx <= '1';
		
		wait for 10 us;
		
		UART_Send(uart_rx, baudrate, X"72");
		UART_Send(uart_rx, baudrate, X"93");
		UART_Send(uart_rx, baudrate, X"74");
		UART_Send(uart_rx, baudrate, X"91");
		-- UART_Send(uart_rx, baudrate, X"72");
		-- UART_Send(uart_rx, baudrate, X"93");
		-- UART_Send(uart_rx, baudrate, X"74");
		-- UART_Send(uart_rx, baudrate, X"91");
		-- UART_Send(uart_rx, baudrate, X"72");
		-- UART_Send(uart_rx, baudrate, X"93");
		-- UART_Send(uart_rx, baudrate, X"74");
		-- UART_Send(uart_rx, baudrate, X"91");
		-- UART_Send(uart_rx, baudrate, X"72");
		-- UART_Send(uart_rx, baudrate, X"93");
		-- UART_Send(uart_rx, baudrate, X"74");
		-- UART_Send(uart_rx, baudrate, X"91");
		
		wait;
	end process;
	
	
	
	
	
	
end;
