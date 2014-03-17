library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.synchronizer_pkg.all;



entity TestBenchSyncronizer is
end TestBenchSyncronizer;



architecture Simulation of TestBenchSyncronizer is
	
	signal clk1			: std_logic := '0';
	signal clk2			: std_logic := '0';
	
	signal sigi_clk1	: std_logic := '0';
	signal sigo_clk2	: std_logic := '0';
	signal sigi_clk2	: std_logic := '0';
	signal sigo_clk1	: std_logic := '0';
	


begin
	UNIHS12 : UnidirHandshake port map(clk2, sigo_clk2, clk1, sigi_clk1);
	UNIHS21 : UnidirHandshake port map(clk1, sigo_clk1, clk2, sigi_clk2);
	
	
	
	-- 50MHz生成
	CLK1_process : process begin
		clk1 <= '1';
		wait for 10.000 ns;
		clk1 <= '0';
		wait for 10.000 ns;
	end process;
	
	-- 約100MHz生成
	CLK2_process : process begin
		clk2 <= '1';
		wait for 3 ns;
		clk2 <= '0';
		wait for 3 ns;
	end process;
	
	-- データ生成
	Data1_process : process begin
		wait for 100 ns;
		wait until rising_edge(clk1);
		sigi_clk1 <= '1';
		wait until rising_edge(clk1);
		wait until rising_edge(clk1);
		wait until rising_edge(clk1);
		sigi_clk1 <= '0';
		wait until rising_edge(clk1);
		wait until rising_edge(clk1);
		sigi_clk1 <= '1';
		wait until rising_edge(clk1);
		sigi_clk1 <= '0';
		
		wait for 200 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	Data2_process : process begin
		wait for 100 ns;
		wait until rising_edge(clk2);
		sigi_clk2 <= '1';
		wait until rising_edge(clk2);
		sigi_clk2 <= '0';
		
		wait;
	end process;
	
	
	
	
	
end;
