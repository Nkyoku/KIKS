--!	@file
--!	@brief UARTテスト用の送信プロシージャ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

package UARTTest_pkg is
	procedure UART_Send(
		signal tx	: out	std_logic;
		baudrate	: in	integer;
		data		: in	std_logic_vector(7 downto 0)
	);
	
	
	
	
	
	
	
end UARTTest_pkg;



---- パッケージ本体 ------------------------------------------------------------

package body UARTTest_pkg is
	
	
	procedure UART_Send(
		signal tx	: out	std_logic;
		baudrate	: in	integer;
		data		: in	std_logic_vector(7 downto 0)
	) is
	constant period	: time := 1 sec / baudrate;
	begin
		tx	<= '0';
		wait for period;
		
		for cnt in 0 to 7 loop
			tx <= data(cnt);
			wait for period;
		end loop;
		
		tx	<= '1';
		wait for period;
		
	end UART_Send;
	
	
	
	
	
	
	
	
	
	
end UARTTest_pkg;

