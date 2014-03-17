--!	@file
--!	@brief 固定小数点数演算の補助と初等関数



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package openMSP430_NPX_pkg is
	component openMSP430_NPX is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end openMSP430_NPX_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.serial_divide_uu_pkg.all;
use work.FunctionTable_pkg.all;

entity openMSP430_NPX is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of openMSP430_NPX is
	-- 乗算器
	component MUL32X32_L1
		port(
			clk		: in	std_logic;
			a		: in	std_logic_vector(31 downto 0);
			b		: in	std_logic_vector(31 downto 0);
			ce		: in	std_logic;
			p		: out	std_logic_vector(63 downto 0)
		);
	end component;
	
	-- 定数
	
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal xbus_select			: std_logic;
	signal xbus_masked_addr		: std_logic_vector(15 downto 0);
	signal xbus_write			: std_logic;
	signal xbus_read			: std_logic;
	
	signal xbus_wr_dividendL	: std_logic;	-- 被除数
	signal xbus_wr_dividendH	: std_logic;
	signal xbus_wr_divisorL		: std_logic;	-- 除数
	signal xbus_wr_divisorH		: std_logic;
	signal xbus_rd_quotientL	: std_logic;	-- 商
	signal xbus_rd_quotientH	: std_logic;
	signal xbus_wr_multiplicandL: std_logic;	-- 被乗数
	signal xbus_wr_multiplicandH: std_logic;
	signal xbus_wr_multiplierL	: std_logic;	-- 乗数
	signal xbus_wr_multiplierH	: std_logic;
	signal xbus_rd_productUL	: std_logic;	-- 積
	signal xbus_rd_productHL	: std_logic;
	signal xbus_rd_productUH	: std_logic;
	signal xbus_rd_productHH	: std_logic;
	signal xbus_rd_funcres		: std_logic;	-- 関数の計算結果
	signal xbus_wr_funclog2		: std_logic;	-- 2底の対数
	signal xbus_wr_funcpow2		: std_logic;	-- 2のべき乗
	signal xbus_wr_funcsin		: std_logic;	-- サイン
	signal xbus_wr_funcasin		: std_logic;	-- アークサイン
	
	
	-- 除算器
	signal divuu_start			: std_logic := '0';
	signal divuu_done			: std_logic;
	signal divuu_dividendL		: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal divuu_dividendH		: std_logic_vector(14 downto 0) := std_logic_vector(to_unsigned(0, 15));
	signal divuu_divisorL		: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal divuu_divisorH		: std_logic_vector(14 downto 0) := std_logic_vector(to_unsigned(0, 15));
	signal divuu_quotient_out	: std_logic_vector(46 downto 0);	-- 31+16
	signal divuu_quotient		: std_logic_vector(30 downto 0);	-- 15+16
	
	-- 乗算器
	signal mul_start			: std_logic := '0';
	signal mul_multiplicandL	: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal mul_multiplicandH	: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal mul_multiplierL		: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal mul_multiplierH		: std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(0, 16));
	signal mul_product			: std_logic_vector(63 downto 0);
	
	-- 初等関数
	signal func_start			: std_logic := '0';
	signal func_done			: std_logic := '0';
	signal func_sel				: std_logic_vector(1 downto 0) := "00";
	signal func_input			: std_logic_vector(15 downto 0) := X"0000";
	signal func_result			: std_logic_vector(15 downto 0) := X"0000";
	
	
	
