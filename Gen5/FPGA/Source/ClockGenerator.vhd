--
--!	@file
--!	@brief クロックを生成・分配



---- パッケージ ---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package ClockGenerator_pkg is
	component ClockGenerator is
		port(
			CLK_IN		: in	std_logic;
			CLK_SYS2	: out	std_logic;
			CLK_SYS1	: out	std_logic;
			CLK_PWM		: out	std_logic;
			TICK_SYNC	: out	std_logic;
			RESET_OUTP	: out	std_logic;
			RESET_OUTN	: out	std_logic
		);
	end component;
end ClockGenerator_pkg;



---- エンティティ --------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity ClockGenerator is
	port(
		CLK_IN		: in	std_logic;	-- クロック入力(24MHz)
		CLK_SYS2	: out	std_logic;	-- システムクロック出力2(150MHz)
		CLK_SYS1	: out	std_logic;	-- システムクロック出力1(50MHz)
		CLK_PWM		: out	std_logic;	-- クロック出力1(144MHz)
		TICK_SYNC	: out	std_logic;	-- 1ms周期のワンショットパルス
		RESET_OUTP	: out	std_logic;	-- リセット信号(正論理)
		RESET_OUTN	: out	std_logic	-- リセット信号(負論理)
	);
end ClockGenerator;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of ClockGenerator is

	signal clkin_ibuf	: std_logic;	-- IBUFGを通った入力クロック
	signal clkin		: std_logic;	-- バッファされた入力クロック
	
	signal locked0		: std_logic;
	signal locked1		: std_logic;
	signal locked0_ff	: std_logic_vector(1 downto 0) := "00";
	signal locked1_ff	: std_logic_vector(1 downto 0) := "00";
	
	signal clkfb0		: std_logic;	-- フィードバッククロック PLL0
	signal clkfb1		: std_logic;	-- フィードバッククロック PLL1
	
	signal clksys2		: std_logic;	-- システムクロックの2倍
	signal clksys1		: std_logic;	-- システムクロックの等倍
	signal clksys1_int	: std_logic;
	signal clkpwm		: std_logic;	-- PWMクロック
	
	signal reset_p		: std_logic := '1';
	signal reset_shift	: std_logic_vector(5 downto 0) := "111111";
	
	signal tick_sync_cnt: unsigned(15 downto 0) := X"0000";
	signal tick_sync_int: std_logic := '0';	
	
	
	
begin
	-- 入力クロックバッファ
	clkin_ibufg : IBUFG
		port map(
			I	=> CLK_IN,
			O	=> clkin_ibuf
		);
	
	clkin_bufg : BUFG
		port map(
			I	=> clkin_ibuf,
			O	=> clkin
		);
	
	-- PLL0
	pll_inst0 : PLL_BASE
		generic map(
			CLKFBOUT_MULT	=> 30,
			CLKIN_PERIOD	=> 41.666,
			
			-- CLK_PWM
			CLKOUT0_DIVIDE	=> 5
		)
		port map(
		-- クロック入力
			CLKIN		=> clkin,
			CLKFBIN		=> clkfb0,
		-- クロック出力
			CLKOUT0		=> clkpwm,
			CLKOUT1		=> open,
			CLKOUT2		=> open,
			CLKOUT3		=> open,
			CLKOUT4		=> open,
			CLKOUT5		=> open,
			CLKFBOUT	=> clkfb0,
		-- 制御信号
			LOCKED		=> locked0,
			RST			=> '0'
		);
	
	-- PLL1
	pll_inst1 : PLL_BASE
		generic map(
			CLKFBOUT_MULT	=> 25,
			CLKIN_PERIOD	=> 41.666,
			
			-- CLK_SYS2
			CLKOUT0_DIVIDE	=> 4,
			
			-- CLK_SYS1
			CLKOUT1_DIVIDE	=> 12,
			CLKOUT1_PHASE	=> 90.0
		)
		port map(
		-- クロック入力
			CLKIN		=> clkin,
			CLKFBIN		=> clkfb1,
		-- クロック出力
			CLKOUT0		=> clksys2,
			CLKOUT1		=> clksys1,
			CLKOUT2		=> open,
			CLKOUT3		=> open,
			CLKOUT4		=> open,
			CLKOUT5		=> open,
			CLKFBOUT	=> clkfb1,
		-- 制御信号
			LOCKED		=> locked1,
			RST			=> '0'
		);
	
	-- グローバルクロックバッファ
	clksys2_bufg : BUFG
		port map(
			I => clksys2,
			O => CLK_SYS2
		);
	clksys1_bufg : BUFG
		port map(
			I => clksys1,
			O => clksys1_int
		);
	clkpwm_bufg : BUFG
		port map(
			I => clkpwm,
			O => CLK_PWM
		);
	
	CLK_SYS1 <= clksys1_int;
	
	
	
	-- リセット信号
	RESET_OUTP <= reset_p;
	RESET_OUTN <= not reset_p;
	
	process(clksys1_int)
	begin
		if (rising_edge(clksys1_int)) then
			locked0_ff <= locked0_ff(0) & locked0;
			locked1_ff <= locked1_ff(0) & locked1;
			reset_shift <= reset_shift(4 downto 0) & (locked0_ff(1) nand locked1_ff(1));
			reset_p <= reset_shift(5);
		end if;
	end process;
	
	-- 1ms周期のワンショットパルス
	TICK_SYNC <= tick_sync_int;
	process(clksys1_int)
	begin
		if (rising_edge(clksys1_int)) then
			if (49999 <= tick_sync_cnt) then
				tick_sync_cnt <= X"0000";
				tick_sync_int <= '1';
			else
				tick_sync_cnt <= tick_sync_cnt + 1;
				tick_sync_int <= '0';
			end if;
		end if;
	end process;
	
	
	
end;
