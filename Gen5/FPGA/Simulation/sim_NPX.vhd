library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.openMSP430_NPX_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchNPX is
end TestBenchNPX;



architecture Simulation of TestBenchNPX is
	
	signal clk_sys		: std_logic := '0';
	
	signal omsp_reset	: std_logic := '1';
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wr2		: std_logic_vector(1 downto 0);
	signal mem_wait		: std_logic := '0';
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	
	
	
	


begin
	NPX : openMSP430_NPX
		generic map(
			XBUS_BASE_ADDRESS	=> X"0200"
		)
		port map(
			CLK_SYS			=> clk_sys,
			OMSP_RESET		=> omsp_reset,
			XBUS_EN			=> mem_en,
			XBUS_WR			=> mem_wr2,
			XBUS_ADDR		=> mem_addr,
			XBUS_DATA_IN	=> mem_din,
			XBUS_DATA_OUT	=> mem_dout
		);
	
	-- 45MHz生成
	CLK_SYS_process : process begin
		clk_sys <= '1';
		wait for 11.111 ns;
		clk_sys <= '0';
		wait for 11.111 ns;
	end process;
	
	-- データ生成
	mem_wr2 <= mem_wr & mem_wr;
	Bus_process : process begin
		-- リセット
		omsp_reset	<= '1';
		wait for 50 ns;
		omsp_reset	<= '0';
		wait for 150 ns;
		
		-- バスアクセス
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0200", X"5678");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0202", X"8234");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0204", X"EF01");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0206", X"1BCD");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0210", X"7272");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0212", X"7393");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0218", X"9393");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"021A", X"7272");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"021C", X"1000");
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"021E", X"2000");
		
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0234", X"0392");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0220");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0222");
		wait for 50 ns;
		BusWrite(clk_sys, mem_en, mem_wr, mem_addr, mem_din, X"0230", X"1024");
		wait for 50 ns;
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0220");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0222");
		
		
		
		wait for 1000 ns;
		
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0208");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"020A");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0214");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"0216");
		
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"021C");
		BusRead(clk_sys, mem_en, mem_wait, mem_addr, X"021E");
		
		
		
		
		wait for 200 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	
	
	
	
end;
