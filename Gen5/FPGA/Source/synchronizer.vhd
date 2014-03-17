--!	@file
--!	@brief シンクロナイザ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package Synchronizer_pkg is
	-- 二重FFシンクロナイザ
	component DoubleFF is
		generic(
			INIT		: std_logic := '0'
		);
		port(
			signal CLKO	: in	std_logic;
			signal O	: out	std_logic;
			signal I	: in	std_logic
		);
	end component;
	
	-- 片方向ハンドシェーク
	component UnidirHandshake is
		port(
			signal CLKO	: in	std_logic;
			signal O	: out	std_logic;
			signal CLKI	: in	std_logic;
			signal I	: in	std_logic
		);
	end component;
	
	
	
	
end Synchronizer_pkg;



---- 二重FFシンクロナイザ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity DoubleFF is
	generic(
		INIT		: std_logic := '0'
	);
	port(
		signal CLKO	: in	std_logic;
		signal O	: out	std_logic;
		signal I	: in	std_logic
	);
end;

architecture RTL of DoubleFF is
	signal ff1	: std_logic := INIT;
	signal ff2	: std_logic := INIT;
begin
	O <= ff2;
	process(CLKO)
	begin
		if (rising_edge(CLKO)) then
			ff1 <= I;
			ff2 <= ff1;
		end if;
	end process;
end;





---- 片方向ハンドシェーク --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity UnidirHandshake is
	port(
		signal CLKO	: in	std_logic;
		signal O	: out	std_logic;
		signal CLKI	: in	std_logic;
		signal I	: in	std_logic
	);
end;

architecture RTL of UnidirHandshake is
	signal req		: std_logic := '0';
	signal req_ff1	: std_logic := '0';
	signal req_ff2	: std_logic := '0';
	signal ack		: std_logic := '0';
	signal ack_ff1	: std_logic := '0';
	signal ack_ff2	: std_logic := '0';
begin
	process(CLKI)
	begin
		if (rising_edge(CLKI)) then
			req <= I or (req and not ack_ff2);
			ack_ff1 <= ack;
			ack_ff2 <= ack_ff1;
		end if;
	end process;
	
	O <= not ack and req_ff2;
	process(CLKO)
	begin
		if (rising_edge(CLKO)) then
			req_ff1 <= req or I;
			req_ff2 <= req_ff1;
			ack <= req_ff2;
		end if;
	end process;
end;


