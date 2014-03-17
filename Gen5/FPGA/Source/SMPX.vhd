--!	@file
--!	@brief スケーラブル・マトリクス・プロセッシング拡張



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

library work;
use work.openMSP430_pkg.all;

package openMSP430_SMPX_pkg is
	component openMSP430_SMPX is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS1		: in	std_logic;
			CLK_SYS2		: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			XDMA_EN1		: out	std_logic;
			XDMA_EN2		: out	std_logic;
			XDMA_WR			: out	std_logic;
			XDMA_ADDR1		: out	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
			XDMA_ADDR2		: out	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
			XDMA_DATA_IN1	: in	std_logic_vector(31 downto 0);
			XDMA_DATA_IN2	: in	std_logic_vector(31 downto 0);
			XDMA_DATA_OUT	: out	std_logic_vector(31 downto 0);
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end openMSP430_SMPX_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.openMSP430_pkg.all;
use work.synchronizer_pkg.all;

entity openMSP430_SMPX is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS1		: in	std_logic;
		CLK_SYS2		: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- XDMA
		XDMA_EN1		: out	std_logic;
		XDMA_EN2		: out	std_logic;
		XDMA_WR			: out	std_logic;
		XDMA_ADDR1		: out	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
		XDMA_ADDR2		: out	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
		XDMA_DATA_IN1	: in	std_logic_vector(31 downto 0);
		XDMA_DATA_IN2	: in	std_logic_vector(31 downto 0);
		XDMA_DATA_OUT	: out	std_logic_vector(31 downto 0);
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of openMSP430_SMPX is
	
	-- 乗算器
	component MUL32X32
		port(
			clk		: in	std_logic;
			a		: in	std_logic_vector(31 downto 0);
			b		: in	std_logic_vector(31 downto 0);
			ce		: in	std_logic;
			p		: out	std_logic_vector(63 downto 0)
		);
	end component;
	
	-- 加減算器
	component ADD48
		port(
			a		: in	std_logic_vector(47 downto 0);
			b		: in	std_logic_vector(47 downto 0);
			clk		: in	std_logic;
			add		: in	std_logic;
			ce		: in	std_logic;
			s		: out	std_logic_vector(47 downto 0)
		);
	end component;
	
	-- FIFO
	component FIFO32X256
		port(
			clk		: in std_logic;
			srst	: in std_logic;
			din		: in std_logic_vector(31 downto 0);
			wr_en	: in std_logic;
			rd_en	: in std_logic;
			dout	: out std_logic_vector(31 downto 0);
			full	: out std_logic;
			empty	: out std_logic
		);
	end component;
	
	
	
	-- 型宣言
	constant SIZE_WIDTH			: integer := 4;
	constant SIZE_MSB			: integer := 3;
	type SEQSTATE_t is (SEQS_IDLE, SEQS_CALC, SEQS_WRITE);
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"000F";
	
	signal xbus_select			: std_logic;
	signal xbus_masked_addr		: std_logic_vector(15 downto 0);
	
	signal xbus_rd_dispatch		: std_logic;	-- 命令発行
	signal xbus_wr_dispatch		: std_logic;
	signal xbus_wr_addr0		: std_logic;	-- オペランド0のアドレス(ディスティネーション)
	signal xbus_wr_addr1		: std_logic;	-- オペランド1のアドレス(ソース)
	signal xbus_wr_addr2		: std_logic;	-- オペランド2のアドレス(ソース)
	
	signal xbus_reg_opcode		: std_logic_vector(1 downto 0) := "00";	-- オペコード(00:SUB, 01:ADD, 10:SMUL, 11:MUL)
	signal xbus_reg_trans1		: std_logic := '0';						-- オペランド0の転置
	signal xbus_reg_trans2		: std_logic := '0';						-- オペランド1の転置
	signal xbus_reg_col1		: unsigned(SIZE_MSB downto 0) := X"0";	-- オペランド0の列数(横の要素数) 要素数は転置後のものを表す
	signal xbus_reg_row1		: unsigned(SIZE_MSB downto 0) := X"0";	-- オペランド0の行数(縦の要素数)
	signal xbus_reg_col2		: unsigned(SIZE_MSB downto 0) := X"0";	-- オペランド1の列数(横の要素数)
	-- xbus_reg_row2 <= xbus_reg_col1
	-- xbus_reg_col0 <= xbus_reg_col2
	-- xbus_reg_row0 <= xbus_reg_row1
	-- オペコードがMUL以外のときは、col1=1を指定
	
	signal xbus_reg_addr0		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	signal xbus_reg_addr1		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	signal xbus_reg_addr2		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	
	
	-- シーケンサ
	signal seq_start_req	: std_logic := '0';
	signal seq_start_ack	: std_logic;
	signal seq_finish_req	: std_logic := '0';
	signal seq_finish_ack	: std_logic;
	signal seq_overflow		: std_logic := '0';
	signal seq_overflow_ff1	: std_logic := '0';
	signal seq_overflow_ff2	: std_logic := '0';
	signal seq_busy			: std_logic := '0';
	signal seq_state		: SEQSTATE_t := SEQS_IDLE;
	signal seq_counter_init	: unsigned(SIZE_MSB downto 0);
	signal seq_counter		: unsigned(SIZE_MSB downto 0);
	signal seq_stage_sr		: std_logic_vector(11 downto 0) := "000000000000";
	signal seq_write_sr		: std_logic_vector(11 downto 0) := "000000000000";
	signal seq_x0			: unsigned(SIZE_MSB downto 0) := X"8";	-- 計算中の要素座標x
	signal seq_y0			: unsigned(SIZE_MSB downto 0) := X"7";	-- 計算中の要素座標y
	signal seq_x1			: unsigned(SIZE_MSB downto 0) := X"6";
	signal seq_y1			: unsigned(SIZE_MSB downto 0) := X"5";
	signal seq_x2			: unsigned(SIZE_MSB downto 0) := X"4";
	signal seq_y2			: unsigned(SIZE_MSB downto 0) := X"3";
	
	-- DMAコントローラ
	signal dma_rd_req		: std_logic;
	signal dma_wr_req		: std_logic := '0';
	signal dma_wr_req_ff	: std_logic := '0';
	signal dma_addr0		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	--signal dma_addr1		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	--signal dma_addr2		: unsigned(OMSP_DMEM_MSB32 downto 0) := to_unsigned(0, OMSP_DMEM_MSB32+1);
	signal dma_disp1		: unsigned(SIZE_WIDTH*2-1 downto 0) := to_unsigned(0, SIZE_WIDTH*2);
	signal dma_disp2		: unsigned(SIZE_WIDTH*2-1 downto 0) := to_unsigned(0, SIZE_WIDTH*2);
	signal dma_width0		: unsigned(SIZE_MSB downto 0);
	signal dma_width1		: unsigned(SIZE_MSB downto 0);
	signal dma_width2		: unsigned(SIZE_MSB downto 0);
	signal dma_din1			: std_logic_vector(31 downto 0);
	signal dma_din2			: std_logic_vector(31 downto 0);
	
	-- 乗算器
	signal mul_pout			: std_logic_vector(63 downto 0);
	signal mul_overflow		: std_logic;
	
	-- 加減算器
	signal add_ain			: std_logic_vector(47 downto 0);
	signal add_bin			: std_logic_vector(47 downto 0);
	signal add_pout			: std_logic_vector(47 downto 0);
	signal add_overflow		: std_logic;
	
	-- ライトバックFIFO
	signal fifo_wr			: std_logic;
	signal fifo_rd			: std_logic;
	signal fifo_empty		: std_logic;
	signal fifo_din			: std_logic_vector(31 downto 0);
	signal fifo_dout		: std_logic_vector(31 downto 0);
	
	
	
	
	
