--!	@file
--!	@brief XバスとWishboneバス(8ビット, ノーウェイト)のブリッジ
--!        Xバスの16bitがWishboneの8bitにマッピングされるため、Xバスから見るとアドレスは1つ飛ばしになる


---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package WishboneBridge_pkg is
	component WishboneBridge is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			XBUS_BASE_MASK		: std_logic_vector(15 downto 0);
			WB_ADDR_WIDTH		: integer
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			IRQ_IN			: in	std_logic;
			IRQ_OUT			: out	std_logic;
			IRQ_ACC			: in	std_logic;
			
			WB_RST_O		: out	std_logic;
			WB_CYC_O		: out	std_logic;
			WB_STB_O		: out	std_logic;
			WB_WE_O			: out	std_logic;
			WB_ADDR_O		: out	std_logic_vector(WB_ADDR_WIDTH-1 downto 0);
			WB_DAT_O		: out	std_logic_vector(7 downto 0);
			WB_DAT_I		: in	std_logic_vector(7 downto 0);
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end WishboneBridge_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity WishboneBridge is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		XBUS_BASE_MASK		: std_logic_vector(15 downto 0);
		WB_ADDR_WIDTH		: integer
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- 割り込み
		IRQ_IN			: in	std_logic;
		IRQ_OUT			: out	std_logic;
		IRQ_ACC			: in	std_logic;
		
	-- Wishboneバス
		WB_RST_O		: out	std_logic;
		WB_CYC_O		: out	std_logic;
		WB_STB_O		: out	std_logic;
		WB_WE_O			: out	std_logic;
		WB_ADDR_O		: out	std_logic_vector(WB_ADDR_WIDTH-1 downto 0);
		WB_DAT_O		: out	std_logic_vector(7 downto 0);
		WB_DAT_I		: in	std_logic_vector(7 downto 0);
		
	-- メモリー
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of WishboneBridge is
	
	-- Xバス インターフェース
	signal xbus_select		: std_logic;
	signal xbus_din_latch	: std_logic_vector(7 downto 0) := X"00";
	
	-- 割り込み
	--signal irq_edge			: std_logic := '0';
	
	
	
begin
	
	-- Wishboneバス
	WB_RST_O	<= OMSP_RESET;
	WB_CYC_O	<= xbus_select;
	WB_STB_O	<= xbus_select;
	WB_WE_O		<= XBUS_WR(0) or XBUS_WR(1);
	WB_ADDR_O	<= XBUS_ADDR(WB_ADDR_WIDTH downto 1);
	WB_DAT_O	<= XBUS_DATA_IN(7 downto 0) when xbus_select = '1' else xbus_din_latch;
	
	-- Xバス
	xbus_select <= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	XBUS_DATA_OUT <= X"00" & WB_DAT_I when xbus_select = '1' else X"0000";
	
	
	IRQ_OUT		<= IRQ_IN;	-- 割り込みは透過
	
	
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			if (xbus_select = '1') then
				xbus_din_latch <= XBUS_DATA_IN(7 downto 0);
			end if;
			
			if (OMSP_RESET = '1') then
				-- リセット
				--irq_edge <= '0';
				--IRQ_OUT <= '0';
			else
				-- 動作中
				-- irq_edge <= IRQ_IN;
				-- if (IRQ_IN = '1' and irq_edge = '0') then
					-- IRQ_OUT <= '1';
				-- else
					-- if (IRQ_ACC = '1') then
						-- IRQ_OUT <= '0';
					-- end if;
				-- end if;
			end if;
		end if;
	end process;
	
	
end;
 