library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;


library work;
use work.misc_pkg.all;
use work.openMSP430_SMPX_pkg.all;
use work.BusTest_pkg.all;



entity TestBenchSMPX is
end TestBenchSMPX;



architecture Simulation of TestBenchSMPX is
	
	signal clk_sys1		: std_logic := '0';
	signal clk_sys2		: std_logic := '0';
	
	signal omsp_reset	: std_logic := '1';
	
	signal mem_en		: std_logic := '0';
	signal mem_wr		: std_logic := '0';
	signal mem_wr2		: std_logic_vector(1 downto 0);
	signal mem_wait		: std_logic := '0';
	signal mem_addr		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_din		: std_logic_vector(15 downto 0) := X"0000";
	signal mem_dout		: std_logic_vector(15 downto 0);
	
	signal dmem_en1		: std_logic;
	signal dmem_en2		: std_logic;
	signal dmem_wr		: std_logic;
	signal dmem_addr1	: std_logic_vector(11 downto 0);
	signal dmem_addr2	: std_logic_vector(11 downto 0);
	signal dmem_din		: std_logic_vector(31 downto 0);
	signal dmem_dout1	: std_logic_vector(31 downto 0) := X"00000000";
	signal dmem_dout2	: std_logic_vector(31 downto 0) := X"00000000";
	


begin
	SMPX : openMSP430_SMPX
		generic map(
			XBUS_BASE_ADDRESS	=> X"0180"
		)
		port map(
			CLK_SYS1		=> clk_sys1,
			CLK_SYS2		=> clk_sys2,
			OMSP_RESET		=> omsp_reset,
			XDMA_EN1		=> dmem_en1,
			XDMA_EN2		=> dmem_en2,
			XDMA_WR			=> dmem_wr,
			XDMA_ADDR1		=> dmem_addr1,
			XDMA_ADDR2		=> dmem_addr2,
			XDMA_DATA_IN1	=> dmem_dout1,
			XDMA_DATA_IN2	=> dmem_dout2,
			XDMA_DATA_OUT	=> dmem_din,
			XBUS_EN			=> mem_en,
			XBUS_WR			=> mem_wr2,
			XBUS_ADDR		=> mem_addr,
			XBUS_DATA_IN	=> mem_din,
			XBUS_DATA_OUT	=> mem_dout
		);
	
	-- 50MHz生成
	CLK_SYS1_process : process begin
		clk_sys1 <= '1';
		wait for 10.000 ns;
		clk_sys1 <= '0';
		wait for 10.000 ns;
	end process;
	
	-- 約150MHz生成
	CLK_SYS2_process : process begin
		clk_sys2 <= '1';
		wait for 3.3 ns;
		clk_sys2 <= '0';
		wait for 3.3 ns;
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
		
		-- (1x1) * (1x1)
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0202", X"0800");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0204", X"0990");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0206", X"0B20");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0200", X"C111");
		
		-- (3x3) * (3x3)
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0202", X"0004");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0204", X"0004");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0206", X"0004");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0200", X"C333");
		
		-- (6x5) * (4x6)
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0202", X"0800");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0204", X"0990");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0206", X"0B20");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0200", X"C654");
		
		-- (3x3) + (3x3)
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0202", X"0800");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0204", X"0804");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0206", X"0804");
		-- BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0200", X"7333");
		
		-- (3x4) * (1x3)
		BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0182", X"7900");
		BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0184", X"7800");
		BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0186", X"7700");
		BusWrite(clk_sys1, mem_en, mem_wr, mem_addr, mem_din, X"0180", X"C341");
		
		wait for 10 us;
		
		
		
		wait for 200 ns;
		assert (false) report "Simulation End" severity failure;
		wait;
	end process;
	
	
	
	-- メモリーの振る舞い
	process(clk_sys2)
	begin
		if (rising_edge(clk_sys2)) then
			if (dmem_en1 = '0') then
				dmem_dout1 <= X"00000000";
			elsif (dmem_wr = '0') then
				dmem_dout1 <= std_logic_vector(resize(unsigned(dmem_addr1), 16)) & X"0000";
			else
				dmem_dout1 <= dmem_din;
			end if;
			if (dmem_en2 = '0') then
				dmem_dout2 <= X"00000000";
			elsif (dmem_wr = '0') then
				dmem_dout2 <= std_logic_vector(resize(unsigned(dmem_addr2), 16)) & X"0000";
			else
				dmem_dout2 <= dmem_din;
			end if;
		end if;
	end process;
	
	
	
end;
