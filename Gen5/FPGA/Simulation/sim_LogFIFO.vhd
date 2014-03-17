library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;
use work.LoggerFIFO_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchLoggerFIFO is
end TestBenchLoggerFIFO;



architecture Simulation of TestBenchLoggerFIFO is
	
	signal clk_sys		: std_logic;
	
	signal reset		: std_logic;
	
	signal pbus_en		: std_logic := '0';
	signal pbus_wr		: std_logic := '0';
	signal pbus_wait	: std_logic;
	signal pbus_addr	: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_din		: std_logic_vector(15 downto 0) := X"0000";
	signal pbus_dout	: std_logic_vector(15 downto 0);
	
	signal xbus_en		: std_logic := '0';
	signal xbus_wr		: std_logic_vector(1 downto 0) := "00";
	signal xbus_wait	: std_logic := '0';
	signal xbus_addr	: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_din		: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_dout	: std_logic_vector(15 downto 0);
	
	
	
begin
	LOGFIFO : LoggerFIFO
		generic map(
			PBUS_BASE_ADDRESS	=> X"0200",
			XBUS_BASE_ADDRESS	=> X"0100"
		)
		port map(
			CLK_SYS			=> clk_sys,
			
			RESET			=> reset,
			OMSP_RESET		=> reset,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_din,
			PBUS_DATA_OUT	=> pbus_dout,
			
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_din,
			XBUS_DATA_OUT	=> xbus_dout
		);
	
	
	
	-- クロック生成
	CLK_process : process begin
		clk_sys <= '1';
		wait for 10.000 ns;
		clk_sys <= '0';
		wait for 10.000 ns;
	end process;
	
	
	
	-- バス信号生成
	PBus_process : process begin
		-- リセット
		reset		<= '1';
		wait for 100 ns;
		reset		<= '0';
		wait for 900 ns;
		
		-- バス操作
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"7272");
		BusRead(CLK_SYS, pbus_en, pbus_wait, pbus_addr, X"0201");
		
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"0123");
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"0456");
		
		-- wait for 21 ns;
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"0789");
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"0ABC");
		-- BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", X"0DEF");
		
		wait for 200 ns;
		
		BusRead(CLK_SYS, pbus_en, pbus_wait, pbus_addr, X"0203");
		
		wait for 1 us;
		
		--for cnt in 0 to 1050 loop
		--	BusRead(CLK_SYS, pbus_en, pbus_wait, pbus_addr, X"0201");
			--BusWrite(CLK_SYS, pbus_en, pbus_wr, pbus_addr, pbus_din, X"0200", std_logic_vector(to_unsigned(500 + cnt, 16)));
		--end loop;
		
		
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- Xバス信号生成
	xbus_wr(1) <= xbus_wr(0);
	XBus_process : process begin
		wait for 1100 ns;
		
		-- バス操作
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0100", X"0123");
		wait for 50 ns;
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0102", X"0765");
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0100", X"0234");
		wait for 50 ns;
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0102", X"0876");
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0104", X"0961");
		BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0100", X"01F4");
		
		--wait for 100 us;
		
		--for cnt in 0 to 1050 loop
		--	BusWrite(CLK_SYS, xbus_en, xbus_wr(0), xbus_addr, xbus_din, X"0100", std_logic_vector(to_unsigned(500 + cnt, 16)));
			--BusRead(CLK_SYS, xbus_en, xbus_wait, xbus_addr, X"0102");
		--end loop;
		
		
		
		wait;
	end process;
	
	
	
	
	
	
	
	
	
	
	
end;
