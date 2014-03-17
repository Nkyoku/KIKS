library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

library work;
use work.misc_pkg.all;
use work.IOManager_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchIOM is
end TestBenchIOM;



architecture Simulation of TestBenchIOM is
	
	signal clk_sys		: std_logic;
	signal clk_per		: std_logic;
	
	signal reset		: std_logic;
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wait		: std_logic;
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	signal mot1_load	: std_logic;
	signal mot1_clk		: std_logic;
	signal mot1_do		: std_logic;
	signal mot1_sr		: std_logic_vector(15 downto 0) := X"0000";
	signal mot1_data	: std_logic_vector(15 downto 0) := X"8003";
	
	
	
	
begin
	IOM : IOManager
		generic map(
			BASE_ADDRESS		=> X"0100"
		)
		port map(
			CLK_SYS		=> clk_sys,
			CLK_PER		=> clk_per,
			
			RESET		=> reset,
			
			PWR_5V			=> open,
			LED_CLK			=> open,
			LED_DO			=> open,
			MOT12_EN_SENSORS=> open,
			MOT12_nLATCH	=> mot1_load,
			MOT12_CLK		=> mot1_clk,
			MOT12_nDO		=> mot1_do,
			MOT345_EN_SENSORS=> open,
			MOT345_nLATCH	=> open,
			MOT345_CLK		=> open,
			MOT345_nDO		=> '1',
			
			MOT_UPDATE	=> open,
			MOT1_BAWVU	=> open,
			MOT2_BAWVU	=> open,
			MOT3_BAWVU	=> open,
			MOT4_BAWVU	=> open,
			MOT5_WVU	=> open,
			
			LED_IN1		=> "0000000",
			LED_IN2		=> "0000000",
			
			MEM_EN		=> mem_en,
			MEM_WR		=> mem_wr,
			MEM_WAIT	=> mem_wait,
			MEM_ADDR	=> mem_addr,
			MEM_DATA_IN	=> mem_din,
			MEM_DATA_OUT=> mem_dout
		);
	
	
	
	-- クロック生成
	CLK1_process : process begin
		clk_sys <= '1';
		wait for 10.417 ns;
		clk_sys <= '0';
		wait for 10.417 ns;
	end process;
	
	CLK2_process : process begin
		clk_per <= '1';
		wait for 3.906 ns;
		clk_per <= '0';
		wait for 3.906 ns;
	end process;
	
	
	
	
	
	
	
	
	-- シフトレジスタ1
	mot1_do	<= not mot1_sr(15);
	process(mot1_load, mot1_clk)
	begin
		if (mot1_load = '0') then
			mot1_sr	<= mot1_data;
		else
			if (rising_edge(mot1_clk)) then
				mot1_sr	<= mot1_sr(14 downto 0) & '0';
			end if;
		end if;
	end process;
	
	-- バス信号生成
	MOT12_process : process begin
		wait for 2 us;
		mot1_data	<= X"0000";
		wait for 2 us;
		mot1_data	<= X"0001";
		wait for 2 us;
		mot1_data	<= X"0002";
		wait for 2 us;
		mot1_data	<= X"0004";
		wait for 2 us;
		mot1_data	<= X"0008";
		wait for 2 us;
		mot1_data	<= X"0010";
		wait for 2 us;
		mot1_data	<= X"0020";
		wait for 2 us;
		mot1_data	<= X"0040";
		wait for 2 us;
		mot1_data	<= X"0080";
		wait for 2 us;
		mot1_data	<= X"0100";
		wait for 2 us;
		mot1_data	<= X"0200";
		wait for 2 us;
		mot1_data	<= X"0400";
		wait for 2 us;
		mot1_data	<= X"0800";
		wait for 2 us;
		mot1_data	<= X"1000";
		wait for 2 us;
		mot1_data	<= X"2000";
		wait for 2 us;
		mot1_data	<= X"4000";
		wait for 2 us;
		mot1_data	<= X"8000";
		
		wait;
	end process;
	
	-- バス信号生成
	Bus_process : process begin
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 900 ns;
		
		-- バス操作
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0100", X"0007");
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0101", X"0069");
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0102", X"8800");
		
		wait for 100 us;
		BusWrite(CLK_SYS, mem_en, mem_wr, mem_addr, mem_din, X"0102", X"FFFF");
		
		
		wait for 10 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
end;
