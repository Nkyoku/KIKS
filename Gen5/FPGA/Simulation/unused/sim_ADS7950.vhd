library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library work;
use work.misc_pkg.all;
use work.ADS7950_pkg.all;
use work.BusTest_pkg.all;
use work.SPITest_pkg.all;


entity TestBenchADC is
end TestBenchADC;



architecture Simulation of TestBenchADC is
	
	constant baudrate	: integer := 6000000;
	
	signal clk_sys		: std_logic;
	signal clk_adc		: std_logic;
	
	signal reset		: std_logic;
	
	signal spi_ncs		: std_logic;
	signal spi_sclk		: std_logic;
	signal spi_mosi		: std_logic;
	signal spi_miso		: std_logic;
	
	signal sync			: std_logic;
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wait		: std_logic;
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);



begin
	ADC : ADS7950
		generic map(
			BASE_ADDRESS=> X"0000"
		)
		port map(
			CLK_SYS			=> clk_sys,
			CLK_ADC			=> clk_adc,
			
			RESET			=> reset,
			
			SPI1_nCS		=> spi_ncs,
			SPI1_SCLK		=> spi_sclk,
			SPI1_MOSI		=> spi_mosi,
			SPI1_MISO		=> spi_miso,
			
			SPI2_nCS		=> open,
			SPI2_SCLK		=> open,
			SPI2_MOSI		=> open,
			SPI2_MISO		=> '1',
			
			SYNC_IN			=> sync,
			
			CONVERTING		=> open,
			CONVERTED		=> open,
			RESULT10		=> open,
			RESULT11		=> open,
			RESULT12		=> open,
			RESULT13		=> open,
			RESULT20		=> open,
			RESULT21		=> open,
			RESULT22		=> open,
			RESULT23		=> open,
			
			MEM_EN			=> mem_en,
			MEM_WR			=> mem_wr,
			MEM_WAIT		=> mem_wait,
			MEM_ADDR		=> mem_addr,
			MEM_DATA_IN		=> mem_din,
			MEM_DATA_OUT	=> mem_dout
		);
	
	
	
	-- クロック生成
	CLK1_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	CLK2_process : process begin
		clk_adc <= '1';
		wait for 12.5 ns;
		clk_adc <= '0';
		wait for 12.5 ns;
	end process;
	
	SYNC_process : process begin
		sync <= '0';
		wait for 0.990 us;
		wait until rising_edge(clk_sys);
		sync <= '1';
		wait until rising_edge(clk_sys);
	end process;
	
	
	-- データ生成
	Signal_process : process begin
		spi_miso	<= '1';
		
		wait for 1 us;
		
		SPIReturn(spi_ncs, spi_sclk, spi_miso, X"8283");
		
		loop1 : loop
			SPIReturn(spi_ncs, spi_sclk, spi_miso, X"1765");
			SPIReturn(spi_ncs, spi_sclk, spi_miso, X"2876");
			SPIReturn(spi_ncs, spi_sclk, spi_miso, X"3961");
			SPIReturn(spi_ncs, spi_sclk, spi_miso, X"0123");
		end loop loop1;
		
		
		
		wait for 15 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	-- バス信号生成
	Bus_process : process begin
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 100 ns;
		
		wait for 1 us;
		
		-- バスアクセス
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0001", X"5A5A");
		
		--wait for 10 us;
		--BusRead(CLK_SYS, mem_en, mem_wait, mem_addr, X"0002");
		--wait for 1 us;
		
		wait for 2 us;
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0000", X"0001");
		
		wait for 5 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
end;
