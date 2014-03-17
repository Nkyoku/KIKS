library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.PWMGenerator_pkg.all;


entity TestBenchPWMGenerator is
end TestBenchPWMGenerator;



architecture Simulation of TestBenchPWMGenerator is
	
	signal clk_sys		: std_logic;
	signal clk_pwm		: std_logic;
	
	signal reset		: std_logic;
	
	signal sync			: std_logic;
	
	signal oc			: std_logic;
	
	signal setting_duty	: signed(12 downto 0);
	signal setting_en	: std_logic_vector(2 downto 0);
	signal setting_pol	: std_logic_vector(2 downto 0);
	
	
	
	


begin
	PWMGEN : PWMGenerator
		generic map(
			DUTY_WIDTH		=> 12,
			MIN_DUTY		=> 10,
			MAX_DUTY		=> 2**12 - 10
		)
		port map(
			CLK_SYS			=> clk_sys,
			CLK_PWM			=> clk_pwm,
			
			RESET			=> reset,
			
			OMSP_SYNC		=> sync,
			
			PWM_OUT			=> open,
			nRESET_OUT		=> open,
			nFAULT_IN		=> oc,
			nOTW_IN			=> '1',
			
			REG_DUTY		=> setting_duty,
			REG_OT			=> open,
			REG_OC			=> open,
			
			PHASE_EN		=> setting_en,
			PHASE_POL		=> setting_pol
		);
	
	
	
	
	-- クロック生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 10.000 ns;
		clk_sys <= '0';
		wait for 10.000 ns;
	end process;
	
	CLK_PWM_process : process begin
		clk_pwm <= '1';
		wait for 3.472 ns;
		clk_pwm <= '0';
		wait for 3.472 ns;
	end process;
	
	-- 2ms間隔
	Sync_process : process begin
		wait until rising_edge(clk_sys);
		sync <= '1';
		wait until rising_edge(clk_sys);
		sync <= '0';
		wait for 1 ms;
	end process;
	
	
	
	-- データ生成
	Signal_process : process begin
		oc				<= '1';
		setting_duty	<= to_signed(0, 13);
		setting_en		<= "000";
		setting_pol		<= "000";
		
		-- リセット
		reset	<= '1';
		wait for 100 ns;
		reset	<= '0';
		wait for 100 ns;
		
		wait for 10 us;
		
		-- 動作開始
		setting_duty	<= to_signed(765, 13);
		setting_en		<= "101";
		setting_pol		<= "100";
		wait for 45 us;
		
		oc <= '0';
		wait for 1 us;
		oc <= '1';
		
		setting_duty	<= to_signed(-876, 13);
		setting_en		<= "110";
		setting_pol		<= "010";
		wait for 50 us;
		
		setting_duty	<= to_signed(5, 13);
		setting_en		<= "011";
		setting_pol		<= "001";
		wait for 50 us;
		
		setting_duty	<= to_signed(-4095, 13);
		setting_en		<= "010";
		setting_pol		<= "010";
		wait for 50 us;
		
		wait for 1 ms;
		
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
end;
