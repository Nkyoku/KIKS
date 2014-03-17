--!	@file
--!	@brief I2Cマスター



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package I2CMaster_pkg is
	component I2CMaster is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			I2C_SCL			: inout	std_logic;
			I2C_SDA			: inout	std_logic;
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end I2CMaster_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity I2CMaster is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- I2C
		I2C_SCL			: inout	std_logic;
		I2C_SDA			: inout	std_logic;
		
	-- OMSPメモリー
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of I2CMaster is
	
	-- I2C関連
	signal i2c_prescale		: unsigned(4 downto 0);
	signal i2c_scl_out		: std_logic;
	signal i2c_sda_out		: std_logic;
	signal i2c_sda_in		: std_logic;
	
	type i2c_clk_state_t is (ICS_IDLE, ICS_CHANGE, ICS_FALL, ICS_RISE);
	signal i2c_clk_state	: i2c_clk_state_t := ICS_CHANGE;
	
	type i2c_operate_t is (IOP_IDLE, IOP_START, IOP_STOP, IOP_READ, IOP_FETCH, IOP_WRITE);
	signal i2c_operate		: i2c_operate_t := IOP_IDLE;
	
	signal i2c_counter		: unsigned(3 downto 0);
	signal i2c_buffer		: std_logic_vector(7 downto 0);
	
	-- XBUS
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"000F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	signal xbus_wr_cr		: std_logic;
	signal xbus_rd_sr		: std_logic;
	signal xbus_wr_wrbuf	: std_logic;
	signal xbus_rd_rdbuf	: std_logic;
	
	signal xbus_reg_ack		: std_logic := '0';
	signal xbus_reg_acked	: std_logic := '0';
	signal xbus_reg_trc		: std_logic := '0';
	signal xbus_reg_wrbuf	: std_logic_vector(7 downto 0) := X"00";
	signal xbus_reg_rdbuf	: std_logic_vector(7 downto 0) := X"00";
	
	-- フラグ・ハンドシェーク
	signal req_operation	: std_logic := '0';
	signal ack_operation	: std_logic := '0';
	
	type req_type_t is (RT_START, RT_STOP, RT_READ, RT_WRITE);
	signal req_type			: req_type_t;
	
	
	
	
	
	
	
