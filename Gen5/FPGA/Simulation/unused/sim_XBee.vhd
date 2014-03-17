library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library work;
use work.misc_pkg.all;
use work.XBeeController_pkg.all;
use work.BusTest_pkg.all;
use work.UARTTest_pkg.all;



entity TestBenchXBee is
end TestBenchXBee;



architecture Simulation of TestBenchXBee is
	
	constant baudrate	: integer := 6000000;
	
	signal clk_sys		: std_logic;
	signal clk_per		: std_logic;
	
	signal reset		: std_logic;
	
	signal uart_tx		: std_logic;
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wait		: std_logic;
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);



begin
	XBEE : XBeeController
		generic map(
			BASE_ADDRESS=> X"0100"
		)
		port map(
			CLK_SYS		=> clk_sys,
			CLK_PER		=> clk_per,
			
			RESET		=> reset,
			
			UART_nRESET	=> open,
			UART_TX		=> open,
			UART_RX		=> uart_tx,
			UART_nCTS	=> '0',
			IRQ			=> open,
			
			MEM_EN		=> mem_en,
			MEM_WR		=> mem_wr,
			MEM_WAIT	=> mem_wait,
			MEM_ADDR	=> mem_addr,
			MEM_DATA_IN	=> mem_din,
			MEM_DATA_OUT=> mem_dout
		);
	
	
	
	-- クロック生成
	CLK1_process : process begin
		clk_sys <= '1';
		wait for 10.417 ns;
		clk_sys <= '0';
		wait for 10.417 ns;
	end process;
	
	CLK2_process : process begin
		clk_per <= '1';
		wait for 3.906 ns;
		clk_per <= '0';
		wait for 3.906 ns;
	end process;
	
	
	
	-- データ生成
	Signal_process : process begin
		uart_tx		<= '1';
		
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 100 ns;
		
		UART_Send(uart_tx, baudrate, X"A5");
		UART_Send(uart_tx, baudrate, X"C3");
		UART_Send(uart_tx, baudrate, X"96");
		UART_Send(uart_tx, baudrate, X"78");
		UART_Send(uart_tx, baudrate, X"0D");
		
		UART_Send(uart_tx, baudrate, X"13");
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		UART_Send(uart_tx, baudrate, X"13");
		UART_Send(uart_tx, baudrate, X"96");
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		UART_Send(uart_tx, baudrate, X"04");
		UART_Send(uart_tx, baudrate, X"72");
		UART_Send(uart_tx, baudrate, X"83");
		UART_Send(uart_tx, baudrate, X"91");
		UART_Send(uart_tx, baudrate, X"84");
		UART_Send(uart_tx, baudrate, X"85");
		UART_Send(uart_tx, baudrate, X"60");
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		wait for 400 ns;
		
		UART_Send(uart_tx, baudrate, X"15");
		UART_Send(uart_tx, baudrate, X"32");
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		UART_Send(uart_tx, baudrate, X"04");
		UART_Send(uart_tx, baudrate, X"07");
		UART_Send(uart_tx, baudrate, X"65");
		UART_Send(uart_tx, baudrate, X"87");
		UART_Send(uart_tx, baudrate, X"60");
		UART_Send(uart_tx, baudrate, X"09");
		UART_Send(uart_tx, baudrate, X"61");
		UART_Send(uart_tx, baudrate, X"20");
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		wait for 500 ns;
		
		UART_Send(uart_tx, baudrate, X"0D");
		UART_Send(uart_tx, baudrate, X"0A");
		
		
		
		wait for 2 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	-- バス信号生成
	Bus_process : process begin
		--mem_din	<= X"A5A5";
		
		wait for 10 us;
		
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0100", X"4803");
		
		wait for 10 us;
		
		BusWaitUntilBitIsSet(CLK_SYS, mem_en, mem_wait, mem_addr, mem_dout, X"0101", 1);
		
		wait for 100 ns;
		
		for cnt in 0 to 31 loop
			BusRead(CLK_SYS, mem_en, mem_wait, mem_addr, X"0120" or conv_std_logic_vector(cnt, 16));
		end loop;
		
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0100", X"0002");
		
		wait for 1 us;
		
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0100", X"0001");
		
		wait for 24 us;
		
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0100", X"0003");
		
		
		
		
		wait;
	end process;
	
end;