begin
	-- Xバス インターフェース
	xbus_select	<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr <= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_rd_dispatch		<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr	= X"0000" else '0';	-- 0
	xbus_wr_dispatch		<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr	= X"0000" else '0';	-- 0
	xbus_wr_addr0			<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr	= X"0002" else '0';	-- 2
	xbus_wr_addr1			<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr	= X"0004" else '0';	-- 4
	xbus_wr_addr2			<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr	= X"0006" else '0';	-- 6
	
	XBUS_DATA_OUT <=	"00000000000000" & seq_overflow_ff2 & seq_busy		when xbus_rd_dispatch = '1' else
						X"0000";
	
	process(CLK_SYS1)
	begin
		if (rising_edge(CLK_SYS1)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				seq_start_req <= '0';
			elsif (seq_busy = '0') then
				-- 動作中(アイドル中)
				if (xbus_wr_dispatch = '1') then
					xbus_reg_opcode	<= XBUS_DATA_IN(15 downto 14);
					xbus_reg_trans1	<= XBUS_DATA_IN(13);
					xbus_reg_trans2	<= XBUS_DATA_IN(12);
					xbus_reg_col1	<= unsigned(XBUS_DATA_IN(11 downto 8));
					xbus_reg_row1	<= unsigned(XBUS_DATA_IN(7 downto 4));
					xbus_reg_col2	<= unsigned(XBUS_DATA_IN(3 downto 0));
					seq_start_req <= '1';
				else
					seq_start_req <= '0';
				end if;
				if (xbus_wr_addr0 = '1') then
					xbus_reg_addr0 <= unsigned(XBUS_DATA_IN(OMSP_DMEM_MSB32+2 downto 2));
				end if;
				if (xbus_wr_addr1 = '1') then
					xbus_reg_addr1 <= unsigned(XBUS_DATA_IN(OMSP_DMEM_MSB32+2 downto 2));
				end if;
				if (xbus_wr_addr2 = '1') then
					xbus_reg_addr2 <= unsigned(XBUS_DATA_IN(OMSP_DMEM_MSB32+2 downto 2));
				end if;
			else
				-- 動作中(計算中)
				seq_start_req <= '0';
			end if;
			
			-- ビジーフラグの保持
			seq_busy <= seq_start_req or (seq_busy and not seq_finish_ack);
			
			-- シンクロナイザ
			seq_overflow_ff1 <= seq_overflow;
			seq_overflow_ff2 <= seq_overflow_ff1;
		end if;
	end process;
	
	
	
	-- ハンドシェーク
	StartHandshake : UnidirHandshake port map(CLK_SYS2, seq_start_ack, CLK_SYS1, seq_start_req);
	BusyHandshake : UnidirHandshake port map(CLK_SYS1, seq_finish_ack, CLK_SYS2, seq_finish_req);
	
	
	
	
	
	-- シーケンサ
	seq_finish_req <= '1' when seq_state = SEQS_IDLE else '0';
	seq_counter_init <=	(xbus_reg_col1 - 1) when xbus_reg_opcode = "11" else
						to_unsigned(0, SIZE_WIDTH);
	seq_y1 <= seq_y0;
	seq_x2 <= seq_x0;
	seq_x1 <= seq_counter when xbus_reg_opcode = "11" else seq_x0;
	seq_y2 <= seq_counter when xbus_reg_opcode = "11" else seq_y0;
	
	process(CLK_SYS2)
	variable var_seq_stage_sr_0		: std_logic;
	variable var_seq_write_sr_0		: std_logic;
	begin
		if (rising_edge(CLK_SYS2)) then
			var_seq_stage_sr_0	:= '0';
			var_seq_write_sr_0	:= '0';
			
			case seq_state is
			when SEQS_IDLE =>
				-- アイドル状態
				if (seq_start_ack = '1') then
					-- 命令発行
					seq_state <= SEQS_CALC;
				else
					seq_state <= SEQS_IDLE;
				end if;
				
				var_seq_write_sr_0 := '1';
				seq_counter <= seq_counter_init;
				seq_x0 <= to_unsigned(0, SIZE_WIDTH);
				seq_y0 <= to_unsigned(0, SIZE_WIDTH);
				
			when SEQS_CALC =>
				-- 計算中
				var_seq_stage_sr_0 := '1';
				
				if (seq_counter > 0) then
					seq_state <= SEQS_CALC;
					seq_counter <= seq_counter - 1;
				else
					var_seq_write_sr_0 := '1';
					seq_counter <= seq_counter_init;
					if ((seq_x0 + 1) /= xbus_reg_col2) then
						seq_state <= SEQS_CALC;
						seq_x0 <= seq_x0 + 1;
					else
						seq_x0 <= to_unsigned(0, SIZE_WIDTH);
						if ((seq_y0 + 1) /= xbus_reg_row1) then
							seq_state <= SEQS_CALC;
							seq_y0 <= seq_y0 + 1;
						else
							seq_state <= SEQS_WRITE;
							seq_y0 <= to_unsigned(0, SIZE_WIDTH);
						end if;
					end if;
				end if;
				
			when SEQS_WRITE =>
				-- 書き戻し中
				seq_stage_sr(0) <= '0';
				if (unsigned(seq_stage_sr) = 0 and fifo_empty = '1') then
					seq_state <= SEQS_IDLE;
				else
					seq_state <= SEQS_WRITE;
				end if;
				--seq_state <= SEQS_IDLE;
				
			when others =>
				seq_stage_sr(0) <= '0';
				seq_state <= SEQS_IDLE;
			end case;
			
			
			
			-- ステージを進める
			seq_stage_sr(9 downto 0)	<= seq_stage_sr(8 downto 0) & var_seq_stage_sr_0;
			seq_stage_sr(10)			<= (seq_stage_sr(9) and xbus_reg_opcode(1)) or (seq_stage_sr(1) and not xbus_reg_opcode(1));
			seq_stage_sr(11)			<= seq_stage_sr(10);
			
			seq_write_sr(10 downto 0)	<= seq_write_sr(9 downto 0) & var_seq_write_sr_0;
			seq_write_sr(11)			<= (seq_write_sr(10) and xbus_reg_opcode(1)) or (seq_write_sr(2) and not xbus_reg_opcode(1));
			
			-- オーバーフローの検知
			seq_overflow	<= (seq_overflow or mul_overflow or add_overflow) and not seq_start_ack;
			
		end if;
	end process;
	
	
	
	-- DMAコントローラ
	dma_rd_req	<= seq_stage_sr(0);
	XDMA_EN1	<= dma_rd_req or dma_wr_req_ff;
	XDMA_EN2	<= dma_rd_req or dma_wr_req_ff;
	XDMA_WR		<= dma_wr_req_ff;
	XDMA_ADDR1	<= std_logic_vector(xbus_reg_addr1 + dma_disp1) when seq_stage_sr(0) = '1' else
				   std_logic_vector(dma_addr0);
	XDMA_ADDR2	<= std_logic_vector(xbus_reg_addr2 + dma_disp2) when seq_stage_sr(0) = '1' else
				   std_logic_vector(dma_addr0);
	
	--fifo_rd <= (not fifo_empty and not dma_wr_pending) when seq_state = SEQS_WRITE else '0';
	fifo_rd <= (not fifo_empty) when seq_state = SEQS_WRITE else '0';
	
	dma_width0	<= xbus_reg_col2;
	dma_width1	<= xbus_reg_col1 when xbus_reg_trans1 = '0' else
				   xbus_reg_row1;
	dma_width2	<= xbus_reg_col2 when xbus_reg_trans2 = '0' else
				   xbus_reg_row1 when xbus_reg_opcode /= "11" else
				   xbus_reg_col1;
	
	process(CLK_SYS2)
	begin
		if (rising_edge(CLK_SYS2)) then
			-- アドレス0
			dma_wr_req <= fifo_rd;
			dma_wr_req_ff <= dma_wr_req;
			if (seq_start_ack = '1') then
				dma_addr0	<= xbus_reg_addr0;
			elsif (dma_wr_req_ff = '1') then 
				dma_addr0 <= dma_addr0 + 1;
			else
				dma_addr0 <= dma_addr0;
			end if;
			
			-- アドレス1
			if (xbus_reg_trans1 = '0') then
				dma_disp1 <= dma_width1 * seq_y1 + seq_x1;
			else
				dma_disp1 <= dma_width1 * seq_x1 + seq_y1;
			end if;
			
			-- アドレス2
			if (xbus_reg_opcode = "10") then
				dma_disp2 <= to_unsigned(0, dma_disp2'length);
			elsif (xbus_reg_trans2 = '0') then
				dma_disp2 <= dma_width2 * seq_y2 + seq_x2;
			else
				dma_disp2 <= dma_width2 * seq_x2 + seq_y2;
			end if;
			
			-- データFF
			dma_din1 <= XDMA_DATA_IN1;
			dma_din2 <= XDMA_DATA_IN2;
			XDMA_DATA_OUT <= fifo_dout;
			
		end if;
	end process;
	
	
	
	-- 乗算器
	mul_overflow	<=	'0' when mul_pout(63 downto 48) = X"0000" else
						'0' when mul_pout(63 downto 48) = X"FFFF" else
						'0' when xbus_reg_opcode(1) = '0' else
						seq_stage_sr(9);
	
	MUL_inst : MUL32X32
		port map(
			clk		=> CLK_SYS2,
			a		=> dma_din1,
			b		=> dma_din2,
			ce		=> seq_busy,
			p		=> mul_pout
		);
	
	
	
	
	-- 加減算器
	add_overflow	<=	'0' when add_pout(47 downto 44) = X"0" else
						'0' when add_pout(47 downto 44) = X"F" else
						'1';
	add_ain	<=	std_logic_vector(resize(signed(dma_din1), 36)) & X"000"	when xbus_reg_opcode(1) = '0' else
				mul_pout(51 downto 4);
	add_bin	<=	std_logic_vector(resize(signed(dma_din2), 36)) & X"000"	when xbus_reg_opcode(1) = '0' else
				X"000000000000"											when seq_write_sr(11) = '1' else
				add_pout;
	
	ADD_inst : ADD48
		port map(
			clk		=> CLK_SYS2,
			add		=> xbus_reg_opcode(0),
			a		=> add_ain,
			b		=> add_bin,
			ce		=> seq_busy,
			s		=> add_pout
		);
	
	
	
	-- ライトバックFIFO
	fifo_wr		<= seq_write_sr(11) and seq_stage_sr(11);
	fifo_din	<= add_pout(43 downto 12);
	
	FIFO_inst : FIFO32X256
		port map(
			clk		=> CLK_SYS2,
			srst	=> OMSP_RESET,
			din		=> fifo_din,
			wr_en	=> fifo_wr,
			rd_en	=> fifo_rd,
			dout	=> fifo_dout,
			full	=> open,
			empty	=> fifo_empty
		);
	
	
	
	
	
	
	
	
	
	
end;
 