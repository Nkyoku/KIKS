--!	@file
--!	@brief メモリーバスアクセスのシミュレート



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package BusTest_pkg is
	procedure BusWrite(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wr	: out	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		signal mem_dout	: out	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0);
		data			: in	std_logic_vector(15 downto 0)
	);
	
	procedure BusRead(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wait	: in	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0)
	);
	
	procedure BusWaitUntilBitIsSet(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wait	: in	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		signal mem_din	: in	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0);
		flag			: integer
	);
	
	
	
	
end BusTest_pkg;



---- パッケージ本体 ------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

package body BusTest_pkg is
	
	
	procedure BusWrite(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wr	: out	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		signal mem_dout	: out	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0);
		data			: in	std_logic_vector(15 downto 0)
	) is
	begin
		-- メモリーライト
		wait until rising_edge(clk);
		
		wait for 1 ns;
		mem_en		<= '1';
		mem_wr		<= '1';
		mem_addr	<= addr;
		mem_dout	<= data;
		
		wait until rising_edge(clk);
		
		wait for 1 ns;
		mem_en		<= '0';
		mem_wr		<= '0';
		mem_addr	<= X"0000";
		mem_dout	<= X"0000";
		
	end BusWrite;
	
	
	
	procedure BusRead(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wait	: in	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0)
	) is
	begin
		-- メモリーリード
		wait until rising_edge(clk);
		
		--wait for 1 ns;
		mem_en		<= '1';
		mem_addr	<= addr;
		
		wait until rising_edge(clk);
		if (mem_wait = '1') then
			wait until rising_edge(clk);
		end if;
		
		--wait for 1 ns;
		mem_en		<= '0';
		mem_addr	<= X"0000";
		
	end BusRead;
	
	
	
	procedure BusWaitUntilBitIsSet(
		signal clk		: in	std_logic;
		signal mem_en	: out	std_logic;
		signal mem_wait	: in	std_logic;
		signal mem_addr	: out	std_logic_vector(15 downto 0);
		signal mem_din	: in	std_logic_vector(15 downto 0);
		addr			: in	std_logic_vector(15 downto 0);
		flag			: integer
	) is
	variable data		: std_logic_vector(15 downto 0);
	begin
		loop1 : loop
			-- メモリーリード
			wait until rising_edge(clk);
			wait for 1 ns;
			
			mem_en		<= '1';
			mem_addr	<= addr;
			
			wait until rising_edge(clk);
			if (mem_wait = '1') then
				wait until rising_edge(clk);
			end if;
			
			data		:= mem_din;
			
			wait for 1 ns;
			mem_en		<= '0';
			mem_addr	<= X"0000";
			
			if (data(flag) = '1') then
				exit;
			end if;
			
			-- 4クロック待つ
			wait until rising_edge(clk);
			wait until rising_edge(clk);
			wait until rising_edge(clk);
			wait until rising_edge(clk);
		end loop loop1;
	end BusWaitUntilBitIsSet;
	
	
	
	
	
end BusTest_pkg;