begin
	
	
	-- I2C
	I2C_SCL	<= '0' when i2c_scl_out = '0' else 'Z';
	I2C_SDA	<= '0' when i2c_sda_out = '0' else 'Z';
	
	with i2c_clk_state select
	i2c_scl_out	<=	'1' when ICS_IDLE,
					'1' when ICS_CHANGE,
					'0' when ICS_FALL,
					'0' when ICS_RISE;
	i2c_sda_in	<=	'0' when I2C_SDA = '0' else '1';
	
	xbus_reg_trc	<= not req_operation when i2c_operate = IOP_IDLE else '0';
	xbus_reg_rdbuf	<= i2c_buffer;
	
	process(OMSP_RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				i2c_prescale	<= to_unsigned(0, i2c_prescale'length);
				i2c_clk_state	<= ICS_CHANGE;
				i2c_operate		<= IOP_IDLE;
				i2c_counter		<= to_unsigned(0, i2c_counter'length);
				
				i2c_sda_out		<= '1';
				
				
				xbus_reg_acked	<= '0';
				
				
			else
				-- 動作中
				
				if (req_operation = '1') then
					-- オペレーションのフェッチ
					i2c_prescale	<= to_unsigned(0, i2c_prescale'length);
					i2c_counter		<= to_unsigned(0, i2c_counter'length);
					
					xbus_reg_acked	<= '0';
					
					case req_type is
					when RT_START =>
						i2c_clk_state	<= ICS_IDLE;
						i2c_operate		<= IOP_START;
					when RT_STOP =>
						i2c_clk_state	<= ICS_RISE;
						i2c_operate		<= IOP_STOP;
					when RT_READ =>
						i2c_clk_state	<= ICS_FALL;
						i2c_operate		<= IOP_READ;
					when RT_WRITE =>
						i2c_clk_state	<= ICS_FALL;
						i2c_operate		<= IOP_FETCH;
					end case;
					
				else
					i2c_prescale	<= i2c_prescale + 1;
					if (i2c_prescale = 0) then
						-- 平常運転
						
						if (i2c_operate = IOP_IDLE) then
							i2c_clk_state	<= ICS_CHANGE;
						elsif (i2c_operate = IOP_FETCH) then
							i2c_clk_state	<= ICS_FALL;
						else
							-- クロックステートを進める
							case i2c_clk_state is
							when ICS_IDLE =>
								i2c_clk_state <= ICS_CHANGE;
							when ICS_CHANGE =>
								i2c_clk_state <= ICS_FALL;
							when ICS_FALL =>
								i2c_clk_state <= ICS_RISE;
							when ICS_RISE =>
								i2c_clk_state <= ICS_IDLE;
							end case;
						end if;
						
						-- 各操作での動作
						case i2c_operate is
						when IOP_IDLE =>
							-- なし
							
						when IOP_START =>
							-- スタートコンディション
							if (i2c_clk_state = ICS_IDLE) then
								i2c_sda_out	<= '0';
							elsif (i2c_clk_state = ICS_CHANGE) then
								i2c_sda_out	<= '0';
								i2c_operate	<= IOP_IDLE;
							end if;
							
						when IOP_STOP =>
							-- ストップコンディション
							if (i2c_clk_state = ICS_RISE) then
								i2c_sda_out	<= '0';
							elsif (i2c_clk_state = ICS_IDLE) then
								i2c_sda_out	<= '1';
								i2c_operate	<= IOP_IDLE;
							end if;
							
						when IOP_READ =>
							-- リード + ACK/NACK送信
							if (i2c_counter < 8) then
								i2c_sda_out	<= '1';
								if (i2c_clk_state = ICS_IDLE) then
									i2c_buffer <= i2c_buffer(6 downto 0) & i2c_sda_in;
								end if;
								if (i2c_clk_state = ICS_CHANGE) then
									i2c_counter <= i2c_counter + 1;
								end if;
							else
								i2c_sda_out	<= not xbus_reg_ack;
								if (i2c_clk_state = ICS_CHANGE) then
									i2c_operate	<= IOP_IDLE;
								end if;
							end if;
							
						when IOP_FETCH =>
							i2c_buffer	<= xbus_reg_wrbuf;
							i2c_operate	<= IOP_WRITE;
							
						when IOP_WRITE =>
							-- ライト + ACK/NACK受信
							if (i2c_counter < 8) then
								if (i2c_clk_state = ICS_FALL) then
									i2c_sda_out <= i2c_buffer(7);
									i2c_buffer <= i2c_buffer(6 downto 0) & i2c_sda_in;
								end if;
								if (i2c_clk_state = ICS_CHANGE) then
									i2c_counter <= i2c_counter + 1;
								end if;
							else
								i2c_sda_out	<= '1';
								if (i2c_clk_state = ICS_IDLE) then
									xbus_reg_acked <= not i2c_sda_in;
								end if;
								if (i2c_clk_state = ICS_CHANGE) then
									i2c_operate	<= IOP_IDLE;
								end if;
							end if;
						end case;
						
						
						
						
						
						
					end if;
				end if;
				
				
				
				
				
				
			end if;
		end if;
	end process;
	
	
	
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_cr		<= xbus_select and XBUS_WR(0)						when xbus_masked_addr = X"0000" else '0';
	xbus_rd_sr		<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0000" else '0';
	xbus_wr_wrbuf	<= xbus_select and XBUS_WR(0)						when xbus_masked_addr = X"0002" else '0';
	xbus_rd_rdbuf	<= xbus_select and not (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';
	
	XBUS_DATA_OUT(15 downto 8)	<=	"000000" & xbus_reg_acked & xbus_reg_trc	when xbus_rd_sr = '1' else
									xbus_reg_rdbuf								when xbus_rd_rdbuf = '1' else
									X"00";
	XBUS_DATA_OUT(7 downto 0)	<= X"00";
	
	process(OMSP_RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				xbus_reg_ack	<= '0';
				xbus_reg_wrbuf	<= X"00";
				
			else
				-- 動作中
				
				-- ライト
				if (xbus_wr_cr = '1') then
					-- コントロールレジスタ (CR)
					xbus_reg_ack	<= XBUS_DATA_IN(2);		-- ACK	Read時にACKを返す
					
					if (XBUS_DATA_IN(3) = '1') then
						req_operation	<= '1';
						req_type		<= RT_READ;			-- READ
					elsif (XBUS_DATA_IN(1) = '1') then
						req_operation	<= '1';
						req_type		<= RT_STOP;			-- STOP
					elsif (XBUS_DATA_IN(0) = '1') then
						req_operation	<= '1';
						req_type		<= RT_START;		-- START
					else
						req_operation	<= '0';
						req_type		<= RT_READ;
					end if;
				elsif (xbus_wr_wrbuf = '1') then
					-- 書き込みバッファレジスタ(WRBUF)
					xbus_reg_wrbuf	<= XBUS_DATA_IN(7 downto 0);
					req_operation	<= '1';
					req_type		<= RT_WRITE;
				else
					req_operation	<= '0';
					req_type		<= RT_READ;
				end if;
			end if;
		end if;
	end process;
	
	
	
	
	
	
	
	
	
end;
 