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
	
	signal reset		: std_logic;
	
	signal pbus_en		: std_logic := '0';
	signal pbus_wr		: std_logic := '0';
	signal pbus_wait	: std_logic;
	signal pbus_addr	: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_din		: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_dout	: std_logic_vector(15 downto 0);
	
	
	
	
begin
	IOM : IOManager
		generic map(
			PBUS_BASE_ADDRESS	=> X"0000",
			XBUS_BASE_ADDRESS	=> X"0020",
			RESET_VALUE_GPOA	=> X"0000",
			RESET_VALUE_GPOB	=> X"0000",
			RESET_VALUE_GPOC	=> X"0002",
			RESET_VALUE_GPOD	=> X"0000"
		)
		port map(
			CLK_SYS			=> clk_sys,
			RESET			=> reset,
			OMSP_RESET		=> reset,
			GPOA_OUT		=> open,
			GPOB_OUT		=> open,
			GPOC_OUT		=> open,
			GPOD_OUT		=> open,
			GPIA_IN			=> X"1111",
			GPIB_IN			=> X"2222",
			GPIC_IN			=> X"3333",
			GPID_IN			=> X"4444",
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> open,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_din,
			PBUS_DATA_OUT	=> pbus_dout,
			XBUS_EN			=> '0',
			XBUS_WR			=> "00",
			XBUS_ADDR		=> X"0000",
			XBUS_DATA_IN	=> X"0000",
			XBUS_DATA_OUT	=> open
		);
	
	
	
	-- クロック生成
	CLK1_process : process begin
		clk_sys <= '1';
		wait for 10.000 ns;
		clk_sys <= '0';
		wait for 10.000 ns;
	end process;
	
	
	
	
	
	
	
	
	
	
	-- バス信号生成
	PBUS_process : process begin
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 100 ns;
		
		-- バス操作
		BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"000B", X"FFFF");
		BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"000A", X"000F");
		BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0001", X"0765");
		
		wait for 100 ns;
		BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0009", X"8765");
		
		
		wait for 1 us;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
end;
