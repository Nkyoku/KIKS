library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.ClockGenerator_pkg.all;



entity TestBenchClockGen is
end TestBenchClockGen;



architecture Simulation of TestBenchClockGen is

	signal clk_in		: std_logic;
	
	
	
	
	

begin
	
	CLKGEN : ClockGenerator
		port map(
			CLK_IN		=> clk_in,
			CLK_OUT0	=> open,
			CLK_OUT1	=> open,
			CLK_OUT2	=> open,
			CLK_OUT3	=> open,
			ADC_SYNC	=> open,
			TICK_SYNC	=> open,
			RESET_OUTP	=> open,
			RESET_OUTN	=> open
		);
	
	
	
	
	-- クロック生成
	CLK_process : process begin
		clk_in <= '0';
		wait for 20.833 ns;
		clk_in <= '1';
		wait for 20.833 ns;
	end process;
	
	
	
	-- 待つ
	Wait_process : process begin
		
		
		
		wait for 200 ms;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	
	
	
end;
