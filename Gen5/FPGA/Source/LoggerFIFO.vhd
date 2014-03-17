--!	@file
--!	@brief XバスとPバス間の通信



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package LoggerFIFO_pkg is
	component LoggerFIFO is
		generic(
			PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			OMSP_RESET		: in	std_logic;
			
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
end LoggerFIFO_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity LoggerFIFO is
	generic(
		PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0);
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		OMSP_RESET		: in	std_logic;
		
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

architecture RTL of LoggerFIFO is
	
	-- FIFO
	component FIFO_LOG
		port(
			clk			: in	std_logic;
			srst		: in	std_logic;
			din			: in	std_logic_vector(15 downto 0);
			wr_en		: in	std_logic;
			rd_en		: in	std_logic;
			dout		: out	std_logic_vector(15 downto 0);
			full		: out	std_logic;
			empty		: out	std_logic;
			data_count	: out	std_logic_vector(9 downto 0)
		);
	end component;
	
	-- 定数
	constant FIFO_WIDTH		: integer := 10;				-- 1Kword
	constant FIFO_MSB		: integer := FIFO_WIDTH - 1;
	
	
	
	
	-- Pバス
	constant PBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant PBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_rd_rxdata	: std_logic;
	signal pbus_rd_rxcnt	: std_logic;
	
	signal pbus_reg_rxdata	: std_logic_vector(15 downto 0);
	signal pbus_reg_rxcnt	: std_logic_vector(9 downto 0);
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF8";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"0007";
	
	signal xbus_select			: std_logic;
	signal xbus_masked_addr		: std_logic_vector(15 downto 0);
	
	signal xbus_wr_txid		: std_logic;
	signal xbus_wr_txd1		: std_logic;
	signal xbus_wr_txd2		: std_logic;
	signal xbus_wr_txd4H	: std_logic;
	
	signal xbus_reg_length	: unsigned(1 downto 0) := "00";
	signal xbus_reg_id		: std_logic_vector(9 downto 0) := "0000000000";
	signal xbus_reg_dataL	: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_reg_dataH	: std_logic_vector(15 downto 0) := X"0000";
	
	-- FIFO
	signal fifo_rd_strobe	: std_logic;
	signal fifo_rd_edge		: std_logic := '0';
	signal fifo_wr_strobe	: std_logic;
	signal fifo_wr_count	: unsigned(1 downto 0) := "00";
	signal fifo_wr_length	: unsigned(1 downto 0) := "00";
	signal fifo_wr_data		: std_logic_vector(15 downto 0);
	signal fifo_wr_data0	: std_logic_vector(15 downto 0);
	signal fifo_wr_data1	: std_logic_vector(15 downto 0);
	signal fifo_wr_data2	: std_logic_vector(15 downto 0);
	
	
begin
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (PBUS_BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and PBUS_ADDRESS_MASK;
	
	pbus_rd_rxdata	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0001" else '0';
	pbus_rd_rxcnt	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0003" else '0';
	
	PBUS_WAIT		<= pbus_rd_rxdata;
	
	PBUS_DATA_OUT	<=	pbus_reg_rxdata					when pbus_rd_rxdata = '1' else
						"000000" & pbus_reg_rxcnt		when pbus_rd_rxcnt = '1' else
						X"0000";
	
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_txid	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0000" else '0';
	xbus_wr_txd1	<= xbus_select and (XBUS_WR(0) and not XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';
	xbus_wr_txd2	<= xbus_select and (XBUS_WR(0) and XBUS_WR(1))		when xbus_masked_addr = X"0002" else '0';
	xbus_wr_txd4H	<= xbus_select and (XBUS_WR(0) and XBUS_WR(1))		when xbus_masked_addr = X"0004" else '0';
	
	XBUS_DATA_OUT	<=	X"0000";
	
	
	
	
	
	
	
	
	
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- レジスタライト
			if (xbus_wr_txid = '1') then
				-- ID送信レジスタ (TXID)
				xbus_reg_length <= "00";
				xbus_reg_id		<= XBUS_DATA_IN(9 downto 0);
			elsif (xbus_wr_txd1 = '1') then
				-- 1バイトデータ送信レジスタ (TXD1)
				xbus_reg_length	<= "01";
				xbus_reg_dataL	<= X"00" & XBUS_DATA_IN(7 downto 0);
			elsif (xbus_wr_txd2 = '1') then
				-- 2バイトデータ送信レジスタ (TXD2), 4バイトデータ送信レジスタL (TXD4L)
				xbus_reg_length	<= "10";
				xbus_reg_dataL	<= XBUS_DATA_IN;
			elsif (xbus_wr_txd4H = '1') then
				-- 4バイトデータ送信レジスタH (TXD4H)
				xbus_reg_length	<= "11";
				xbus_reg_dataH	<= XBUS_DATA_IN;
			end if;
		end if;
	end process;
	
	
	
	
	
	-- FIFO
	FIFO_inst : FIFO_LOG
		port map(
			clk			=> CLK_SYS,
			srst		=> OMSP_RESET,
			din			=> fifo_wr_data,
			wr_en		=> fifo_wr_strobe,
			rd_en		=> fifo_rd_strobe,
			dout		=> pbus_reg_rxdata,
			full		=> open,
			empty		=> open,
			data_count	=> pbus_reg_rxcnt
		);
	
	fifo_rd_strobe	<= pbus_rd_rxdata and not fifo_rd_edge;
	
	fifo_wr_strobe	<= fifo_wr_count(1) or fifo_wr_count(0);
	fifo_wr_data	<= fifo_wr_data0 when fifo_wr_count = "11" else
					   fifo_wr_data1 when fifo_wr_count = "10" else
					   fifo_wr_data2;
	
	fifo_wr_data0	<= "10" & xbus_reg_id(9 downto 0) & '0' & xbus_reg_dataH(15 downto 14) & '1';
	fifo_wr_data1	<= "01" & xbus_reg_id(9 downto 0) & "00" & xbus_reg_dataL(15) & '1'		when fifo_wr_length = "10" else
					   xbus_reg_dataH(13 downto 0) & xbus_reg_dataL(15) & '0';
	fifo_wr_data2	<= "00" & xbus_reg_id(4 downto 0) & xbus_reg_dataL(7 downto 0) & '1'	when fifo_wr_length = "01" else
					   xbus_reg_dataL(14 downto 0) & '0';
	
	
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 読み出し信号
			fifo_rd_edge <= pbus_rd_rxdata;
			
			-- 書き込み信号
			if (xbus_wr_txid = '1') then
				fifo_wr_count <= xbus_reg_length;
				fifo_wr_length<= xbus_reg_length;
			elsif (fifo_wr_strobe = '1') then
				fifo_wr_count <= fifo_wr_count - 1;
			end if;
		end if;
	end process;
	
	
	
	
	
	
end;
 