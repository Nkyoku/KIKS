--!	@file
--!	@brief 基本的な入出力なの



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package IOManager_pkg is
	component IOManager is
		generic(
			PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			RESET_VALUE_GPOA	: std_logic_vector(15 downto 0) := X"0000";
			RESET_VALUE_GPOB	: std_logic_vector(15 downto 0) := X"0000";
			RESET_VALUE_GPOC	: std_logic_vector(15 downto 0) := X"0000";
			RESET_VALUE_GPOD	: std_logic_vector(15 downto 0) := X"0000"
		);
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			OMSP_RESET		: in	std_logic;
			
			GPOA_OUT		: out	std_logic_vector(15 downto 0);
			GPOB_OUT		: out	std_logic_vector(15 downto 0);
			GPOC_OUT		: out	std_logic_vector(15 downto 0);
			GPOD_OUT		: out	std_logic_vector(15 downto 0);
			
			GPIA_IN			: in	std_logic_vector(15 downto 0) := X"0000";
			GPIB_IN			: in	std_logic_vector(15 downto 0) := X"0000";
			GPIC_IN			: in	std_logic_vector(15 downto 0) := X"0000";
			GPID_IN			: in	std_logic_vector(15 downto 0) := X"0000";
			
			PBUS_EN			: in	std_logic;
			PBUS_WR			: in	std_logic;
			PBUS_WAIT		: out	std_logic;
			PBUS_ADDR		: in	std_logic_vector(15 downto 0);
			PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end IOManager_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

library work;
use work.misc_pkg.all;

