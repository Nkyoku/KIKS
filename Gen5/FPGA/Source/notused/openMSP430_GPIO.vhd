--!	@file
--!	@brief 基本的な入出力なの



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package openMSP430_GPIO_pkg is
	component openMSP430_GPIO is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			RESET_VALUE_PORTA	: std_logic_vector(7 downto 0) := X"00";
			RESET_VALUE_PORTB	: std_logic_vector(7 downto 0) := X"00"
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			PORTA_OUT		: out	std_logic_vector(7 downto 0);
			PORTB_OUT		: out	std_logic_vector(7 downto 0);
			PORTC_IN		: in	std_logic_vector(7 downto 0);
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end openMSP430_GPIO_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity openMSP430_GPIO is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		RESET_VALUE_PORTA	: std_logic_vector(7 downto 0) := X"00";
		RESET_VALUE_PORTB	: std_logic_vector(7 downto 0) := X"00"
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- GPIO
		PORTA_OUT		: out	std_logic_vector(7 downto 0);
		PORTB_OUT		: out	std_logic_vector(7 downto 0);
		PORTC_IN		: in	std_logic_vector(7 downto 0);
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of openMSP430_GPIO is
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"000F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_porta		: std_logic;
	signal xbus_wr_porta_set	: std_logic;
	signal xbus_wr_porta_clr	: std_logic;
	signal xbus_wr_porta_tog	: std_logic;
	signal xbus_wr_portb		: std_logic;
	signal xbus_wr_portb_set	: std_logic;
	signal xbus_wr_portb_clr	: std_logic;
	signal xbus_wr_portb_tog	: std_logic;
	signal xbus_rd_portc		: std_logic;
	
	signal xbus_reg_porta	: std_logic_vector(7 downto 0) := RESET_VALUE_PORTA;
	signal xbus_reg_portb	: std_logic_vector(7 downto 0) := RESET_VALUE_PORTB;
	
	-- 同期化
	signal portc_ff1		: std_logic_vector(7 downto 0) := X"00";
	signal portc_ff2		: std_logic_vector(7 downto 0) := X"00";
	
	
	
	
begin
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_porta		<= xbus_select and XBUS_WR(0)					when xbus_masked_addr = X"0000" else '0';	-- 0
	xbus_wr_porta_set	<= xbus_select and XBUS_WR(1)					when xbus_masked_addr = X"0000" else '0'; 	-- 1
	xbus_wr_porta_clr	<= xbus_select and XBUS_WR(0)					when xbus_masked_addr = X"0002" else '0';	-- 2
	xbus_wr_porta_tog	<= xbus_select and XBUS_WR(1)					when xbus_masked_addr = X"0002" else '0';	-- 3
	xbus_wr_portb		<= xbus_select and XBUS_WR(0)					when xbus_masked_addr = X"0004" else '0';	-- 4
	xbus_wr_portb_set	<= xbus_select and XBUS_WR(1)					when xbus_masked_addr = X"0004" else '0';	-- 5
	xbus_wr_portb_clr	<= xbus_select and XBUS_WR(0)					when xbus_masked_addr = X"0006" else '0';	-- 6
	xbus_wr_portb_tog	<= xbus_select and XBUS_WR(1)					when xbus_masked_addr = X"0006" else '0';	-- 7
	xbus_rd_portc		<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0008" else '0';	-- 8
	
	XBUS_DATA_OUT <=	X"00" & portc_ff2 when xbus_rd_portc = '1' else
						X"0000";
	
	
	PORTA_OUT <= xbus_reg_porta;
	PORTB_OUT <= xbus_reg_portb;
	
	
	-- レジスタ
	process(OMSP_RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				xbus_reg_porta <= RESET_VALUE_PORTA;
				xbus_reg_portb <= RESET_VALUE_PORTB;
				
			else
				-- 動作中
				
				-- ライト
				if (xbus_wr_porta = '1') then
					xbus_reg_porta <= XBUS_DATA_IN(7 downto 0);
				elsif (xbus_wr_porta_set = '1') then
					xbus_reg_porta <= xbus_reg_porta or XBUS_DATA_IN(15 downto 8);
				elsif (xbus_wr_porta_clr = '1') then
					xbus_reg_porta <= xbus_reg_porta and (XBUS_DATA_IN(7 downto 0) xor X"FF");
				elsif (xbus_wr_porta_tog = '1') then
					xbus_reg_porta <= xbus_reg_porta xor XBUS_DATA_IN(15 downto 8);
				end if;
				
				if (xbus_wr_portb = '1') then
					xbus_reg_portb <= XBUS_DATA_IN(7 downto 0);
				elsif (xbus_wr_portb_set = '1') then
					xbus_reg_portb <= xbus_reg_portb or XBUS_DATA_IN(15 downto 8);
				elsif (xbus_wr_portb_clr = '1') then
					xbus_reg_portb <= xbus_reg_portb and (XBUS_DATA_IN(7 downto 0) xor X"FF");
				elsif (xbus_wr_portb_tog = '1') then
					xbus_reg_portb <= xbus_reg_portb xor XBUS_DATA_IN(15 downto 8);
				end if;
				
			end if;
		end if;
	end process;
	
	
	
	-- 同期化
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			portc_ff1 <= PORTC_IN;
			portc_ff2 <= portc_ff1;
		end if;
	end process;
	
	
	
	
	
end;
 