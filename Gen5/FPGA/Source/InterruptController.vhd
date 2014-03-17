--!	@file
--!	@brief 割り込みコントローラ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package InterruptController_pkg is
	component InterruptController is
		generic(
			XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			OMSP_RESET		: in	std_logic;
			
			OMSP_SYNC_OUT	: out	std_logic;
			
			TICK_SYNC_IN	: in	std_logic;
			TICK_CNT_IN		: in	std_logic_vector(31 downto 0);
			
			EXT_INT_IN		: in	std_logic;
			
			XBUS_EN			: in	std_logic;
			XBUS_WR			: in	std_logic_vector(1 downto 0);
			XBUS_ADDR		: in	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end InterruptController_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity InterruptController is
	generic(
		XBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		OMSP_RESET		: in	std_logic;
		
	-- 同期信号出力
		OMSP_SYNC_OUT	: out	std_logic;
		
	-- チックカウンタ
		TICK_SYNC_IN	: in	std_logic;
		TICK_CNT_IN		: in	std_logic_vector(31 downto 0);
		
	-- 外部割り込み入力
		EXT_INT_IN		: in	std_logic;
		
	-- Xバス
		XBUS_EN			: in	std_logic;
		XBUS_WR			: in	std_logic_vector(1 downto 0);
		XBUS_ADDR		: in	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of InterruptController is
	
	-- Xバス
	constant XBUS_BASE_MASK		: std_logic_vector(15 downto 0) := X"FFF0";
	constant XBUS_ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"000F";
	
	signal xbus_select		: std_logic;
	signal xbus_masked_addr	: std_logic_vector(15 downto 0);
	
	
	signal xbus_wr_inte		: std_logic;
	signal xbus_rd_tickL	: std_logic;
	signal xbus_rd_tickH	: std_logic;
	signal xbus_rd_cycle1	: std_logic;
	signal xbus_wr_cycle1	: std_logic;
	signal xbus_rd_cycle16	: std_logic;
	signal xbus_wr_cycle16	: std_logic;
	
	signal xbus_reg_tickH	: std_logic_vector(15 downto 0) := X"0000";
	signal xbus_reg_cycle1	: unsigned(15 downto 0) := X"0000";
	signal xbus_reg_cycle16	: unsigned(19 downto 0) := X"00000";
	signal xbus_reg_top		: unsigned(3 downto 0) := "0000";
	signal xbus_reg_cnt		: unsigned(3 downto 0) := "0000";
	signal xbus_reg_int_en	: std_logic := '0';
	signal xbus_reg_int_ext	: std_logic := '0';
	signal xbus_reg_int_pol	: std_logic := '0';
	
	-- 割り込み信号
	signal ext_int_edge		: std_logic;
	signal sync_int			: std_logic := '0';
	signal sync_countup		: std_logic;
	
	
	
	
	
	
begin
	-- Xバス インターフェース
	xbus_select		<= XBUS_EN when (XBUS_BASE_MASK and XBUS_ADDR) = XBUS_BASE_ADDRESS else '0';
	xbus_masked_addr<= XBUS_ADDR and XBUS_ADDRESS_MASK;
	
	xbus_wr_inte	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0000" else '0';	-- 0,1
	xbus_rd_tickL	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0002" else '0';	-- 2,3
	xbus_rd_tickH	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0004" else '0';	-- 4,5
	xbus_rd_cycle1	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0006" else '0';	-- 6,7
	xbus_wr_cycle1	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0006" else '0';	-- 6,7
	xbus_rd_cycle16	<= xbus_select and (XBUS_WR(0) nor XBUS_WR(1))	when xbus_masked_addr = X"0008" else '0';	-- 8,9
	xbus_wr_cycle16	<= xbus_select and (XBUS_WR(0) or XBUS_WR(1))	when xbus_masked_addr = X"0008" else '0';	-- 8,9
	
	XBUS_DATA_OUT <=	TICK_CNT_IN(15 downto 0)						when xbus_rd_tickL = '1' else
						xbus_reg_tickH									when xbus_rd_tickH = '1' else
						std_logic_vector(xbus_reg_cycle1)				when xbus_rd_cycle1 = '1' else
						std_logic_vector(xbus_reg_cycle16(19 downto 4))	when xbus_rd_cycle16 = '1' else
						X"0000";
	
	
	
	
	-- レジスタ
	process(OMSP_RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			if (OMSP_RESET = '1') then
				-- リセット
				xbus_reg_cycle1 <= to_unsigned(0, xbus_reg_cycle1'length);
				xbus_reg_cycle16 <= to_unsigned(0, xbus_reg_cycle16'length);
				
			else
				-- 動作中
				
				-- ライト
				if (xbus_wr_cycle1 = '1') then
					-- サイクルカウンタ1 (CYCLE1)
					xbus_reg_cycle1 <= to_unsigned(0, xbus_reg_cycle1'length);
				elsif (xbus_reg_cycle1 /= to_unsigned(-1, xbus_reg_cycle1'length)) then
					xbus_reg_cycle1 <= xbus_reg_cycle1 + 1;
				else
					xbus_reg_cycle1 <= xbus_reg_cycle1;
				end if;
				
				if (xbus_wr_cycle16 = '1') then
					-- サイクルカウンタ16 (CYCLE16)
					xbus_reg_cycle16 <= to_unsigned(0, xbus_reg_cycle16'length);
				elsif (xbus_reg_cycle16 /= to_unsigned(-1, xbus_reg_cycle16'length)) then
					xbus_reg_cycle16 <= xbus_reg_cycle16 + 1;
				else
					xbus_reg_cycle16 <= xbus_reg_cycle16;
				end if;
				
				-- リード
				if (xbus_rd_tickL = '1') then
					-- チックカウンタ (TICKL)
					xbus_reg_tickH <= TICK_CNT_IN(31 downto 16);
				end if;
			end if;
		end if;
	end process;
	
	
	
	
	
	
	-- 割り込み
	OMSP_SYNC_OUT <= sync_int;
	
	sync_countup <= TICK_SYNC_IN when xbus_reg_int_ext = '0' else
				    (ext_int_edge xor EXT_INT_IN) and (ext_int_edge xor xbus_reg_int_pol);
	
	process(CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- エッジ検出
			ext_int_edge <= EXT_INT_IN;
			
			if (xbus_wr_inte = '1') then
				-- INTEレジスタ ライト
				sync_int <= '0';
				xbus_reg_top 	<= unsigned(XBUS_DATA_IN(3 downto 0));
				xbus_reg_cnt 	<= unsigned(XBUS_DATA_IN(7 downto 4));
				xbus_reg_int_en <= XBUS_DATA_IN(15);
				xbus_reg_int_ext<= XBUS_DATA_IN(14);
				xbus_reg_int_pol<= XBUS_DATA_IN(13);
			elsif (OMSP_RESET = '1' or xbus_reg_int_en = '0') then
				-- リセット・チック割り込み無効
				sync_int <= '0';
				xbus_reg_top	<= "0000";
				xbus_reg_cnt	<= "0000";
				xbus_reg_int_en	<= '0';
				xbus_reg_int_ext<= '0';
				xbus_reg_int_pol<= '0';
			elsif (sync_countup = '1') then
				-- カウントアップ
				if (xbus_reg_cnt = xbus_reg_top) then
					sync_int <= '1';
					xbus_reg_cnt <= "0000";
				else
					sync_int <= '0';
					xbus_reg_cnt <= xbus_reg_cnt + 1;
				end if;
			else
				sync_int <= '0';
			end if;
		end if;
	end process;
	
	
	
end;
 