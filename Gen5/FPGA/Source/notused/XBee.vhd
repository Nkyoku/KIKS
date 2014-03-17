--!	@file
--!	@brief XBeeからパケットを受信する



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package XBeeController_pkg is
	component XBeeController is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			UART_nRESET		: out	std_logic;
			UART_TX			: out	std_logic;
			UART_RX			: in	std_logic;
			UART_nCTS		: in	std_logic;
			
			IRQ				: out	std_logic;
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end XBeeController_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

library work;
use work.XBeeRxFIFO_pkg.all;

entity XBeeController is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- UART
		UART_nRESET		: out	std_logic;
		UART_TX			: out	std_logic;
		UART_RX			: in	std_logic;
		UART_nCTS		: in	std_logic;
		
	-- 通知
		IRQ				: out	std_logic;
		
	-- メモリー
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of XBeeController is
	
	-- 定数
	constant PRESC_WIDTH	: integer := 10;
	constant FIFO_WIDTH		: integer := 5;
	
	
	-- メモリーインターフェース
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_cr		: std_logic;
	signal xbus_wr_baud		: std_logic;
	signal xbus_rd_sr		: std_logic;
	signal xbus_rd_rxfifo	: std_logic;
	
	
	-- レジスタ
	signal reg_id			: std_logic_vector(3 downto 0) := "0000";
	signal reg_rxen			: std_logic := '0';
	signal reg_rxff			: std_logic := '0';
	signal reg_rxfc			: std_logic := '0';
	signal reg_baud			: unsigned(PRESC_WIDTH-1 downto 0) := TO_UNSIGNED(0, PRESC_WIDTH);
	signal reg_rxlen		: std_logic_vector(FIFO_WIDTH downto 0) := std_logic_vector(to_unsigned(0, FIFO_WIDTH+1));
	signal reg_rxfifo		: std_logic_vector(15 downto 0);
	
	-- 受信FIFO
	signal rxfifo_is_cr		: std_logic;	-- CRを受信
	signal rxfifo_is_lf		: std_logic;	-- LFを受信
	signal rxfifo_comp_id	: std_logic;	-- IDが一致
	
	signal rxfifo_sync		: std_logic := '0';	-- 同期している
	signal rxfifo_cr		: std_logic := '0';	-- 直前のデータがCR
	signal rxfifo_length	: unsigned(FIFO_WIDTH downto 0) := to_unsigned(0, FIFO_WIDTH+1);
	signal rxfifo_reset		: std_logic := '0';
	signal rxfifo_wren		: std_logic := '0';
	signal rxfifo_wr		: std_logic_vector(1 downto 0);
	signal rxfifo_wraddr	: std_logic_vector(FIFO_WIDTH downto 0);
	
	
	
	
	
	
	
	
	
	-- UART
	signal uart_presc		: unsigned(PRESC_WIDTH-1 downto 0) := TO_UNSIGNED(0, PRESC_WIDTH);	-- プリスケーラのカウンタ
	signal uart_rx_ff1		: std_logic := '1';
	signal uart_rx_ff2		: std_logic := '1';
	
	type uart_rx_state_t is (URS_IDLE, URS_DATA);
	signal uart_rx_state	: uart_rx_state_t := URS_IDLE;				-- 受信ステート
	signal uart_rx_start	: std_logic_vector(2 downto 0) := "111";	-- スタートビット検出用のシフトレジスタ
	signal uart_rx_sr		: std_logic_vector(7 downto 0) := X"00";	-- データ受信用のシフトレジスタ
	signal uart_rx_cnt		: unsigned(2 downto 0) := "000";			-- 受信のためのカウンタ
	signal uart_rx_bit_cnt	: unsigned(3 downto 0) := "0000";			-- 受信したビット数のカウンタ
	signal uart_rx_buf		: std_logic_vector(7 downto 0) := X"00";	-- 受信したデータ
	
	-- ハンドシェーク
	signal req_rx			: std_logic := '0';	-- データが到着した
	signal ack_rx			: std_logic := '0';
	
	signal req_rxfifo		: std_logic := '0';	-- パケットが到着した
	signal ack_rxfifo		: std_logic := '0';
	
	
	
	-- XBee
	signal xbee_reset_cnt	: unsigned(5 downto 0) := "000000";	-- XBeeのリセットカウンタ (1.3us)
	
	
	
	
	
	
	