entity IOManager is
	generic(
		PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		RESET_VALUE_GPOA	: std_logic_vector(15 downto 0) := X"0000";
		RESET_VALUE_GPOB	: std_logic_vector(15 downto 0) := X"0000";
		RESET_VALUE_GPOC	: std_logic_vector(15 downto 0) := X"0000";
		RESET_VALUE_GPOD	: std_logic_vector(15 downto 0) := X"0000"
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		OMSP_RESET		: in	std_logic;
		
	-- IO
		GPOA_OUT		: out	std_logic_vector(15 downto 0);
		GPOB_OUT		: out	std_logic_vector(15 downto 0);
		GPOC_OUT		: out	std_logic_vector(15 downto 0);
		GPOD_OUT		: out	std_logic_vector(15 downto 0);
		
		GPIA_IN			: in	std_logic_vector(15 downto 0) := X"0000";
		GPIB_IN			: in	std_logic_vector(15 downto 0) := X"0000";
		GPIC_IN			: in	std_logic_vector(15 downto 0) := X"0000";
		GPID_IN			: in	std_logic_vector(15 downto 0) := X"0000";
		
	-- Pバス
		PBUS_EN			: in	std_logic;
		PBUS_WR			: in	std_logic;
		PBUS_WAIT		: out	std_logic;
		PBUS_ADDR		: in	std_logic_vector(15 downto 0);
		PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of IOManager is
	
	signal clk_sys_inv		: std_logic;
	
	-- Pバス
	constant BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_rd_gpia		: std_logic;
	signal pbus_wr_gpoa		: std_logic;
	signal pbus_wr_gpoaclr	: std_logic;
	signal pbus_wr_gpoaset	: std_logic;
	signal pbus_rd_gpib		: std_logic;
	signal pbus_wr_gpob		: std_logic;
	signal pbus_wr_gpobclr	: std_logic;
	signal pbus_wr_gpobset	: std_logic;
	signal pbus_rd_gpic		: std_logic;
	signal pbus_wr_gpoc		: std_logic;
	signal pbus_wr_gpocclr	: std_logic;
	signal pbus_wr_gpocset	: std_logic;
	signal pbus_rd_gpid		: std_logic;
	signal pbus_wr_gpod		: std_logic;
	signal pbus_wr_gpodclr	: std_logic;
	signal pbus_wr_gpodset	: std_logic;
	signal pbus_wr_buz		: std_logic;
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFE0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"001F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_rd_gpia		: std_logic;
	signal xbus_wr_gpoa		: std_logic;
	signal xbus_wr_gpoaclr	: std_logic;
	signal xbus_wr_gpoaset	: std_logic;
	signal xbus_rd_gpib		: std_logic;
	signal xbus_wr_gpob		: std_logic;
	signal xbus_wr_gpobclr	: std_logic;
	signal xbus_wr_gpobset	: std_logic;
	signal xbus_rd_gpic		: std_logic;
	signal xbus_wr_gpoc		: std_logic;
	signal xbus_wr_gpocclr	: std_logic;
	signal xbus_wr_gpocset	: std_logic;
	signal xbus_rd_gpid		: std_logic;
	signal xbus_wr_gpod		: std_logic;
	signal xbus_wr_gpodclr	: std_logic;
	signal xbus_wr_gpodset	: std_logic;
	
	-- レジスタ
	-- GPOAだけPバスとXバスの出力がOR結合される。
	signal pbus_reg_gpoa	: std_logic_vector(14 downto 0) := RESET_VALUE_GPOA(14 downto 0);
	signal xbus_reg_gpoa	: std_logic_vector(14 downto 0) := RESET_VALUE_GPOA(14 downto 0);
	signal pxbus_reg_gpob	: std_logic_vector(15 downto 0) := RESET_VALUE_GPOB;
	signal pxbus_reg_gpoc	: std_logic_vector(15 downto 0) := RESET_VALUE_GPOC;
	signal pxbus_reg_gpod	: std_logic_vector(15 downto 0) := RESET_VALUE_GPOD;
	
	signal p_gpoas			: std_logic_vector(14 downto 0);
	signal p_gpoac			: std_logic_vector(14 downto 0);
	signal x_gpoas			: std_logic_vector(14 downto 0);
	signal x_gpoac			: std_logic_vector(14 downto 0);
	signal p_gpobs			: std_logic_vector(15 downto 0);
	signal p_gpobc			: std_logic_vector(15 downto 0);
	signal x_gpobs			: std_logic_vector(15 downto 0);
	signal x_gpobc			: std_logic_vector(15 downto 0);
	signal p_gpocs			: std_logic_vector(15 downto 0);
	signal p_gpocc			: std_logic_vector(15 downto 0);
	signal x_gpocs			: std_logic_vector(15 downto 0);
	signal x_gpocc			: std_logic_vector(15 downto 0);
	signal p_gpods			: std_logic_vector(15 downto 0);
	signal p_gpodc			: std_logic_vector(15 downto 0);
	signal x_gpods			: std_logic_vector(15 downto 0);
	signal x_gpodc			: std_logic_vector(15 downto 0);
	
	signal pbus_reg_bzen	: std_logic := '0';
	signal pbus_reg_bzfreq	: unsigned(14 downto 0) := "000000000000000";
	
	-- ブザー
	signal bz_phase			: unsigned(23 downto 0) := X"000000";
	signal bz_out			: std_logic;
	
	
	
begin
	
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and ADDRESS_MASK;
	
	pbus_rd_gpia	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0000" else '0';
	pbus_rd_gpib	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0001" else '0';
	pbus_rd_gpic	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0002" else '0';
	pbus_rd_gpid	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0003" else '0';
	pbus_wr_gpoa	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0001" else '0';
	pbus_wr_gpoaclr	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0002" else '0';
	pbus_wr_gpoaset	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0003" else '0';
	pbus_wr_gpob	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0005" else '0';
	pbus_wr_gpobclr	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0006" else '0';
	pbus_wr_gpobset	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0007" else '0';
	pbus_wr_gpoc	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0009" else '0';
	pbus_wr_gpocclr	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"000A" else '0';
	pbus_wr_gpocset	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"000B" else '0';
	pbus_wr_gpod	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"000D" else '0';
	pbus_wr_gpodclr	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"000E" else '0';
	pbus_wr_gpodset	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"000F" else '0';
	pbus_wr_buz		<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0010" else '0';
	
	PBUS_WAIT		<= '0';
	PBUS_DATA_OUT	<= GPIA_IN	when pbus_rd_gpia = '1' else
					   GPIB_IN	when pbus_rd_gpib = '1' else
					   GPIC_IN	when pbus_rd_gpic = '1' else
					   GPID_IN	when pbus_rd_gpid = '1' else
					   X"0000";
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_rd_gpia	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0000" else '0';	-- 0,1
	xbus_wr_gpoa	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';	-- 2,3
	xbus_wr_gpoaclr	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0004" else '0';	-- 4,5
	xbus_wr_gpoaset	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0006" else '0';	-- 6,7
	xbus_rd_gpib	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0008" else '0';	-- 8,9
	xbus_wr_gpob	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"000A" else '0';	-- A,B
	xbus_wr_gpobclr	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"000C" else '0';	-- C,D
	xbus_wr_gpobset	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"000E" else '0';	-- E,F
	xbus_rd_gpic	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0010" else '0';	-- 10,11
	xbus_wr_gpoc	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0012" else '0';	-- 12,13
	xbus_wr_gpocclr	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0014" else '0';	-- 14,15
	xbus_wr_gpocset	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0016" else '0';	-- 16,17
	xbus_rd_gpid	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0018" else '0';	-- 18,19
	xbus_wr_gpod	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"001A" else '0';	-- 1A,1B
	xbus_wr_gpodclr	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"001C" else '0';	-- 1C,1D
	xbus_wr_gpodset	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"001E" else '0';	-- 1E,1F
	
	XBUS_DATA_OUT	<= GPIA_IN	when xbus_rd_gpia = '1' else
					   GPIB_IN	when xbus_rd_gpib = '1' else
					   GPIC_IN	when xbus_rd_gpic = '1' else
					   GPID_IN	when xbus_rd_gpid = '1' else
					   X"0000";
	
	
	
	p_gpoas	<= and_vector(PBUS_DATA_IN(14 downto 0), pbus_wr_gpoa) or and_vector(PBUS_DATA_IN(14 downto 0), pbus_wr_gpoaset);
	p_gpoac	<= PBUS_DATA_IN(14 downto 0) when pbus_wr_gpoa = '1' else nand_vector(PBUS_DATA_IN(14 downto 0), pbus_wr_gpoaclr);
	x_gpoas	<= and_vector(XBUS_DATA_IN(14 downto 0), xbus_wr_gpoa) or and_vector(XBUS_DATA_IN(14 downto 0), xbus_wr_gpoaset);
	x_gpoac	<= XBUS_DATA_IN(14 downto 0) when xbus_wr_gpoa = '1' else nand_vector(XBUS_DATA_IN(14 downto 0), xbus_wr_gpoaclr);
	
	p_gpobs	<= and_vector(PBUS_DATA_IN, pbus_wr_gpob) or and_vector(PBUS_DATA_IN, pbus_wr_gpobset);
	p_gpobc	<= PBUS_DATA_IN when pbus_wr_gpob = '1' else nand_vector(PBUS_DATA_IN, pbus_wr_gpobclr);
	x_gpobs	<= and_vector(XBUS_DATA_IN, xbus_wr_gpob) or and_vector(XBUS_DATA_IN, xbus_wr_gpobset);
	x_gpobc	<= XBUS_DATA_IN when xbus_wr_gpob = '1' else nand_vector(XBUS_DATA_IN, xbus_wr_gpobclr);
	
	p_gpocs	<= and_vector(PBUS_DATA_IN, pbus_wr_gpoc) or and_vector(PBUS_DATA_IN, pbus_wr_gpocset);
	p_gpocc	<= PBUS_DATA_IN when pbus_wr_gpoc = '1' else nand_vector(PBUS_DATA_IN, pbus_wr_gpocclr);
	x_gpocs	<= and_vector(XBUS_DATA_IN, xbus_wr_gpoc) or and_vector(XBUS_DATA_IN, xbus_wr_gpocset);
	x_gpocc	<= XBUS_DATA_IN when xbus_wr_gpoc = '1' else nand_vector(XBUS_DATA_IN, xbus_wr_gpocclr);
	
	p_gpods	<= and_vector(PBUS_DATA_IN, pbus_wr_gpod) or and_vector(PBUS_DATA_IN, pbus_wr_gpodset);
	p_gpodc	<= PBUS_DATA_IN when pbus_wr_gpod = '1' else nand_vector(PBUS_DATA_IN, pbus_wr_gpodclr);
	x_gpods	<= and_vector(XBUS_DATA_IN, xbus_wr_gpod) or and_vector(XBUS_DATA_IN, xbus_wr_gpodset);
	x_gpodc	<= XBUS_DATA_IN when xbus_wr_gpod = '1' else nand_vector(XBUS_DATA_IN, xbus_wr_gpodclr);
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			GPOA_OUT <= bz_out & (pbus_reg_gpoa or xbus_reg_gpoa);
			GPOB_OUT <= pxbus_reg_gpob;
			GPOC_OUT <= pxbus_reg_gpoc;
			GPOD_OUT <= pxbus_reg_gpod;
			
			if (RESET = '1') then
				-- リセット
				pbus_reg_gpoa	<= RESET_VALUE_GPOA(14 downto 0);
				xbus_reg_gpoa	<= RESET_VALUE_GPOA(14 downto 0);
				pxbus_reg_gpob	<= RESET_VALUE_GPOB;
				pxbus_reg_gpoc	<= RESET_VALUE_GPOC;
				pxbus_reg_gpod	<= RESET_VALUE_GPOD;
				
			else
				-- 動作中
				pbus_reg_gpoa	<= (pbus_reg_gpoa or p_gpoas) and p_gpoac;
				xbus_reg_gpoa	<= (xbus_reg_gpoa or x_gpoas) and x_gpoac;
				pxbus_reg_gpob	<= (pxbus_reg_gpob or p_gpobs or x_gpobs) and (p_gpobc and x_gpobc);
				pxbus_reg_gpoc	<= (pxbus_reg_gpoc or p_gpocs or x_gpocs) and (p_gpocc and x_gpocc);
				pxbus_reg_gpod	<= (pxbus_reg_gpod or p_gpods or x_gpods) and (p_gpodc and x_gpodc);
				
			end if;
		end if;
	end process;
	
	
	
	
	
	-- ブザー
	bz_out	<= bz_phase(bz_phase'left);
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			if (RESET = '1') then
				-- リセット
				pbus_reg_bzen	<= '0';
				pbus_reg_bzfreq	<= "000000000000000";
				
				bz_phase	<= X"000000";
				
			else
				-- 動作中
				if (pbus_wr_buz = '1') then
					-- ブザー設定レジスタ (BZ)
					pbus_reg_bzen	<= PBUS_DATA_IN(15);
					pbus_reg_bzfreq	<= unsigned(PBUS_DATA_IN(14 downto 0));
				else
					pbus_reg_bzen	<= pbus_reg_bzen;
					pbus_reg_bzfreq	<= pbus_reg_bzfreq;
				end if;
				
				if (pbus_reg_bzen = '1') then
					bz_phase	<= bz_phase + pbus_reg_bzfreq;
				end if;
				
			end if;
		end if;
	end process;
	
	
	
end;
 