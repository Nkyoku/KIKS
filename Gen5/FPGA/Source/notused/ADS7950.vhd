--!	@file
--!	@brief ADS7950の制御



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package ADS7950_pkg is
	component ADS7950 is
		generic(
			BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			CLK_ADC			: in	std_logic;
			
			RESET			: in	std_logic;
			
			SPI1_nCS		: out	std_logic;
			SPI1_SCLK		: out	std_logic;
			SPI1_MOSI		: out	std_logic;
			SPI1_MISO		: in	std_logic;
			SPI2_nCS		: out	std_logic;
			SPI2_SCLK		: out	std_logic;
			SPI2_MOSI		: out	std_logic;
			SPI2_MISO		: in	std_logic;
			
			SYNC_IN			: in	std_logic;
			
			CONVERTING		: out	std_logic;
			CONVERTED		: out	std_logic;
			RESULT10		: out	std_logic_vector(11 downto 0);
			RESULT11		: out	std_logic_vector(11 downto 0);
			RESULT12		: out	std_logic_vector(11 downto 0);
			RESULT13		: out	std_logic_vector(11 downto 0);
			RESULT20		: out	std_logic_vector(11 downto 0);
			RESULT21		: out	std_logic_vector(11 downto 0);
			RESULT22		: out	std_logic_vector(11 downto 0);
			RESULT23		: out	std_logic_vector(11 downto 0);
			
			MEM_EN			: in	std_logic;
			MEM_WR			: in	std_logic;
			MEM_WAIT		: out	std_logic;
			MEM_ADDR		: in	std_logic_vector(15 downto 0);
			MEM_DATA_IN		: in	std_logic_vector(15 downto 0);
			MEM_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end ADS7950_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity ADS7950 is
	generic(
		BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		CLK_ADC			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- SPI
		SPI1_nCS		: out	std_logic;
		SPI1_SCLK		: out	std_logic;
		SPI1_MOSI		: out	std_logic;
		SPI1_MISO		: in	std_logic;
		SPI2_nCS		: out	std_logic;
		SPI2_SCLK		: out	std_logic;
		SPI2_MOSI		: out	std_logic;
		SPI2_MISO		: in	std_logic;
		
	-- 同期信号
		SYNC_IN			: in	std_logic;
		
	-- 変換結果
		CONVERTING		: out	std_logic;
		CONVERTED		: out	std_logic;
		RESULT10		: out	std_logic_vector(11 downto 0);
		RESULT11		: out	std_logic_vector(11 downto 0);
		RESULT12		: out	std_logic_vector(11 downto 0);
		RESULT13		: out	std_logic_vector(11 downto 0);
		RESULT20		: out	std_logic_vector(11 downto 0);
		RESULT21		: out	std_logic_vector(11 downto 0);
		RESULT22		: out	std_logic_vector(11 downto 0);
		RESULT23		: out	std_logic_vector(11 downto 0);
		
	-- メモリー
		MEM_EN			: in	std_logic;
		MEM_WR			: in	std_logic;
		MEM_WAIT		: out	std_logic;
		MEM_ADDR		: in	std_logic_vector(15 downto 0);
		MEM_DATA_IN		: in	std_logic_vector(15 downto 0);
		MEM_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of ADS7950 is
	
	-- 定数
	
	
	-- メモリーインターフェース
	constant BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal mem_select		: std_logic;
	signal mem_masked_addr	: std_logic_vector(15 downto 0);
	
	signal mem_wr_cr		: std_logic;
	signal mem_wr_tx		: std_logic;
	signal mem_rd_res10		: std_logic;
	signal mem_rd_res11		: std_logic;
	signal mem_rd_res12		: std_logic;
	signal mem_rd_res13		: std_logic;
	signal mem_rd_res20		: std_logic;
	signal mem_rd_res21		: std_logic;
	signal mem_rd_res22		: std_logic;
	signal mem_rd_res23		: std_logic;
	
	-- レジスタ
	signal reg_auto			: std_logic := '0';
	signal reg_tx			: std_logic_vector(15 downto 0) := X"0000";
	signal reg_res10		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res11		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res12		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res13		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res20		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res21		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res22		: std_logic_vector(11 downto 0) := X"000";
	signal reg_res23		: std_logic_vector(11 downto 0) := X"000";
	
	-- SPI
	type spi_state_t is (SS_IDLE, SS_DATA);
	signal spi_state		: spi_state_t := SS_IDLE;	-- ステート
	
	signal spi_phase		: std_logic := '0';
	signal spi_sclk_en		: std_logic := '0';
	signal spi_bit_cnt		: unsigned(4 downto 0) := "00000";
	signal spi_sr1			: std_logic_vector(15 downto 0) := X"0000";
	signal spi_sr2			: std_logic_vector(15 downto 0) := X"0000";
	signal spi_msb			: std_logic := '0';
	
	-- 自動更新
	signal sync_next		: unsigned(1 downto 0) := "00";
	
	-- ハンドシェーク
	signal req_tx			: std_logic := '0';	-- データの送信要求
	signal req_tx_delay		: std_logic := '0';
	signal ack_tx			: std_logic := '0';		
	signal req_rx			: std_logic := '0';	-- データの受信要求
	signal req_rx_delay		: std_logic := '0';
	signal ack_rx			: std_logic := '0';
	
	
	
	
	
	
	
	
	
begin
	
	-- メモリーインターフェース
	
	mem_select	<= MEM_EN when (BASE_MASK and MEM_ADDR) = BASE_ADDRESS else '0';
	mem_masked_addr	<= MEM_ADDR and ADDRESS_MASK;
	
	mem_wr_cr		<= mem_select and MEM_WR		when mem_masked_addr = X"0000" else '0';
	mem_wr_tx		<= mem_select and MEM_WR		when mem_masked_addr = X"0001" else '0';
	mem_rd_res10	<= mem_select and not MEM_WR	when mem_masked_addr = X"0010" else '0';
	mem_rd_res11	<= mem_select and not MEM_WR	when mem_masked_addr = X"0011" else '0';
	mem_rd_res12	<= mem_select and not MEM_WR	when mem_masked_addr = X"0012" else '0';
	mem_rd_res13	<= mem_select and not MEM_WR	when mem_masked_addr = X"0013" else '0';
	mem_rd_res20	<= mem_select and not MEM_WR	when mem_masked_addr = X"0014" else '0';
	mem_rd_res21	<= mem_select and not MEM_WR	when mem_masked_addr = X"0015" else '0';
	mem_rd_res22	<= mem_select and not MEM_WR	when mem_masked_addr = X"0016" else '0';
	mem_rd_res23	<= mem_select and not MEM_WR	when mem_masked_addr = X"0017" else '0';
	
	MEM_WAIT <= '0';
	
	MEM_DATA_OUT <=	X"0" & reg_res10		when mem_rd_res10 = '1' else
					X"0" & reg_res11		when mem_rd_res11 = '1' else
					X"0" & reg_res12		when mem_rd_res12 = '1' else
					X"0" & reg_res13		when mem_rd_res13 = '1' else
					X"0" & reg_res20		when mem_rd_res20 = '1' else
					X"0" & reg_res21		when mem_rd_res21 = '1' else
					X"0" & reg_res22		when mem_rd_res22 = '1' else
					X"0" & reg_res23		when mem_rd_res23 = '1' else
					X"0000";
	
	
	
	process(RESET, CLK_SYS)
	variable var_req_tx	: std_logic;
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			
			-- 応答
			req_rx_delay	<= req_rx;
			ack_rx			<= req_rx_delay;
			
			
			if (RESET = '1') then
				-- リセット
				reg_auto	<= '0';
				reg_tx		<= X"0000";
				--reg_rx		<= X"0000";
				reg_res10	<= X"000";
				reg_res11	<= X"000";
				reg_res12	<= X"000";
				reg_res13	<= X"000";
				reg_res20	<= X"000";
				reg_res21	<= X"000";
				reg_res22	<= X"000";
				reg_res23	<= X"000";
				
				sync_next	<= "00";
				
				CONVERTED	<= '0';
				
			else
				-- 動作中
				var_req_tx	:= '0';
				
				-- ライト
				if (mem_wr_cr = '1') then
					-- コントロールレジスタ (CR)
					reg_auto	<= MEM_DATA_IN(0);
					
				end if;
				
				if (reg_auto = '0') then
					-- 手動操作
					if (mem_wr_tx = '1') then
						-- 送信データレジスタ (TX)
						reg_tx		<= MEM_DATA_IN;
						var_req_tx	:= '1';
					end if;
				else
					-- 自動更新
					if (SYNC_IN = '1') then
						-- 同期信号を受信
						reg_tx		<= "0001100" & std_logic_vector(sync_next) & "1000000";
						sync_next	<= sync_next + 1;
						var_req_tx	:= '1';
					end if;
				end if;
				
				if (req_rx_delay = '1' and ack_rx = '0') then
					-- レジスタにロード
					if (spi_sr1(15 downto 12) = X"0") then reg_res10 <= spi_sr1(11 downto 0); end if;
					if (spi_sr1(15 downto 12) = X"1") then reg_res11 <= spi_sr1(11 downto 0); end if;
					if (spi_sr1(15 downto 12) = X"2") then reg_res12 <= spi_sr1(11 downto 0); end if;
					if (spi_sr1(15 downto 12) = X"3") then reg_res13 <= spi_sr1(11 downto 0); end if;
					if (spi_sr2(15 downto 12) = X"0") then reg_res20 <= spi_sr2(11 downto 0); end if;
					if (spi_sr2(15 downto 12) = X"1") then reg_res21 <= spi_sr2(11 downto 0); end if;
					if (spi_sr2(15 downto 12) = X"2") then reg_res22 <= spi_sr2(11 downto 0); end if;
					if (spi_sr2(15 downto 12) = X"3") then reg_res23 <= spi_sr2(11 downto 0); end if;
					
					if (sync_next = 0) then
						CONVERTED	<= '1';
					else
						CONVERTED	<= '0';
					end if;
				else
					CONVERTED	<= '0';
				end if;
				
				
				
				req_tx	<= var_req_tx or (req_tx and not ack_tx);
				
			end if;
			
			
			
		end if;
	end process;
	
	
	
	
	-- 結果
	CONVERTING	<= reg_auto;
	RESULT10	<= reg_res10;
	RESULT11	<= reg_res11;
	RESULT12	<= reg_res12;
	RESULT13	<= reg_res13;
	RESULT20	<= reg_res20;
	RESULT21	<= reg_res21;
	RESULT22	<= reg_res22;
	RESULT23	<= reg_res23;
	
	
	
	-- SPI通信部
	
	
	SPI1_nCS	<= '1' when spi_bit_cnt <= 0 else '0';
	SPI2_nCS	<= '1' when spi_bit_cnt <= 0 else '0';
	
	SPI1_SCLK	<= spi_phase when spi_sclk_en = '1' else '0';
	SPI2_SCLK	<= spi_phase when spi_sclk_en = '1' else '0';
	
	
	process(RESET, CLK_ADC)
	variable var_ack_tx		: std_logic;
	variable var_req_rx		: std_logic;
	begin
		if (rising_edge(CLK_ADC)) then
			-- 上昇エッジ
			
			req_tx_delay	<= req_tx;
			
			
			
			
			if (RESET = '1') then
				-- リセット
				SPI1_MOSI	<= '1';
				SPI2_MOSI	<= '1';
				
				spi_state	<= SS_IDLE;
				spi_phase	<= '0';
				spi_sclk_en	<= '0';
				spi_msb		<= '1';
				spi_bit_cnt	<= "00000";
				spi_sr1		<= X"0000";
				spi_sr2		<= X"0000";
				
				req_rx			<= '0';
				
				
				
			else
				-- 動作中
				var_ack_tx	:= '0';
				var_req_rx	:= '0';
				
				
				
				case spi_state is
				when SS_IDLE =>
					-- アイドル状態
					SPI1_MOSI	<= '1';
					SPI2_MOSI	<= '1';
					
					spi_phase	<= '0';
					spi_sclk_en	<= '0';
					spi_msb		<= '1';
					spi_bit_cnt	<= "00000";
					
					if (ack_tx = '0' and req_tx_delay = '1') then
						-- レジスタからロードし、転送開始
						spi_sr1		<= reg_tx;
						var_ack_tx	:= '1';
						
						spi_state	<= SS_DATA;
					else
						spi_state	<= SS_IDLE;
					end if;
					
					
				when SS_DATA =>
					-- 転送中
					
					spi_phase	<= not spi_phase;
					if (spi_phase = '1') then
						spi_bit_cnt	<= spi_bit_cnt + 1;
					end if;
					if (spi_bit_cnt <= 1) then
						spi_sclk_en	<= '0';
						spi_msb		<= spi_sr1(15);
						
					elsif (spi_bit_cnt = 18) then
						spi_sclk_en	<= '0';
						spi_msb		<= '0';
						
						spi_state	<= SS_IDLE;
						var_req_rx	:= '1';
						
					else
						spi_sclk_en	<= '1';
						if (spi_phase = '0') then
							-- SCLK上昇
							spi_sr1	<= spi_sr1(14 downto 0) & SPI1_MISO;
							spi_sr2	<= spi_sr2(14 downto 0) & SPI2_MISO;
							spi_msb	<= spi_sr1(14);
						end if;
					end if;
					
					if (spi_phase = '1') then
						SPI1_MOSI	<= spi_msb;
						SPI2_MOSI	<= spi_msb;
					end if;
					
				end case;
				
				ack_tx	<= var_ack_tx or (ack_tx and req_tx_delay);
				req_rx	<= var_req_rx or (req_rx and not ack_rx);
				
			end if;
		end if;
	end process;
	
	
	
	
	
	
end;
 