begin
	-- Xバス インターフェース
	xbus_select	<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr <= XBUS_ADDR and XBUS_ADDRESS_MASK;
	xbus_write <= xbus_select and (XBUS_WR(0) or XBUS_WR(1));
	xbus_read <= xbus_select and (XBUS_WR(0) nor XBUS_WR(1));
	
	xbus_wr_dividendL		<= xbus_write	when xbus_masked_addr	= X"0000" else '0';	-- 00,01
	xbus_wr_dividendH		<= xbus_write	when xbus_masked_addr	= X"0002" else '0'; -- 02,03
	xbus_wr_divisorL		<= xbus_write	when xbus_masked_addr	= X"0004" else '0';	-- 04,05
	xbus_wr_divisorH		<= xbus_write	when xbus_masked_addr	= X"0006" else '0';	-- 06,07
	xbus_rd_quotientL		<= xbus_read	when xbus_masked_addr 	= X"0008" else '0';	-- 08,09
	xbus_rd_quotientH		<= xbus_read	when xbus_masked_addr	= X"000A" else '0';	-- 0A,0B
	xbus_wr_multiplicandL	<= xbus_write	when xbus_masked_addr	= X"0010" else '0';	-- 10,11
	xbus_wr_multiplicandH	<= xbus_write	when xbus_masked_addr	= X"0012" else '0'; -- 12,13
	xbus_wr_multiplierL		<= xbus_write	when xbus_masked_addr	= X"0014" else '0';	-- 14,15
	xbus_wr_multiplierH		<= xbus_write	when xbus_masked_addr	= X"0016" else '0';	-- 16,17
	xbus_rd_productUL		<= xbus_read	when xbus_masked_addr 	= X"0018" else '0';	-- 18,19
	xbus_rd_productHL		<= xbus_read	when xbus_masked_addr	= X"001A" else '0';	-- 1A,1B
	xbus_rd_productUH		<= xbus_read	when xbus_masked_addr 	= X"001C" else '0';	-- 1C,1D
	xbus_rd_productHH		<= xbus_read	when xbus_masked_addr	= X"001E" else '0';	-- 1E,1F
	xbus_rd_funcres			<= xbus_read	when xbus_masked_addr	= X"0020" else '0';	-- 20,21
	xbus_wr_funclog2		<= xbus_write	when xbus_masked_addr	= X"0024" else '0';	-- 24,25
	xbus_wr_funcpow2		<= xbus_write	when xbus_masked_addr	= X"0028" else '0';	-- 28,29
	xbus_wr_funcsin			<= xbus_write	when xbus_masked_addr	= X"002C" else '0';	-- 2C,2D
	xbus_wr_funcasin		<= xbus_write	when xbus_masked_addr	= X"002E" else '0';	-- 2E,2F
	
	XBUS_DATA_OUT <=	divuu_quotient(15 downto 0)						when xbus_rd_quotientL = '1' else
						not divuu_done & divuu_quotient(30 downto 16)	when xbus_rd_quotientH = '1' else
						mul_product(15 downto 0)						when xbus_rd_productUL = '1' else
						mul_product(31 downto 16)						when xbus_rd_productHL = '1' else
						mul_product(47 downto 32)						when xbus_rd_productUH = '1' else
						mul_product(63 downto 48)						when xbus_rd_productHH = '1' else
						func_result										when xbus_rd_funcres = '1' else
						X"0000";
	
	
	
	-- 除算器
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (xbus_wr_dividendL = '1') then
				divuu_dividendL <= XBUS_DATA_IN;
			end if;
			if (xbus_wr_dividendH = '1') then
				divuu_dividendH <= XBUS_DATA_IN(14 downto 0);
			end if;
			if (xbus_wr_divisorL = '1') then
				divuu_divisorL <= XBUS_DATA_IN;
			end if;
			if (xbus_wr_divisorH = '1') then
				divuu_divisorH <= XBUS_DATA_IN(14 downto 0);
				divuu_start <= '1';	-- 除算開始
			else
				divuu_start <= '0';
			end if;
			
			if (divuu_done = '1') then
				if (0 < unsigned(divuu_quotient_out(46 downto 32))) then
					divuu_quotient <= std_logic_vector(to_signed(-1, 31));
				else
					divuu_quotient <= divuu_quotient_out(30 downto 0);
				end if;
			end if;
		end if;
	end process;
	
	DIVIDER : serial_divide_uu
		generic map(
			M_PP => 47,
			N_PP => 31,
			HELD_OUTPUT_PP => 0
		)
		port map(
			clk_i					=> CLK_SYS,
			clk_en_i				=> '1',
			rst_i					=> OMSP_RESET,
			divide_i				=> divuu_start,
			dividend_i(15 downto 0) => X"0000",
			dividend_i(31 downto 16)=> divuu_dividendL,
			dividend_i(46 downto 32)=> divuu_dividendH,
			divisor_i(15 downto 0)	=> divuu_divisorL,
			divisor_i(30 downto 16)	=> divuu_divisorH,
			quotient_o				=> divuu_quotient_out,
			done_o					=> divuu_done
		);
	
	
	
	
	
	-- 乗算器
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (xbus_wr_multiplicandL = '1') then
				mul_multiplicandL <= XBUS_DATA_IN;
			end if;
			if (xbus_wr_multiplicandH = '1') then
				mul_multiplicandH <= XBUS_DATA_IN;
			end if;
			if (xbus_wr_multiplierL = '1') then
				mul_multiplierL <= XBUS_DATA_IN;
			end if;
			if (xbus_wr_multiplierH = '1') then
				mul_multiplierH <= XBUS_DATA_IN;
				mul_start <= '1';	-- 乗算開始
			else
				mul_start <= '0';
			end if;
		end if;
	end process;
	
	MUL_inst : MUL32X32_L1
		port map(
			clk				=> CLK_SYS,
			a(15 downto 0)	=> mul_multiplicandL,
			a(31 downto 16)	=> mul_multiplicandH,
			b(15 downto 0)	=> mul_multiplierL,
			b(31 downto 16)	=> mul_multiplierH,
			ce				=> mul_start,
			p				=> mul_product
		);
	
	
	
	
	
	
	
	-- 関数器
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if ((xbus_wr_funclog2 or xbus_wr_funcpow2 or xbus_wr_funcsin or xbus_wr_funcasin) = '1') then
				func_input <= XBUS_DATA_IN;
				func_start <= '1';
			else
				func_start <= '0';
			end if;
			
			if (xbus_wr_funclog2 = '1') then
				func_sel <= "00";
			elsif (xbus_wr_funcpow2 = '1') then
				func_sel <= "01";
			elsif (xbus_wr_funcsin = '1') then
				func_sel <= "10";
			elsif (xbus_wr_funcasin = '1') then
				func_sel <= "11";
			else
				func_sel <= "00";
			end if;
			
		end if;
	end process;
	
	FUNC : FunctionTable
		port map(
			CLK_IN		=> CLK_SYS,
			DATA_EN		=> func_start,
			DATA_SEL	=> func_sel,
			DATA_PTR	=> func_input,
			DATA_OUT	=> func_result
		);
	
	
	
end;
 