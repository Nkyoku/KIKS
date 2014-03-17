--!	@file
--!	@brief SPIテスト用の送信プロシージャ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

package SPITest_pkg is
	procedure SPISend(
		signal spi_sclk	: out	std_logic;
		signal spi_data	: out	std_logic;
		data			: in	std_logic_vector(15 downto 0)
	);
	
	procedure SPIReturn(
		signal spi_ncs	: in	std_logic;
		signal spi_sclk	: in	std_logic;
		signal spi_data	: out	std_logic;
		data			: in	std_logic_vector(15 downto 0)
	);
	
	
	
	
	
end SPITest_pkg;



---- パッケージ本体 ------------------------------------------------------------

package body SPITest_pkg is
	
	
	procedure SPISend(
		signal spi_sclk	: out	std_logic;
		signal spi_data	: out	std_logic;
		data			: in	std_logic_vector(15 downto 0)
	) is
	constant period : time := 30 ns;
	begin
		for cnt in 0 to 15 loop
			spi_data <= data(15 - cnt);
			wait for period / 2;
			spi_sclk <= '1';
			wait for period / 2;
			spi_sclk <= '0';
		end loop;
		
		spi_data <= '0';
	end SPISend;
	
	
	
	procedure SPIReturn(
		signal spi_ncs	: in	std_logic;
		signal spi_sclk	: in	std_logic;
		signal spi_data	: out	std_logic;
		data			: in	std_logic_vector(15 downto 0)
	) is
	begin
		wait until spi_ncs = '0';
		
		for cnt in 0 to 15 loop
			spi_data <= data(15 - cnt);
			wait until falling_edge(spi_sclk);
		end loop;
	end SPIReturn;
	
	
	
	
	
	
	
	
end SPITest_pkg;

