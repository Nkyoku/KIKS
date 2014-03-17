--!	@file
--!	@brief XバスとPバス間の通信



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package Pipe_pkg is
	component Pipe is
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
end Pipe_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity Pipe is
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

architecture RTL of Pipe is
	
	-- 定数
	constant FIFO_WIDTH		: integer := 10;				-- 1Kword
	constant FIFO_MSB		: integer := FIFO_WIDTH - 1;
	
	
	
	
	-- Pバス
	-- XBUS ==RX=> PBUS
	-- XBUS <=TX== PBUS
	constant PBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant PBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal pbus_wr_txdata	: std_logic;
	signal pbus_rd_rxdata	: std_logic;
	signal pbus_rd_txrem	: std_logic;
	signal pbus_rd_rxcnt	: std_logic;
	
	signal pbus_reg_rxdata	: std_logic_vector(15 downto 0);
	
	-- Xバス
	-- PBUS ==RX=> XBUS
	-- PBUS <=TX== XBUS
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"000F";
	
	signal xbus_select			: std_logic;
	signal xbus_masked_addr		: std_logic_vector(15 downto 0);
	
	signal xbus_wr_txdata	: std_logic;
	signal xbus_rd_rxdata	: std_logic;
	signal xbus_rd_txrem	: std_logic;
	signal xbus_rd_rxcnt	: std_logic;
	
	signal xbus_reg_rxdata	: std_logic_vector(15 downto 0);
	
	-- FIFO
	-- XBUS ==RX=> PBUS
	-- XBUS <=TX== PBUS
	signal rxfifo_wraddr	: unsigned(FIFO_MSB downto 0);
	signal rxfifo_rdaddr	: unsigned(FIFO_MSB downto 0);
	signal rxfifo_count		: unsigned(FIFO_WIDTH downto 0);
	signal rxfifo_remain	: unsigned(FIFO_WIDTH downto 0);
	signal rxfifo_full		: std_logic;
	signal rxfifo_empty		: std_logic;
	signal rxfifo_error		: std_logic;
	
	signal txfifo_wraddr	: unsigned(FIFO_MSB downto 0);
	signal txfifo_rdaddr	: unsigned(FIFO_MSB downto 0);
	signal txfifo_count		: unsigned(FIFO_WIDTH downto 0);
	signal txfifo_remain	: unsigned(FIFO_WIDTH downto 0);
	signal txfifo_full		: std_logic;
	signal txfifo_empty		: std_logic;
	signal txfifo_error		: std_logic;
	
	-- BRAM
	signal rxram_wr_en		: std_logic;
	signal rxram_rd_data	: std_logic_vector(31 downto 0);
	signal rxram_wr_addr	: std_logic_vector(FIFO_MSB downto 0);
	signal rxram_rd_addr	: std_logic_vector(FIFO_MSB downto 0);
	
	signal txram_wr_en		: std_logic;
	signal txram_rd_data	: std_logic_vector(31 downto 0);
	signal txram_wr_addr	: std_logic_vector(FIFO_MSB downto 0);
	signal txram_rd_addr	: std_logic_vector(FIFO_MSB downto 0);
	
	

	
	
	type INCDEC_t is (ID_INC, ID_DEC, ID_NONE, ID_ERROR);
	type INCDEC_TABLE_t is array (0 to 15) of INCDEC_t;
	constant INCDEC_TABLE	: INCDEC_TABLE_t := (
		ID_NONE,  ID_NONE, ID_NONE, ID_NONE, ID_INC,  ID_NONE, ID_INC, ID_NONE,
		ID_DEC,   ID_DEC,  ID_NONE, ID_NONE, ID_NONE, ID_DEC,  ID_INC, ID_NONE
	);
	constant ERROR_TABLE	: INCDEC_TABLE_t := (
		ID_NONE, ID_NONE, ID_NONE,  ID_ERROR, ID_NONE, ID_ERROR, ID_NONE,  ID_ERROR,
		ID_NONE, ID_NONE, ID_ERROR, ID_ERROR, ID_NONE, ID_ERROR, ID_ERROR, ID_ERROR
	);
	
	
	
	
	
	
