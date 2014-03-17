library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.QuadratureDecoder_pkg.all;


entity TestBenchQuadratureDecoder is
end TestBenchQuadratureDecoder;



architecture Simulation of TestBenchQuadratureDecoder is
	
	signal clk_sys		: std_logic;
	
	signal reset		: std_logic;
	
	signal enc_update	: std_logic := '0';
	signal enc_a_async	: std_logic := '0';
	signal enc_b_async	: std_logic := '0';
	signal enc_a		: std_logic := '0';
	signal enc_b		: std_logic := '0';
	signal dec_latch	: std_logic := '0';
	
	signal period		: time := 1200 ns;
	


begin
	QDEC : QuadratureDecoder
		port map(
			CLK_SYS			=> clk_sys,
			
			RESET			=> reset,
		
			ENC_UPDATE		=> enc_update,
			ENC_A			=> enc_a,
			ENC_B			=> enc_b,
			
			DEC_LATCH		=> dec_latch,
			DEC_OUT			=> open,
			DEC_FLTOUT		=> open
		);
	
	
	-- クロック生成
	CLK1_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	-- ラッチ信号生成
	Latch1_process : process begin
		wait for 1 ms;
		wait until rising_edge(clk_sys);
		wait for 1 ns;
		dec_latch	<= '1';
		wait until rising_edge(clk_sys);
		wait for 1 ns;
		dec_latch	<= '0';
		period		<= period - 50 ns;
	end process;
	
	Latch2_process : process begin
		wait for 340 ns;
		wait until rising_edge(clk_sys);
		enc_update	<= '1';
		wait until rising_edge(clk_sys);
		enc_update	<= '0';
		enc_a		<= enc_a_async;
		enc_b		<= enc_b_async;
	end process;
	
	
	
	-- データ生成
	Signal_process : process begin
		-- リセット
		reset	<= '1';
		wait for 100 ns;
		reset	<= '0';
		--wait for 100 ns;
		
		wait for 10 ms;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- 波形生成
	Wave_process : process begin
		
		enc_a_async	<= '0';
		enc_b_async	<= '0';
		wait for period;
		
		enc_a_async	<= '0';
		enc_b_async	<= '1';
		wait for period;
		
		enc_a_async	<= '1';
		enc_b_async	<= '1';
		wait for period;
		
		enc_a_async	<= '1';
		enc_b_async	<= '0';
		wait for period;
		
	end process;
	
	
	
	
	
	
	
end;
