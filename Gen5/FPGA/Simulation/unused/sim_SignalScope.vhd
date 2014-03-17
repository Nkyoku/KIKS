library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library work;
use work.misc_pkg.all;
use work.SignalScope_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchSignalScope is
end TestBenchSignalScope;



architecture Simulation of TestBenchSignalScope is
	
	signal clk_sys		: std_logic;
	signal clk_per		: std_logic;
	
	signal reset		: std_logic;
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wait		: std_logic;
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	signal sync			: std_logic;
	signal data0		: std_logic_vector(15 downto 0) := X"0000";
	signal data1		: std_logic_vector(15 downto 0) := X"0000";
	signal data2		: std_logic_vector(15 downto 0) := X"0000";
	signal data3		: std_logic_vector(15 downto 0) := X"0000";
	
	
	
begin
	SIGSCP : SignalScope
		generic map(
			BASE_ADDRESS	=> X"1800"
		)
		port map(
			CLK_SYS			=> clk_sys,
			
			RESET			=> reset,
			
			SYNC_IN			=> sync,
			CH0_DATA		=> data0,
			CH1_DATA		=> data1,
			CH2_DATA		=> data2,
			CH3_DATA		=> data3,
			
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
		wait for 10.417 ns;
		clk_sys <= '0';
		wait for 10.417 ns;
	end process;
	
	-- 同期信号生成
	SYNC_process : process begin
		sync <= '0';
		wait for 100 ns;
		loop1 : loop
			sync <= '1';
			wait for 100 ns;
			sync <= '0';
			wait for 100 ns;
		end loop;
	end process;
	
	-- 観測信号生成 CH0
	CH0_process : process begin
		data0	<= data0 + 1;
		wait for 200 ns;
	end process;
	
	-- 観測信号生成 CH1
	CH1_process : process begin
		data1	<= data1 + 2;
		wait for 200 ns;
	end process;
	
	-- 観測信号生成 CH2
	CH2_process : process begin
		data2	<= data2 + 3;
		wait for 200 ns;
	end process;
	
	-- 観測信号生成 CH3
	CH3_process : process begin
		data3	<= data3 + 4;
		wait for 200 ns;
	end process;
	
	-- バス信号生成
	Bus_process : process begin
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 900 ns;
		
		-- バス操作
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"1800", X"800F");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1801");
		--BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"1800", X"0069");
		--BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"1802", X"8800");
		
		--wait for 100 us;
		--BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0102", X"FFFF");
		
		wait for 110 us;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1801");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1810");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1811");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1812");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1813");
		
		wait for 100 ns;
		
		for cnt in 0 to 1023 loop
			BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1810");
			BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1811");
			BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1812");
			BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"1813");
		end loop;
		
		
		wait for 100 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
end;
