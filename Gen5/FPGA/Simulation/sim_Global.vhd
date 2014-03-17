library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.SPITest_pkg.all;
use work.UARTTest_pkg.all;



entity TestBenchGlobal is
end TestBenchGlobal;



architecture Simulation of TestBenchGlobal is

	signal clk_in		: std_logic;
	
	signal spi_ncs		: std_logic;
	signal spi_sclk		: std_logic;
	signal spi_mosi		: std_logic;
	signal spi_miso		: std_logic;
	
	constant baudrate	: integer := 6000000;
	signal uart_tx		: std_logic;
	
	signal arbit		: std_logic := '0';
	
	
	
	
	component Main is
		port(
		-- クロック入力
			CLK_IN				: in	std_logic;
			
		-- 電源制御
			PWR_5V				: out	std_logic;
			
		-- 未使用
			nINIT				: out	std_logic;
			AUX0				: in	std_logic;
			AUX1				: in	std_logic;
			AUX2				: in	std_logic;
			
		-- SPIスレーブ
			SPI_nCS				: in	std_logic;
			SPI_SCLK			: in	std_logic;
			SPI_SCLK2			: in	std_logic;
			SPI_MOSI			: in	std_logic;
			SPI_MISO			: out	std_logic;
			
		-- モーター1
			MOT1_PWM_A			: out	std_logic;
			MOT1_PWM_B			: out	std_logic;
			MOT1_PWM_C			: out	std_logic;
			MOT1_nRESET_A		: out	std_logic;
			MOT1_nRESET_B		: out	std_logic;
			MOT1_nRESET_C		: out	std_logic;
			MOT1_nFAULT			: in	std_logic;
			MOT1_nOTW			: in	std_logic;
			
		-- モーター2
			MOT2_PWM_A			: out	std_logic;
			MOT2_PWM_B			: out	std_logic;
			MOT2_PWM_C			: out	std_logic;
			MOT2_nRESET_A		: out	std_logic;
			MOT2_nRESET_B		: out	std_logic;
			MOT2_nRESET_C		: out	std_logic;
			MOT2_nFAULT			: in	std_logic;
			MOT2_nOTW			: in	std_logic;
			
		-- モーター3
			MOT3_PWM_A			: out	std_logic;
			MOT3_PWM_B			: out	std_logic;
			MOT3_PWM_C			: out	std_logic;
			MOT3_nRESET_A		: out	std_logic;
			MOT3_nRESET_B		: out	std_logic;
			MOT3_nRESET_C		: out	std_logic;
			MOT3_nFAULT			: in	std_logic;
			MOT3_nOTW			: in	std_logic;
			
		-- モーター4
			MOT4_PWM_A			: out	std_logic;
			MOT4_PWM_B			: out	std_logic;
			MOT4_PWM_C			: out	std_logic;
			MOT4_nRESET_A		: out	std_logic;
			MOT4_nRESET_B		: out	std_logic;
			MOT4_nRESET_C		: out	std_logic;
			MOT4_nFAULT			: in	std_logic;
			MOT4_nOTW			: in	std_logic;
			
		-- モーター5
			MOT5_PWM_A			: out	std_logic;
			MOT5_PWM_B			: out	std_logic;
			MOT5_PWM_C			: out	std_logic;
			MOT5_nRESET_A		: out	std_logic;
			MOT5_nRESET_B		: out	std_logic;
			MOT5_nRESET_C		: out	std_logic;
			MOT5_nFAULT			: in	std_logic;
			MOT5_nOTW			: in	std_logic;
			
		-- モーター1,2 センサー
			MOT12_EN_SENSORS	: out	std_logic;
			MOT12_nLATCH		: out	std_logic;
			MOT12_CLK			: out	std_logic;
			MOT12_nDO			: in	std_logic;
			
		-- モーター3,4,5 センサー
			MOT345_EN_SENSORS	: out	std_logic;
			MOT345_nLATCH		: out	std_logic;
			MOT345_CLK			: out	std_logic;
			MOT345_nDO			: in	std_logic;
			
		-- ADC1
			ADC1_nCS			: out	std_logic;
			ADC1_SCLK			: out	std_logic;
			ADC1_MOSI			: out	std_logic;
			ADC1_MISO			: in	std_logic;
			
		-- ADC2
			ADC2_nCS			: out	std_logic;
			ADC2_SCLK			: out	std_logic;
			ADC2_MOSI			: out	std_logic;
			ADC2_MISO			: in	std_logic;
		
		-- モーター5 電流センサー
			MOT5_CUR_SDA		: inout	std_logic;
			MOT5_CUR_SCL		: inout	std_logic;
		
		-- nRF24L01
			EXT1_nCS			: out	std_logic;
			EXT1_SCLK			: out	std_logic;
			EXT1_MOSI			: out	std_logic;
			EXT1_MISO			: in	std_logic;
			EXT1_CE				: out	std_logic;
			EXT1_IRQ			: in	std_logic;
		
		-- ボール検知
			BALL_EN				: out	std_logic;
			BALL_SCL			: inout	std_logic;
			BALL_DETECT			: inout	std_logic;
		
		-- XBee
			XBEE_nRESET			: out	std_logic;
			XBEE_TX				: out	std_logic;
			XBEE_RX				: in	std_logic;
			XBEE_nCTS			: in	std_logic;
		
		-- LED・ブザー
			LED_CLK				: out	std_logic;
			LED_DO				: out	std_logic
		);
	end component;


