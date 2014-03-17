--!	@file
--!	@brief 波形観測部



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package SignalScope_pkg is
	component SignalScope is
		generic(
			BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			
			SYNC_IN			: in	std_logic;
			CH0_DATA		: in	std_logic_vector(15 downto 0);
			CH1_DATA		: in	std_logic_vector(15 downto 0);
			CH2_DATA		: in	std_logic_vector(15 downto 0);
			CH3_DATA		: in	std_logic_vector(15 downto 0);
			CH4_DATA		: in	std_logic_vector(15 downto 0);
			CH5_DATA		: in	std_logic_vector(15 downto 0);
			CH6_DATA		: in	std_logic_vector(15 downto 0);
			CH7_DATA		: in	std_logic_vector(15 downto 0);
			
			MEM_EN			: in	std_logic;
			MEM_WR			: in	std_logic;
			MEM_WAIT		: out	std_logic;
			MEM_ADDR		: in	std_logic_vector(15 downto 0);
			MEM_DATA_IN		: in	std_logic_vector(15 downto 0);
			MEM_DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
end SignalScope_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library work;
use work.SignalScope_Mem_pkg.all;

library UNISIM;
use UNISIM.Vcomponents.all;

entity SignalScope is
	generic(
		BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- 観測信号
		SYNC_IN			: in	std_logic;
		CH0_DATA		: in	std_logic_vector(15 downto 0);
		CH1_DATA		: in	std_logic_vector(15 downto 0);
		CH2_DATA		: in	std_logic_vector(15 downto 0);
		CH3_DATA		: in	std_logic_vector(15 downto 0);
		CH4_DATA		: in	std_logic_vector(15 downto 0);
		CH5_DATA		: in	std_logic_vector(15 downto 0);
		CH6_DATA		: in	std_logic_vector(15 downto 0);
		CH7_DATA		: in	std_logic_vector(15 downto 0);
			
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

architecture RTL of SignalScope is
	
	-- 定数
	constant LOG_CHANNELS	: integer := 8;
	
	-- メモリーインターフェース
	constant BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal mem_select		: std_logic;
	signal mem_select_edge	: std_logic;
	signal mem_masked_addr	: std_logic_vector(15 downto 0);
	
	signal mem_wr_cr		: std_logic;
	signal mem_wr_addr		: std_logic;
	
	signal mem_rd_sr		: std_logic;
	signal mem_rd_conf		: std_logic;
	signal mem_rd_ch0		: std_logic;
	signal mem_rd_ch1		: std_logic;
	signal mem_rd_ch2		: std_logic;
	signal mem_rd_ch3		: std_logic;
	signal mem_rd_ch4		: std_logic;
	signal mem_rd_ch5		: std_logic;
	signal mem_rd_ch6		: std_logic;
	signal mem_rd_ch7		: std_logic;
	
	-- レジスタ
	signal reg_start		: std_logic := '0';
	signal reg_end			: std_logic := '1';
	signal reg_addr			: std_logic_vector(LOG_LENGTH-1 downto 0);
	signal reg_ch0data		: std_logic_vector(15 downto 0);
	signal reg_ch1data		: std_logic_vector(15 downto 0);
	signal reg_ch2data		: std_logic_vector(15 downto 0);
	signal reg_ch3data		: std_logic_vector(15 downto 0);
	signal reg_ch4data		: std_logic_vector(15 downto 0);
	signal reg_ch5data		: std_logic_vector(15 downto 0);
	signal reg_ch6data		: std_logic_vector(15 downto 0);
	signal reg_ch7data		: std_logic_vector(15 downto 0);
	
	-- ブロックRAM
	signal ram_wr_addr		: std_logic_vector(LOG_LENGTH-1 downto 0);
	signal ram_wr_addr_std	: std_logic_vector(LOG_LENGTH-1 downto 0);
	signal ram_wr_en		: std_logic;
	signal ram_wr_wr		: std_logic;
	signal ram_rd_addr_chx	: std_logic_vector(LOG_LENGTH-1 downto 0);
	
	signal ram_sync_edge	: std_logic;
	
	
	
	
	-- フラグ
	signal flag_clear		: std_logic := '1';
	signal flag_set			: std_logic := '0';
	signal flag_inc			: std_logic := '0';
	
	
begin
	
	
	
	
	-- メモリーインターフェース
	mem_select	<= MEM_EN when (BASE_MASK and MEM_ADDR) = BASE_ADDRESS else '0';
	mem_masked_addr	<= MEM_ADDR and ADDRESS_MASK;
	
	mem_wr_cr		<= mem_select and MEM_WR		when mem_masked_addr = X"0000" else '0';
	mem_rd_sr		<= mem_select and not MEM_WR	when mem_masked_addr = X"0001" else '0';
	mem_rd_conf		<= mem_select and not MEM_WR	when mem_masked_addr = X"0002" else '0';
	mem_wr_addr		<= mem_select and MEM_WR		when mem_masked_addr = X"0003" else '0';
	mem_rd_ch0		<= mem_select and not MEM_WR	when mem_masked_addr = X"0010" else '0';
	mem_rd_ch1		<= mem_select and not MEM_WR	when mem_masked_addr = X"0011" else '0';
	mem_rd_ch2		<= mem_select and not MEM_WR	when mem_masked_addr = X"0012" else '0';
	mem_rd_ch3		<= mem_select and not MEM_WR	when mem_masked_addr = X"0013" else '0';
	mem_rd_ch4		<= mem_select and not MEM_WR	when mem_masked_addr = X"0014" else '0';
	mem_rd_ch5		<= mem_select and not MEM_WR	when mem_masked_addr = X"0015" else '0';
	mem_rd_ch6		<= mem_select and not MEM_WR	when mem_masked_addr = X"0016" else '0';
	mem_rd_ch7		<= mem_select and not MEM_WR	when mem_masked_addr = X"0017" else '0';
	
	MEM_WAIT <= '0';--mem_select;
	
	MEM_DATA_OUT <=	"00000000000000" & reg_end & reg_start		when mem_rd_sr = '1' else
					conv_std_logic_vector(LOG_LENGTH, 8) & conv_std_logic_vector(LOG_CHANNELS, 8)	when mem_rd_conf = '1' else
					--"000000" & ram_rd_addr_chx			when mem_rd_ch0 = '1' else
					reg_ch0data				when mem_rd_ch0 = '1' else
					reg_ch1data				when mem_rd_ch1 = '1' else
					reg_ch2data				when mem_rd_ch2 = '1' else
					reg_ch3data				when mem_rd_ch3 = '1' else
					reg_ch4data				when mem_rd_ch4 = '1' else
					reg_ch5data				when mem_rd_ch5 = '1' else
					reg_ch6data				when mem_rd_ch6 = '1' else
					reg_ch7data				when mem_rd_ch7 = '1' else
					X"0000";
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			-- 上昇エッジ
			
			if (RESET = '1') then
				-- リセット
				reg_start	<= '0';
				reg_addr	<= conv_std_logic_vector(0, LOG_LENGTH);
				
				flag_clear	<= '1';
				flag_set	<= '0';
				flag_inc	<= '0';
				
				
			else
				-- 動作中
				
				-- ライト
				if (mem_wr_cr = '1') then
					-- コントロールレジスタ (CR)
					reg_start	<= MEM_DATA_IN(0);
					flag_clear	<= '1';
				else
					flag_clear	<= '0';
				end if;
				
				if (mem_wr_addr = '1') then
					reg_addr	<= MEM_DATA_IN(LOG_LENGTH-1 downto 0);
					flag_set	<= '1';
				else
					flag_set	<= '0';
				end if;
				
				if ((mem_rd_ch0 or mem_rd_ch1 or mem_rd_ch2 or mem_rd_ch3
					or mem_rd_ch4 or mem_rd_ch5 or mem_rd_ch6 or mem_rd_ch7) = '1') then
					flag_inc	<= '1';
				else
					flag_inc	<= '0';
				end if;
				
				
			end if;
			
			if (flag_clear = '1') then
				ram_rd_addr_chx	<= conv_std_logic_vector(0, LOG_LENGTH);
			elsif (flag_set = '1') then
				ram_rd_addr_chx	<= reg_addr;
			elsif (flag_inc = '1') then
				ram_rd_addr_chx <= ram_rd_addr_chx + 1;
			end if;
			
			
		end if;
	end process;
	
	
	
	
	-- メモリー制御
	ram_wr_wr	<= '1' when SYNC_IN = '1' and ram_sync_edge = '0' else '0';
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			
			ram_sync_edge	<= SYNC_IN;
			
			
			if (RESET = '1') then
				-- リセット
				reg_end		<= '1';
				
				ram_wr_en	<= '0';
				ram_wr_addr	<= conv_std_logic_vector(0, LOG_LENGTH);
				
				
				
			else
				-- 動作中
				
				if (flag_clear = '1') then
					-- クリア
					reg_end		<= '1';
					
					ram_wr_en	<= '0';
					ram_wr_addr	<= conv_std_logic_vector(0, LOG_LENGTH);
					
				else
					if (reg_start = '0' or ram_wr_addr = (2 ** LOG_LENGTH - 1)) then
						-- 停止
						reg_end		<= '1';
						
						ram_wr_en	<= '0';
						
					else
						-- 記録
						reg_end		<= '0';
						
						ram_wr_en	<= '1';
						if (ram_wr_wr = '1') then
							ram_wr_addr	<= ram_wr_addr + 1;
						end if;
						
					end if;
				end if;
				
				
			end if;
		end if;
	end process;
	
	
	
	
	-- RAM
	ch0_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH0_DATA,
			B_EN	=> '1',--mem_rd_ch0,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch0data
		);
	
	ch1_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH1_DATA,
			B_EN	=> '1',--mem_rd_ch1,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch1data
		);
	
	ch2_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH2_DATA,
			B_EN	=> '1',--mem_rd_ch2,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch2data
		);
	
	ch3_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH3_DATA,
			B_EN	=> '1',--mem_rd_ch3,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch3data
		);
	
	ch4_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH4_DATA,
			B_EN	=> '1',--mem_rd_ch4,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch4data
		);
	
	ch5_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH5_DATA,
			B_EN	=> '1',--mem_rd_ch5,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch5data
		);
	
	ch6_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH6_DATA,
			B_EN	=> '1',--mem_rd_ch6,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch6data
		);
	
	ch7_ram : SignalScope_Mem
		port map(
			CLK_SYS	=> CLK_SYS,
			A_EN	=> ram_wr_en,
			A_WR	=> ram_wr_wr,
			A_ADDR	=> ram_wr_addr,
			A_DI	=> CH7_DATA,
			B_EN	=> '1',--mem_rd_ch7,
			B_ADDR	=> ram_rd_addr_chx,
			B_DO	=> reg_ch7data
		);
	
	
	
end;
