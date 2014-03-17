library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.SharedMemory_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchSharedMemory is
end TestBenchSharedMemory;



architecture Simulation of TestBenchSharedMemory is
	
	signal clk_sys		: std_logic;
	
	signal pbus_en		: std_logic := '0';
	signal pbus_wr		: std_logic := '0';
	signal pbus_wait	: std_logic := '0';
	signal pbus_addr	: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_din		: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_dout	: std_logic_vector(15 downto 0);

	signal xbus_en		: std_logic := '0';
	signal xbus_wr		: std_logic := '0';
	signal xbus_wait	: std_logic := '0';
	signal xbus_addr	: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_din		: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_dout	: std_logic_vector(15 downto 0);
	
	
	


begin
	SMEM : SharedMemory
		generic map(
			PBUS_BASE_ADDRESS	=> X"0300",
			XBUS_BASE_ADDRESS	=> X"0100"
		)
		port map(
			CLK_SYS			=> clk_sys,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_din,
			PBUS_DATA_OUT	=> pbus_dout,
			
			XBUS_EN			=> xbus_en,
			XBUS_WR(0)		=> xbus_wr,
			XBUS_WR(1)		=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_din,
			XBUS_DATA_OUT	=> xbus_dout
		);
	
	-- 50MHz生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 10.000 ns;
		clk_sys <= '0';
		wait for 10.000 ns;
	end process;
	
	-- データ生成(1)
	Bus1_process : process begin
		wait for 100 ns;
		
		-- バスアクセス
		BusWrite(clk_sys, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0306", X"0765");
		
		BusRead(clk_sys, pbus_en, pbus_wait, pbus_addr, X"0306");
		
		
		
		wait for 100 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	-- データ生成(2)
	Bus2_process : process begin
		wait for 100 ns;
		
		-- バスアクセス
		BusWrite(clk_sys, xbus_en, xbus_wr, xbus_addr, xbus_din, X"0106", X"0876");
		
		--BusRead(clk_sys, xbus_en, xbus_wait, xbus_addr, X"0106");
		BusWrite(clk_sys, xbus_en, xbus_wr, xbus_addr, xbus_din, X"0108", X"0961");
		
		wait;
	end process;
	
end;