begin
	
	Main_inst : Main
		port map(
		-- クロック入力
			CLK_IN			=> clk_in,
			
		-- 電源制御
			PWR_5V			=> open,
			
		-- 未使用
			nINIT			=> open,
			AUX0			=> '1',
			AUX1			=> '1',
			AUX2			=> '1',
			
		-- SPIスレーブ
			SPI_nCS			=> spi_ncs,
			SPI_SCLK		=> spi_sclk,
			SPI_SCLK2		=> '0',
			SPI_MOSI		=> spi_mosi,
			SPI_MISO		=> spi_miso,
			
		-- モーター1
			MOT1_PWM_A		=> open,
			MOT1_PWM_B		=> open,
			MOT1_PWM_C		=> open,
			MOT1_nRESET_A	=> open,
			MOT1_nRESET_B	=> open,
			MOT1_nRESET_C	=> open,
			MOT1_nFAULT		=> '1',
			MOT1_nOTW		=> '1',
			
		-- モーター2
			MOT2_PWM_A		=> open,
			MOT2_PWM_B		=> open,
			MOT2_PWM_C		=> open,
			MOT2_nRESET_A	=> open,
			MOT2_nRESET_B	=> open,
			MOT2_nRESET_C	=> open,
			MOT2_nFAULT		=> '1',
			MOT2_nOTW		=> '1',
			
		-- モーター3
			MOT3_PWM_A		=> open,
			MOT3_PWM_B		=> open,
			MOT3_PWM_C		=> open,
			MOT3_nRESET_A	=> open,
			MOT3_nRESET_B	=> open,
			MOT3_nRESET_C	=> open,
			MOT3_nFAULT		=> '1',
			MOT3_nOTW		=> '1',
			
		-- モーター4
			MOT4_PWM_A		=> open,
			MOT4_PWM_B		=> open,
			MOT4_PWM_C		=> open,
			MOT4_nRESET_A	=> open,
			MOT4_nRESET_B	=> open,
			MOT4_nRESET_C	=> open,
			MOT4_nFAULT		=> '1',
			MOT4_nOTW		=> '1',
			
		-- モーター5
			MOT5_PWM_A		=> open,
			MOT5_PWM_B		=> open,
			MOT5_PWM_C		=> open,
			MOT5_nRESET_A	=> open,
			MOT5_nRESET_B	=> open,
			MOT5_nRESET_C	=> open,
			MOT5_nFAULT		=> '1',
			MOT5_nOTW		=> '1',
			
		-- モーター1,2 センサー
			MOT12_EN_SENSORS=> open,
			MOT12_nLATCH	=> open,
			MOT12_CLK		=> open,
			MOT12_nDO		=> '1',
			
		-- モーター3,4,5 センサー
			MOT345_EN_SENSORS=> open,
			MOT345_nLATCH	=> open,
			MOT345_CLK		=> open,
			MOT345_nDO		=> '1',
			
		-- ADC1
			ADC1_nCS		=> open,
			ADC1_SCLK		=> open,
			ADC1_MOSI		=> open,
			ADC1_MISO		=> '1',
			
		-- ADC2
			ADC2_nCS		=> open,
			ADC2_SCLK		=> open,
			ADC2_MOSI		=> open,
			ADC2_MISO		=> '1',
		
		-- モーター5 電流センサー
			MOT5_CUR_SDA	=> open,
			MOT5_CUR_SCL	=> open,
		
		-- nRF24L01
			EXT1_nCE		=> open,
			EXT1_SCLK		=> open,
			EXT1_MOSI		=> open,
			EXT1_MISO		=> '1',
			EXT1_CE			=> open,
			EXT1_IRQ		=> '1',
		
		-- ボール検知
			BALL_EN			=> open,
			BALL_SCL		=> open,
			BALL_DETECT		=> open,
		
		-- XBee
			XBEE_nRESET		=> open,
			XBEE_TX			=> open,
			XBEE_RX			=> uart_tx,
			XBEE_nCTS		=> '1',
		
		-- LED・ブザー
			LED_CLK			=> open,
			LED_DO			=> open
		);
	
	
	
	
	-- クロック生成
	CLK_process : process begin
		clk_in <= '0';
		wait for 20.833 ns;
		clk_in <= '1';
		wait for 20.833 ns;
	end process;
	
	
	
	-- SPIデータ生成
	SPI_process : process begin
		spi_ncs		<= '1';
		spi_sclk	<= '0';
		spi_mosi	<= '1';
		
		wait for 2 us;
		
		-- フレーム0
		spi_ncs		<= '0';
		wait for 50 ns;
		SPISend(spi_sclk, spi_mosi, X"0801");
		SPISend(spi_sclk, spi_mosi, X"4803");	-- 0x100 <= 0x4803
		SPISend(spi_sclk, spi_mosi, X"0000");
		SPISend(spi_sclk, spi_mosi, X"0000");	-- 0x102 <= 17
		wait for 50 ns;
		spi_ncs		<= '1';
		
		--wait for 10 us;
		
		wait until arbit = '1';
		
		-- フレームX
		spi_ncs		<= '0';
		wait for 50 ns;
		SPISend(spi_sclk, spi_mosi, X"1001");	-- 0x200 <= 0xFFFF
		SPISend(spi_sclk, spi_mosi, X"FFFF");
		wait for 50 ns;
		spi_ncs		<= '1';
		
		
		wait for 1 us;
		
		-- フレーム1
		spi_ncs		<= '0';
		wait for 50 ns;
		SPISend(spi_sclk, spi_mosi, X"0808");
		SPISend(spi_sclk, spi_mosi, X"0000");	-- 0x101
		wait for 50 ns;
		spi_ncs		<= '1';
		
		wait for 50 ns;
		
		-- フレーム2
		spi_ncs		<= '0';
		wait for 50 ns;
		SPISend(spi_sclk, spi_mosi, X"0801");	-- 0x0003
		SPISend(spi_sclk, spi_mosi, X"0003");
		wait for 50 ns;
		spi_ncs		<= '1';
		
		
		
		--wait for 200 ns;
		--assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- UART データ生成
	UART_process : process begin
		uart_tx		<= '1';
		
		wait for 5 us;
		
		UART_Send(uart_tx, baudrate, X"13");
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
		
		arbit	<= '1';
		
		
		wait for 10 us;
		
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	
	
	
	
	
end;