begin
	
	-- Xバス インターフェース
	
	xbus_select	<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr	<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_rd_rxfifo	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when (xbus_masked_addr and X"FFE0") = X"0000" else '0';
	xbus_wr_cr		<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0020" else '0';
	xbus_wr_baud	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))		when xbus_masked_addr = X"0022" else '0';
	xbus_rd_sr		<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0024" else '0';
	
	XBUS_DATA_OUT <="00" & reg_rxlen & "000000" & reg_rxff & reg_rxen	when xbus_rd_sr = '1' else
					reg_rxfifo											when xbus_rd_rxfifo = '1' else
					X"0000";
	
	
	
	process(OMSP_RESET, CLK_SYS)
	variable var_ack_rxfifo	: std_logic;
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				reg_id		<= "0000";
				reg_rxen	<= '0';
				--reg_rxff	<= '0';
				reg_baud	<= TO_UNSIGNED(0, PRESC_WIDTH);
				
				
				
				
				
			else
				-- 動作中
				var_ack_rxfifo	:= '0';
				
				-- ライト
				if (xbus_wr_cr = '1') then
					-- コントロールレジスタ (CR)
					reg_rxen		<= XBUS_DATA_IN(0);
					var_ack_rxfifo	:= XBUS_DATA_IN(1);
					if (XBUS_DATA_IN(11) = '1') then
						reg_id		<= XBUS_DATA_IN(15 downto 12);
					end if;
					
				elsif (xbus_wr_baud = '1') then
					-- ボーレート設定レジスタ (BAUD)
					reg_baud	<= unsigned(XBUS_DATA_IN(PRESC_WIDTH-1 downto 0));
					
				end if;
				
				
				
				ack_rxfifo	<= var_ack_rxfifo;
				
			end if;
			
			IRQ			<= req_rxfifo;
			reg_rxff	<= req_rxfifo;
			
		end if;
	end process;
	
	
	
	
	
	
	
	
	-- 受信FIFO部
	rxfifo_is_cr	<= '1' when uart_rx_buf = X"0D" else '0';
	rxfifo_is_lf	<= '1' when uart_rx_buf = X"0A" else '0';
	rxfifo_comp_id	<= '1' when uart_rx_buf = "0000" & reg_id else '0';
	
	rxfifo_wr(1)	<= rxfifo_wren when rxfifo_wraddr(0) = '0' else '0';
	rxfifo_wr(0)	<= rxfifo_wren when rxfifo_wraddr(0) = '1' else '0';
	rxfifo_wraddr	<= std_logic_vector(rxfifo_length);
	
	RxFIFO : XBeeRxFIFO
		port map(
			CLK_SYS		=> CLK_SYS,
			FIFO_WR		=> rxfifo_wr,
			FIFO_WRADDR	=> rxfifo_wraddr(FIFO_WIDTH downto 1),
			FIFO_DIN	=> uart_rx_buf,
			FIFO_RDADDR	=> xbus_masked_addr(FIFO_WIDTH-1 downto 0),
			FIFO_DOUT	=> reg_rxfifo
		);
	
	
	
	
	process(OMSP_RESET, CLK_SYS)
	variable var_req_rxfifo		: std_logic;
	variable var_rxfifo_reset	: std_logic;
	variable var_rxfifo_wren	: std_logic;
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1' or reg_rxen = '0') then
				-- リセット
				rxfifo_sync		<= '0';
				rxfifo_cr		<= '0';
				--rxfifo_length	<= "000000";
				rxfifo_reset	<= '1';
				rxfifo_wren		<= '0';
				
				reg_rxlen		<= std_logic_vector(to_unsigned(0, FIFO_WIDTH+1));
				
				req_rxfifo		<= '0';
				ack_rx			<= '1';
				
			else
				-- 動作中
				var_rxfifo_reset:= '0';
				var_rxfifo_wren	:= '0';
				var_req_rxfifo	:= '0';
				
				ack_rx	<= req_rx;
				if (req_rx = '1' and ack_rx = '0') then
					-- データを受信
					
					rxfifo_cr		<= rxfifo_is_cr;
					
					
					if (rxfifo_sync = '0') then
						-- 同期していない
						if (rxfifo_cr = '1' and rxfifo_is_lf = '1') then
							-- 同期パターン検出
							rxfifo_sync		<= '1';
							--rxfifo_length	<= "000000";
							var_rxfifo_reset:= '1';
							
						else
							rxfifo_sync		<= '0';
						end if;
						
					else
						-- 同期している
						if (rxfifo_cr = '1' and rxfifo_is_lf = '1') then
							-- 同期パターン検出
							rxfifo_sync		<= '1';
							--rxfifo_length	<= "000000";
							var_rxfifo_reset:= '1';
							
							var_req_rxfifo	:= '1';
							reg_rxlen		<= std_logic_vector(rxfifo_length);
							
							
						else
							
							if (rxfifo_length = 0) then
								-- IDをチェック
								if (rxfifo_comp_id = '1' and req_rxfifo = '0') then
									-- IDが一致かつ受信許可
									rxfifo_sync		<= '1';
									var_rxfifo_wren	:= '1';
									--rxfifo_length	<= rxfifo_length + 1;
								else
									rxfifo_sync		<= '0';
								end if;
								
							else
								if (2**FIFO_WIDTH <= rxfifo_length) then 
									-- データあふれ
									rxfifo_sync		<= '0';
									
								else
									-- データをFIFOに格納
									rxfifo_sync		<= '1';
									var_rxfifo_wren	:= '1';
									--rxfifo_length	<= rxfifo_length + 1;
								end if;
							end if;
						end if;
						
						
					end if;
					
				end if;
				
				rxfifo_reset<= var_rxfifo_reset;
				rxfifo_wren	<= var_rxfifo_wren;
				req_rxfifo	<= var_req_rxfifo or (req_rxfifo and not ack_rxfifo);
				
			end if;
			
			if (rxfifo_reset = '1') then
				rxfifo_length	<= to_unsigned(0, FIFO_WIDTH+1);
				
			elsif (rxfifo_wren = '1') then
				rxfifo_length	<= rxfifo_length + 1;
				
			end if;
			
		end if;
	end process;
	
	
	
	
	
	
	
	
	
	
	
	
	
	-- UART受信部
	
	
	
	
	
	process(OMSP_RESET, CLK_SYS)
	variable var_req_rx		: std_logic;
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			
			-- 入出力を同期化
			uart_rx_ff1	<= UART_RX;
			uart_rx_ff2	<= uart_rx_ff1;
			
			
			
			
			
			
			if (OMSP_RESET = '1') then
				-- リセット
				
				uart_presc	<= TO_UNSIGNED(0, PRESC_WIDTH);
				
				uart_rx_state	<= URS_IDLE;
				uart_rx_start	<= "111";
				uart_rx_sr		<= X"00";
				uart_rx_cnt		<= "000";
				uart_rx_bit_cnt	<= "0000";
				
				req_rx			<= '0';
				
				
				
			else
				-- 動作中
				var_req_rx	:= '0';
				
				-- クロック生成 (ボーレートの8倍)
				if (uart_presc < reg_baud) then
					uart_presc	<= uart_presc + 1;
				else
					uart_presc	<= TO_UNSIGNED(0, PRESC_WIDTH);
					
					-- クロックエッジ
					case uart_rx_state is
					when URS_IDLE =>
						-- スタートビットを待つ
						uart_rx_start	<= uart_rx_ff2 & uart_rx_start(2 downto 1);
						if ((uart_rx_ff2 & uart_rx_start) = "0000") then
							-- スタートビット検出
							uart_rx_cnt		<= "000";
							uart_rx_bit_cnt	<= "0000";
							uart_rx_state	<= URS_DATA;
						end if;
						
					when URS_DATA =>
						-- データを受信
						uart_rx_cnt		<= uart_rx_cnt + 1;
						if (uart_rx_cnt = 7) then
							uart_rx_sr	<= uart_rx_ff2 & uart_rx_sr(7 downto 1);
							uart_rx_bit_cnt	<= uart_rx_bit_cnt + 1;
							
							if (uart_rx_bit_cnt = 8) then
								-- データの受信完了
								if (uart_rx_ff2 = '1') then
									-- ストップビット検出
									uart_rx_buf	<= uart_rx_sr;
									var_req_rx	:= '1';
								end if;
								
								uart_rx_state	<= URS_IDLE;
							end if;
							
						end if;
						
					end case;
					
					
					
					
					
				end if;
				
				
				
				
				
				req_rx	<= var_req_rx or (req_rx and not ack_rx);
				
				
			end if;
		end if;
	end process;
	
	
	
	-- UART送信部
	UART_TX		<= '1';
	
	
	
	-- XBeeのリセット
	UART_nRESET		<= '1' when xbee_reset_cnt = "111111" else '0';
	
	process(OMSP_RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				xbee_reset_cnt <= "000000";
				
			else
				-- 動作中
				if (xbee_reset_cnt /= "111111") then
					xbee_reset_cnt <= xbee_reset_cnt + 1;
				end if;
				
			end if;
		end if;
	end process;
	
	
end;
 