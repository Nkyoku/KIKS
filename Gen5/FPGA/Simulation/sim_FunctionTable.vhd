library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.FunctionTable_pkg.all;



entity TestBenchFunctionTable is
end TestBenchFunctionTable;



architecture Simulation of TestBenchFunctionTable is
	
	signal clk_sys		: std_logic := '0';
	
	signal data_en		: std_logic := '0';
	signal data_done	: std_logic;
	signal data_sa		: std_logic_vector(5 downto 0) := "000000";
	signal data_in		: std_logic_vector(31 downto 0) := X"00000000";
	
	
	
	
	


begin
	-- CS_inst : CountingShifter
		-- port map(
			-- CLK_IN		=> clk_sys,
			-- DATA_EN		=> data_en,
			-- DATA_DONE	=> data_done,
			-- DATA_IN		=> data_in,
			-- DATA_OUT	=> open,
			-- DATA_SA		=> open
		-- );
	
	IS_inst : IterationalShifter
		port map(
			CLK_IN		=> clk_sys,
			DATA_EN		=> data_en,
			DATA_DONE	=> data_done,
			DATA_SA		=> data_sa,
			DATA_IN		=> data_in,
			DATA_OUT	=> open
		);
	
	-- 45MHz生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	-- データ生成
	-- CS_process : process begin
		-- wait for 100 ns;
		-- wait until falling_edge(clk_sys);
		
		-- data_en <= '1';
		-- data_in <= X"00000000";
		-- wait until (falling_edge(clk_sys) and data_done = '1');
		
		-- data_en <= '1';
		-- data_in <= X"00000001";
		-- wait until (falling_edge(clk_sys) and data_done = '1');
		
		
		-- wait for 200 ns;
		-- assert (false) report "Simulation End" severity failure;
		-- wait;
	-- end process;
	
	
	IS_process : process begin
		wait for 100 ns;
		wait until falling_edge(clk_sys);
		
		for cnt in -17 to 15 loop
			data_en <= '1';
			data_sa <= std_logic_vector(to_signed(cnt, 6));
			data_in <= X"00010000";
			wait until falling_edge(clk_sys);
			data_en <= '0';
			if (data_done = '0') then
				wait until data_done = '1';
			end if;
			wait until falling_edge(clk_sys);
			wait until falling_edge(clk_sys);
		end loop;
		
		
		
		
		-- wait until (falling_edge(clk_sys) and data_done = '1');
		
		-- data_en <= '1';
		-- data_sa <= "000001";
		-- data_in <= X"80000001";
		-- wait until (falling_edge(clk_sys) and data_done = '1');
		
		
		
		
		
		
		
		
		wait for 200 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	
end;
