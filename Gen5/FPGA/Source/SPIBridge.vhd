--!	@file
--!	@brief SPIブリッジ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package SPIBridge_pkg is
	component SPIBridge is
		port(
			CLK_SYS			: in	std_logic;
			CLK_ALT			: in	std_logic;
			
			RESET			: in	std_logic;
			
			SPI_nCS			: in	std_logic;
			SPI_SCLK		: in	std_logic;
			SPI_MOSI		: in	std_logic;
			SPI_MISO		: out	std_logic;
			
			PBUS_EN			: out	std_logic;
			PBUS_WR			: out	std_logic;
			PBUS_WAIT		: in	std_logic;
			PBUS_ADDR		: out	std_logic_vector(15 downto 0);
			PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end SPIBridge_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.misc_pkg.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity SPIBridge is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		CLK_ALT			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- SPI
		SPI_nCS			: in	std_logic;
		SPI_SCLK		: in	std_logic;
		SPI_MOSI		: in	std_logic;
		SPI_MISO		: out	std_logic;
		
	-- メモリー
		PBUS_EN			: out	std_logic;
		PBUS_WR			: out	std_logic;
		PBUS_WAIT		: in	std_logic;
		PBUS_ADDR		: out	std_logic_vector(15 downto 0);
		PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of SPIBridge is
	
	-- パケット構造
	-- すべてビッグエンディアン
	-- 
	-- |         WORD0        |   WORD1  |   WORD2  |     |
	-- | 15  14  13  12 ... 0 | 15 ... 0 | 15 ... 0 | ... |
	-- | R/W W/R C/S   ADDR   |   SIZE   |   DATA0  |     |
	-- 
	-- WORD0[15] R/W : 1でRead, 0でWrite
	-- WORD0[14] W/R : 0でRead, 1でWrite, つまり[15]の反転
	-- WORD0[13] C/S : 1でContinuous, 0でSingle
	
	
	
	
	-- SPI
	signal spi_ncs_ff1		: std_logic := '1';
	signal spi_ncs_ff2		: std_logic := '1';
	signal spi_ncs_ff3		: std_logic := '1';
	
	signal spi_sclk_int		: std_logic;
	
	signal spi_dout			: std_logic := '0';
	signal spi_dout_dis		: std_logic := '1';
	
	type spi_state_t is (SS_ADDR, SS_SIZE, SS_DATA, SS_IGNORE);
	signal spi_state		: spi_state_t := SS_ADDR;
	signal spi_counter		: unsigned(3 downto 0) := to_unsigned(0, 4);
	signal spi_shift		: std_logic_vector(15 downto 0) := X"0000";
	
	signal spi_mode_rw		: std_logic := '0';	-- R:1, W:0
	signal spi_mode_cs		: std_logic := '0';	-- C:1, S:0
	signal spi_reg_addr		: unsigned(12 downto 0) := to_unsigned(0, 13);
	signal spi_reg_size		: unsigned(15 downto 0) := X"0000";
	signal spi_reg_cnt		: unsigned(15 downto 0) := X"0000";
	
	signal spi_write_buf	: std_logic_vector(15 downto 0) := X"0000";	-- ライトバッファ
	signal spi_read_buf		: std_logic_vector(15 downto 0) := X"0000";	-- リードバッファ
	
	
	
	
	
	
	-- メモリー
	signal pbus_reading		: std_logic := '0';
	signal pbus_waiting		: std_logic := '0';
	
	-- ハンドシェーク
	signal req_write		: std_logic := '0';
	signal req_write_delay	: std_logic := '0';
	signal ack_write		: std_logic := '0';
	signal req_read			: std_logic := '0';
	signal req_read_delay	: std_logic := '0';
	signal ack_read			: std_logic := '0';
	
	
	
	
	
begin
	
	
	
	-- SPIクロックMUX
	sclk_bufgmux : BUFGMUX
		generic map(
			CLK_SEL_TYPE	=> "ASYNC"
		)
		port map(
			I0	=> SPI_SCLK,
			I1	=> CLK_ALT,
			O	=> spi_sclk_int,
			S	=> spi_ncs_ff2
		);
	
	-- nCSピンの同期化
	process(CLK_ALT)
	begin
		if (rising_edge(CLK_ALT)) then
			spi_ncs_ff1 <= SPI_nCS;
			spi_ncs_ff2 <= spi_ncs_ff1;
			spi_ncs_ff3 <= spi_ncs_ff2;
			spi_dout_dis <= spi_ncs_ff2 or RESET;
		end if;
	end process;
	
	
	
	
	-- SPI部
	SPI_MISO <= spi_dout when spi_dout_dis = '0' else 'Z';
	
	process(RESET, spi_sclk_int)
	variable var_spi_shift		: std_logic_vector(15 downto 0);
	variable var_req_write		: std_logic;
	variable var_req_read		: std_logic;
	begin
		if (rising_edge(spi_sclk_int)) then
			-- 上昇エッジ
				
			var_req_write	:= '0';
			var_req_read	:= '0';
			
			if (spi_ncs_ff3 = '1') then
				-- 非選択・リセット
				spi_state		<= SS_ADDR;
				spi_counter 	<= "0000";
				
				spi_mode_rw		<= '0';
				spi_mode_cs		<= '0';
				
				--spi_reg_addr	<= to_unsigned(0, 13);
				spi_reg_size	<= X"0000";
				spi_reg_cnt		<= X"0000";
				
				
				
				
			else
				-- 選択
				
				spi_counter	<= spi_counter + 1;
				
				if (spi_counter /= 15) then
					-- シフト動作
					var_spi_shift := spi_shift(14 downto 0) & SPI_MOSI;
					spi_shift <= var_spi_shift;
					
				else
					-- シフトレジスタ転送
					var_spi_shift := spi_shift(14 downto 0) & SPI_MOSI;
					spi_write_buf <= var_spi_shift;
					spi_shift <= spi_read_buf;
					
					case spi_state is
					when SS_ADDR =>
						spi_mode_rw <= var_spi_shift(15);
						spi_mode_cs <= var_spi_shift(13);
						spi_reg_addr <= unsigned(var_spi_shift(12 downto 0));
						if (var_spi_shift(15) = '1') then
							-- リード発行
							spi_reg_cnt <= spi_reg_cnt + 1;
							var_req_read := '1';
						end if;
						if (var_spi_shift(15) /= var_spi_shift(14)) then
							-- フラグは正常
							spi_state <= SS_SIZE;
						else
							-- フラグが異常
							spi_state <= SS_IGNORE;
						end if;
						
					when SS_SIZE =>
						spi_reg_size <= unsigned(var_spi_shift);
						if (spi_reg_cnt < unsigned(var_spi_shift) and spi_mode_rw = '1') then
							-- リード発行
							spi_reg_cnt <= spi_reg_cnt + 1;
							var_req_read := '1';
						end if;
						if (spi_mode_cs = '1') then
							if (spi_mode_rw = '0') then
								-- アドレスを戻す
								-- 次のステートで+1されるので±0になる
								spi_reg_addr <= spi_reg_addr - 1;
							elsif (spi_mode_rw = '1') then
								-- アドレスを進める
								spi_reg_addr <= spi_reg_addr + 1;
							end if;
						end if;
						spi_state <= SS_DATA;
						
					when SS_DATA =>
						if (spi_mode_cs = '1') then
							-- アドレスを進める
							spi_reg_addr <= spi_reg_addr + 1;
						end if;
						if (spi_reg_cnt < spi_reg_size) then
							-- カウンタを増やす
							spi_reg_cnt <= spi_reg_cnt + 1;
							if (spi_mode_rw = '0') then
								-- ライト発行
								var_req_write := '1';
							else
								-- リード発行
								var_req_read := '1';
							end if;
						end if;
						spi_state <= SS_DATA;
						
					when others =>
						spi_state <= SS_IGNORE;
					end case;
					
					
				end if;
				
			end if;
			
			req_write	<= var_req_write or (req_write and not ack_write);
			req_read	<= var_req_read or (req_read and not ack_read);
			
		end if;
		
		if (falling_edge(spi_sclk_int)) then
			-- 下降エッジ
			spi_dout	<= spi_shift(15);
			
		end if;
	end process;
	
	
	
	
	-- メモリー
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- フラグに応答
			req_write_delay	<= req_write;
			req_read_delay	<= req_read;
			ack_write	<= req_write_delay;
			ack_read	<= req_read_delay;
			
			if (RESET = '1') then
				PBUS_EN			<= '0';
				PBUS_WR			<= '0';
				PBUS_ADDR		<= X"0000";
				PBUS_DATA_OUT	<= X"0000";
				
				pbus_reading	<= '0';
				pbus_waiting	<= '0';
				
			else
				if (req_write_delay = '1' and ack_write = '0') then
					-- ライト
					PBUS_EN			<= '1';
					PBUS_WR			<= '1';
					PBUS_ADDR		<= std_logic_vector(resize(spi_reg_addr, 16));
					PBUS_DATA_OUT	<= spi_write_buf;
					
					pbus_reading	<= '0';
					pbus_waiting	<= '0';
				elsif (req_read_delay = '1' and ack_read = '0') then
					-- リード
					PBUS_EN			<= '1';
					PBUS_WR			<= '0';
					PBUS_ADDR		<= std_logic_vector(resize(spi_reg_addr, 16));
					
					pbus_reading	<= '1';
					pbus_waiting	<= '1';
				else
					if (pbus_waiting = '1' and PBUS_WAIT = '1') then
						-- リード(ウェイト)
						PBUS_EN			<= '1';
						PBUS_WR			<= '0';
						
						pbus_reading	<= '1';
						pbus_waiting	<= '0';
					else
						-- アイドル
						PBUS_EN			<= '0';
						PBUS_WR			<= '0';
						
						pbus_reading	<= '0';
						pbus_waiting	<= '0';
					end if;
				end if;
			end if;
			
			
			if (pbus_reading = '1') then
				-- リードデータの格納
				spi_read_buf	<= PBUS_DATA_IN;
			end if;
			
			
		end if;
	end process;
	
	
end;
 