begin
	-- Pバス インターフェース
	pbus_select		<= PBUS_EN when (PBUS_BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr<= PBUS_ADDR and PBUS_ADDRESS_MASK;
	
	pbus_wr_txdata	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0000" else '0';
	pbus_rd_rxdata	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0001" else '0';
	pbus_rd_txrem	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0002" else '0';
	pbus_rd_rxcnt	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0003" else '0';
	
	PBUS_WAIT <= '0';
	
	PBUS_DATA_OUT <=	pbus_reg_rxdata									when pbus_rd_rxdata = '1' else
						std_logic_vector(resize(txfifo_remain, 16))		when pbus_rd_txrem = '1' else
						std_logic_vector(resize(rxfifo_count, 16))		when pbus_rd_rxcnt = '1' else
						X"0000";
	
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_txdata	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0000" else '0';
	xbus_rd_rxdata	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';
	xbus_rd_txrem	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0004" else '0';
	xbus_rd_rxcnt	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0006" else '0';
	
	XBUS_DATA_OUT <=	xbus_reg_rxdata									when xbus_rd_rxdata = '1' else
						std_logic_vector(resize(rxfifo_remain, 16))		when xbus_rd_txrem = '1' else
						std_logic_vector(resize(txfifo_count, 16))		when xbus_rd_rxcnt = '1' else
						X"0000";
	
	
	
	-- FIFO部
	rxfifo_full		<= rxfifo_count(FIFO_WIDTH);
	rxfifo_empty	<= '1' when rxfifo_count = 0 else '0';
	rxfifo_remain	<= to_unsigned(2 ** FIFO_WIDTH, FIFO_WIDTH + 1) - rxfifo_count;
	
	rxram_wr_en		<= not rxfifo_full and xbus_wr_txdata;
	pbus_reg_rxdata	<= rxram_rd_data(15 downto 0);
	rxram_wr_addr	<= std_logic_vector(rxfifo_wraddr);
	rxram_rd_addr	<= std_logic_vector(rxfifo_rdaddr);
	
	
	txfifo_full		<= txfifo_count(FIFO_WIDTH);
	txfifo_empty	<= '1' when txfifo_count = 0 else '0';
	txfifo_remain	<= to_unsigned(2 ** FIFO_WIDTH, FIFO_WIDTH + 1) - txfifo_count;
	
	txram_wr_en		<= not txfifo_full and pbus_wr_txdata;
	xbus_reg_rxdata	<= txram_rd_data(15 downto 0);
	txram_wr_addr	<= std_logic_vector(txfifo_wraddr);
	txram_rd_addr	<= std_logic_vector(txfifo_rdaddr);
	
	
	
	
	-- FIFOが満タンでリード・ライトが同時発生したとき、リードは有効、ライトは無効になる
	-- FIFOが空でリード・ライトが同時発生したとき、リードは無効、ライトは有効になる
	-- FIFOが空の状態でライト・リードが交互に発生した場合、エラーは出ないが読み出したデータは不正なものになる
	
	process(RESET, OMSP_RESET, CLK_SYS)
	variable var_rxfifo_state	: std_logic_vector(3 downto 0);
	variable var_rxfifo_incdec	: INCDEC_t;
	variable var_rxfifo_error	: INCDEC_t;
	variable var_txfifo_state	: std_logic_vector(3 downto 0);
	variable var_txfifo_incdec	: INCDEC_t;
	variable var_txfifo_error	: INCDEC_t;
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (RESET = '1' or OMSP_RESET = '1') then
				-- リセット
				rxfifo_wraddr	<= to_unsigned(0, FIFO_WIDTH);
				rxfifo_rdaddr	<= to_unsigned(0, FIFO_WIDTH);
				rxfifo_count	<= to_unsigned(0, FIFO_WIDTH + 1);
				
				txfifo_wraddr	<= to_unsigned(0, FIFO_WIDTH);
				txfifo_rdaddr	<= to_unsigned(0, FIFO_WIDTH);
				txfifo_count	<= to_unsigned(0, FIFO_WIDTH + 1);
				
			else
				-- 動作中
				
				-- 受信FIFO
				if (pbus_rd_rxdata = '1' and rxfifo_empty = '0') then
					-- 受信FIFOの読み込みアドレスを進める
					rxfifo_rdaddr	<= rxfifo_rdaddr + 1;
				end if;
				if (xbus_wr_txdata = '1' and rxfifo_full = '0') then
					-- 受信FIFOの書き込みアドレスを進める
					rxfifo_wraddr	<= rxfifo_wraddr + 1;
				end if;
				
				-- カウンタを増減させる
				var_rxfifo_state	:= pbus_rd_rxdata & xbus_wr_txdata & rxfifo_empty & rxfifo_full;
				var_rxfifo_incdec	:= INCDEC_TABLE(to_integer(unsigned(var_rxfifo_state)));
				var_rxfifo_error	:= ERROR_TABLE(to_integer(unsigned(var_rxfifo_state)));
				case var_rxfifo_incdec is
				when ID_INC =>
					rxfifo_count <= rxfifo_count + 1;
				when ID_DEC =>
					rxfifo_count <= rxfifo_count - 1;
				when others =>
					rxfifo_count <= rxfifo_count;
				end case;
				if (var_rxfifo_error = ID_ERROR) then
					rxfifo_error <= '1';
				else
					rxfifo_error <= '0';
				end if;
				
				
				
				-- 送信FIFO
				if (xbus_rd_rxdata = '1' and txfifo_empty = '0') then
					-- 送信FIFOの読み込みアドレスを進める
					txfifo_rdaddr	<= txfifo_rdaddr + 1;
				end if;
				if (pbus_wr_txdata = '1' and txfifo_full = '0') then
					-- 送信FIFOの書き込みアドレスを進める
					txfifo_wraddr	<= txfifo_wraddr + 1;
				end if;
				
				-- カウンタを増減させる
				var_txfifo_state	:= xbus_rd_rxdata & pbus_wr_txdata & txfifo_empty & txfifo_full;
				var_txfifo_incdec	:= INCDEC_TABLE(to_integer(unsigned(var_txfifo_state)));
				var_txfifo_error	:= ERROR_TABLE(to_integer(unsigned(var_txfifo_state)));
				case var_txfifo_incdec is
				when ID_INC =>
					txfifo_count <= txfifo_count + 1;
				when ID_DEC =>
					txfifo_count <= txfifo_count - 1;
				when others =>
					txfifo_count <= txfifo_count;
				end case;
				if (var_txfifo_error = ID_ERROR) then
					txfifo_error <= '1';
				else
					txfifo_error <= '0';
				end if;
				
				
			end if;
		end if;
	end process;
	
	
	
	-- 受信BRAM
	rx_bram : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 18,
			DATA_WIDTH_B	=> 18,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (16bit)
			DOA					=> rxram_rd_data,
			DOPA				=> open,
			DIA					=> X"00000000",
			DIPA				=> X"0",
			
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 4)	=> rxram_rd_addr,
			ADDRA(3 downto 0)	=> "0000",
			ENA					=> '1',
			WEA					=> "0000",
			
			-- ポートB (16bit)
			DOB					=> open,
			DOPB				=> open,
			DIB(15 downto 0)	=> XBUS_DATA_IN,
			DIB(31 downto 16)	=> X"0000",
			DIPB				=> X"0",
			
			CLKB				=> CLK_SYS,
			ADDRB(13 downto 4)	=> rxram_wr_addr,
			ADDRB(3 downto 0)	=> "0000",
			ENB					=> rxram_wr_en,
			WEB					=> "1111",
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
	
	-- 送信BRAM
	tx_bram : RAMB16BWER
		generic map(
			DATA_WIDTH_A	=> 18,
			DATA_WIDTH_B	=> 18,
			WRITE_MODE_A	=> "READ_FIRST",
			WRITE_MODE_B	=> "READ_FIRST",
			SIM_DEVICE		=> "SPARTAN6"
		)
		port map(
			-- ポートA (16bit)
			DOA					=> txram_rd_data,
			DOPA				=> open,
			DIA					=> X"00000000",
			DIPA				=> X"0",
			
			CLKA				=> CLK_SYS,
			ADDRA(13 downto 4)	=> txram_rd_addr,
			ADDRA(3 downto 0)	=> "0000",
			ENA					=> '1',
			WEA					=> "0000",
			
			-- ポートB (16bit)
			DOB					=> open,
			DOPB				=> open,
			DIB(15 downto 0)	=> PBUS_DATA_IN,
			DIB(31 downto 16)	=> X"0000",
			DIPB				=> X"0",
			
			CLKB				=> CLK_SYS,
			ADDRB(13 downto 4)	=> txram_wr_addr,
			ADDRB(3 downto 0)	=> "0000",
			ENB					=> txram_wr_en,
			WEB					=> "1111",
			
			-- リセット・レジスタ
			RSTA				=> '0',
			RSTB				=> '0',
			REGCEA				=> '1',
			REGCEB				=> '1'
		);
	
	
	
	
	
	
end;
 