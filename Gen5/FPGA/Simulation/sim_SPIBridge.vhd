library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.misc_pkg.all;
use work.SPIBridge_pkg.all;
use work.SPITest_pkg.all;



entity TestBenchSPIBridge is
end TestBenchSPIBridge;



architecture Simulation of TestBenchSPIBridge is

	signal clk_sys		: std_logic;
	signal clk_per		: std_logic;
	
	signal reset		: std_logic;
	
	signal spi_ncs		: std_logic;
	signal spi_sclk		: std_logic;
	signal spi_mosi		: std_logic;
	signal spi_miso		: std_logic;
	
	signal pbus_en		: std_logic;
	signal pbus_wr		: std_logic;
	signal pbus_wait	: std_logic := '1';
	signal pbus_addr	: std_logic_vector(15 downto 0);
	signal pbus_din		: std_logic_vector(15 downto 0) := X"A581";
	signal pbus_dout	: std_logic_vector(15 downto 0);



begin
	BUSMST : SPIBridge
		port map(
			CLK_SYS			=> clk_sys,
			CLK_ALT			=> clk_sys,
			
			RESET			=> reset,
			
			SPI_nCS			=> spi_ncs,
			SPI_SCLK		=> spi_sclk,
			SPI_MOSI		=> spi_mosi,
			SPI_MISO		=> spi_miso,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_din,
			PBUS_DATA_OUT	=> pbus_dout
		);
	
	
	
	
	-- クロック生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	CLK_PER_process : process begin
		clk_per <= '1';
		wait for 3.472 ns;
		clk_per <= '0';
		wait for 3.472 ns;
	end process;
	
	
	
	-- データ生成
	Signal_process : process begin
		spi_ncs		<= '1';
		spi_sclk	<= '0';
		spi_mosi	<= '1';
		
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 100 ns;
		
		-- フレーム0
		spi_ncs		<= '0';
		wait for 150 ns;
		SPISend(spi_sclk, spi_mosi, X"03A1" or X"6000");	-- Continuous Write
		SPISend(spi_sclk, spi_mosi, X"0002");
		SPISend(spi_sclk, spi_mosi, X"4321");
		SPISend(spi_sclk, spi_mosi, X"C898");
		SPISend(spi_sclk, spi_mosi, X"C898");
		SPISend(spi_sclk, spi_mosi, X"C898");
		SPISend(spi_sclk, spi_mosi, X"C898");
		SPISend(spi_sclk, spi_mosi, X"C898");
		wait for 50 ns;
		spi_ncs		<= '1';
		
		wait for 500 ns;
		
		-- フレーム1
		spi_ncs		<= '0';
		wait for 150 ns;
		SPISend(spi_sclk, spi_mosi, X"12CB" or X"A000");	-- Continuous Read
		SPISend(spi_sclk, spi_mosi, X"0002");
		SPISend(spi_sclk, spi_mosi, X"1111");
		SPISend(spi_sclk, spi_mosi, X"2222");
		SPISend(spi_sclk, spi_mosi, X"3333");
		SPISend(spi_sclk, spi_mosi, X"4444");
		wait for 50 ns;
		spi_ncs		<= '1';
		
		wait for 500 ns;
		
		-- バーストライト
		-- spi_ncs		<= '0';
		-- wait for 50 ns;
		-- SPISend(spi_sclk, spi_mosi, X"0001");
		-- for cnt in 0 to 8195 loop
			-- SPISend(spi_sclk, spi_mosi, X"A5C3");
		-- end loop;
		-- wait for 50 ns;
		-- spi_ncs		<= '1';
		
		
		
		
		
		
		
		wait for 200 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	-- バス信号生成
	Bus_process : process begin
		--mem_din	<= X"A5A5";
		
		
		wait;
	end process;
	
end;
