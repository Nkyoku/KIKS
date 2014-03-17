--!	@file
--!	@brief 64バイトの共有メモリー Xポート:R/W, Yポート:Rのみ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package SharedMemory_pkg is
	component SharedMemory is
		generic(
			PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
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
end SharedMemory_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.misc_pkg.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity SharedMemory is
	generic(
		PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
	
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

architecture RTL of SharedMemory is
	
	-- クロック
	signal clk_inv			: std_logic;
	
	-- Pバス
	constant BASE_MASK		: std_logic_vector(15 downto 0) := X"FFC0";
	constant ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"003F";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_wr_smem		: std_logic;
	
	signal pbus_reg_rd		: std_logic_vector(15 downto 0);
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF80";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"007F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_smem		: std_logic;
	
	signal xbus_reg_rd		: std_logic_vector(15 downto 0);
	
	-- 共有メモリー
	signal smem_wr_en		: std_logic_vector(1 downto 0);
	signal smem_wr_p_en		: std_logic := '0';
	signal smem_wr_addr		: std_logic_vector(5 downto 0);
	signal smem_wr_p_addr	: std_logic_vector(5 downto 0) := "000000";
	signal smem_wr_data		: std_logic_vector(15 downto 0);
	signal smem_wr_p_data	: std_logic_vector(15 downto 0) := X"0000";
	
	
	
	
	
begin
	
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and ADDRESS_MASK;
	
	pbus_wr_smem	<= pbus_select and PBUS_WR;
	
	PBUS_WAIT		<= xbus_wr_smem;
	PBUS_DATA_OUT	<= pbus_reg_rd when pbus_select = '1' else X"0000";
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_smem	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1));
	
	XBUS_DATA_OUT	<= xbus_reg_rd when xbus_select = '1' else X"0000";
	
	
	
	-- メモリー
	ram_gen : for cnt in 0 to 15 generate
		ram_inst : RAM64X1D
			port map(
				WCLK	=> CLK_SYS,
				WE		=> smem_wr_en(cnt / 8),
				A0		=> smem_wr_addr(0),
				A1		=> smem_wr_addr(1),
				A2		=> smem_wr_addr(2),
				A3		=> smem_wr_addr(3),
				A4		=> smem_wr_addr(4),
				A5		=> smem_wr_addr(5),
				SPO		=> pbus_reg_rd(cnt),
				D		=> smem_wr_data(cnt),
				
				DPRA0	=> XBUS_ADDR(1),
				DPRA1	=> XBUS_ADDR(2),
				DPRA2	=> XBUS_ADDR(3),
				DPRA3	=> XBUS_ADDR(4),
				DPRA4	=> XBUS_ADDR(5),
				DPRA5	=> XBUS_ADDR(6),
				DPO		=> xbus_reg_rd(cnt)
			);
	end generate;
	
	
	
	
	-- 調停
	smem_wr_en(0)	<= (xbus_wr_smem and XBUS_WR(0)) or pbus_wr_smem or smem_wr_p_en;
	smem_wr_en(1)	<= (xbus_wr_smem and XBUS_WR(1)) or pbus_wr_smem or smem_wr_p_en;
	smem_wr_addr	<= XBUS_ADDR(6 downto 1) when xbus_wr_smem = '1' else
					   PBUS_ADDR(5 downto 0) when smem_wr_p_en = '0' else
					   smem_wr_p_addr;
	smem_wr_data	<= XBUS_DATA_IN when xbus_wr_smem = '1' else
					   PBUS_DATA_IN when smem_wr_p_en = '0' else
					   smem_wr_p_data;
	
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			smem_wr_p_en	<= xbus_wr_smem and pbus_wr_smem;
			smem_wr_p_addr	<= PBUS_ADDR(5 downto 0);
			smem_wr_p_data	<= PBUS_DATA_IN;
		end if;
	end process;
	
	
	
end;
 