--!	@file
--!	@brief OpenMSP430



---- パッケージ ---------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package openMSP430_pkg is
	
	constant OMSP_IMPLEMENT		: boolean := true;
	
	constant OMSP_PMEM_AWIDTH	: integer := 13;				-- 16Kbyte
	constant OMSP_PMEM_MSB		: integer := OMSP_PMEM_AWIDTH - 1;
	
	constant OMSP_DMEM_AWIDTH	: integer := 13;				-- 16Kbyte
	constant OMSP_DMEM_MSB		: integer := OMSP_DMEM_AWIDTH - 1;
	constant OMSP_DMEM_MSB32	: integer := OMSP_DMEM_AWIDTH - 2;
	
	-- OpenMSP430ラッパー
	component OMSPWrapper is
		generic(
			PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
		);
		port(
			CLK_SYS1		: in	std_logic;
			CLK_SYS2		: in	std_logic;
			
			RESET			: in	std_logic;
			OMSP_RESET		: out	std_logic;
			
			TICK_SYNC_IN	: in	std_logic;
			TICK_CNT_OUT	: out	std_logic_vector(31 downto 0);
			
			NMI_IN			: in	std_logic;
			IRQ_IN			: in	std_logic_vector(13 downto 0);
			IRQ_ACC			: out	std_logic_vector(13 downto 0);
			
			PBUS_EN			: in	std_logic;
			PBUS_WR			: in	std_logic;
			PBUS_WAIT		: out	std_logic;
			PBUS_ADDR		: in	std_logic_vector(15 downto 0);
			PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			XBUS_EN			: out	std_logic;
			XBUS_WR			: out	std_logic_vector(1 downto 0);
			XBUS_ADDR		: out	std_logic_vector(15 downto 0);
			XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
			XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
			
			XDMA_EN1		: in	std_logic;
			XDMA_EN2		: in	std_logic;
			XDMA_WR			: in	std_logic;
			XDMA_ADDR1		: in	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
			XDMA_ADDR2		: in	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
			XDMA_DATA_IN	: in	std_logic_vector(31 downto 0);
			XDMA_DATA_OUT1	: out	std_logic_vector(31 downto 0);
			XDMA_DATA_OUT2	: out	std_logic_vector(31 downto 0)
		);
	end component;
end openMSP430_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_arith.all;

library work;
use work.misc_pkg.all;
use work.openMSP430_pkg.all;

entity OMSPWrapper is
	generic(
		PBUS_BASE_ADDRESS	: std_logic_vector(15 downto 0)
	);
	port(
	-- クロック入力
		CLK_SYS1		: in	std_logic;
		CLK_SYS2		: in	std_logic;
		
	-- リセット入出力
		RESET			: in	std_logic;
		OMSP_RESET		: out	std_logic;
		
	-- チックカウンタ
		TICK_SYNC_IN	: in	std_logic;
		TICK_CNT_OUT	: out	std_logic_vector(31 downto 0);
		
	-- 割り込み
		NMI_IN			: in	std_logic;
		IRQ_IN			: in	std_logic_vector(13 downto 0);
		IRQ_ACC			: out	std_logic_vector(13 downto 0);
		
	-- Pバススレーブ
		PBUS_EN			: in	std_logic;
		PBUS_WR			: in	std_logic;
		PBUS_WAIT		: out	std_logic;
		PBUS_ADDR		: in	std_logic_vector(15 downto 0);
		PBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		PBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- Xバスマスター
		XBUS_EN			: out	std_logic;
		XBUS_WR			: out	std_logic_vector(1 downto 0);
		XBUS_ADDR		: out	std_logic_vector(15 downto 0);
		XBUS_DATA_IN	: in	std_logic_vector(15 downto 0);
		XBUS_DATA_OUT	: out	std_logic_vector(15 downto 0);
		
	-- XDMAポート
		XDMA_EN1		: in	std_logic;
		XDMA_EN2		: in	std_logic;
		XDMA_WR			: in	std_logic;
		XDMA_ADDR1		: in	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
		XDMA_ADDR2		: in	std_logic_vector(OMSP_DMEM_MSB32 downto 0);
		XDMA_DATA_IN	: in	std_logic_vector(31 downto 0);
		XDMA_DATA_OUT1	: out	std_logic_vector(31 downto 0);
		XDMA_DATA_OUT2	: out	std_logic_vector(31 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of OMSPWrapper is
	
	-- OpenMSP430コア
	component openMSP430 is
		port(
			-- OUTPUTs
			aclk			: out	std_logic;							-- ASIC ONLY: ACLK
			aclk_en			: out	std_logic;							-- FPGA ONLY: ACLK enable
			dbg_freeze		: out	std_logic;							-- Freeze peripherals
			dbg_i2c_sda_out	: out	std_logic;							-- Debug interface: I2C SDA OUT
			dbg_uart_txd	: out	std_logic;							-- Debug interface: UART TXD
			dco_enable		: out	std_logic;							-- ASIC ONLY: Fast oscillator enable
			dco_wkup		: out	std_logic;							-- ASIC ONLY: Fast oscillator wake-up (asynchronous)
			dmem_addr		: out	std_logic_vector(OMSP_DMEM_MSB downto 0);-- Data Memory address
			dmem_cen		: out	std_logic;							-- Data Memory chip enable (low active)
			dmem_din		: out	std_logic_vector(15 downto 0);		-- Data Memory data input
			dmem_wen		: out	std_logic_vector(1 downto 0);		-- Data Memory write enable (low active)
			irq_acc			: out	std_logic_vector(13 downto 0);		-- Interrupt request accepted (one-hot signal)
			lfxt_enable		: out	std_logic;							-- ASIC ONLY: Low frequency oscillator enable
			lfxt_wkup		: out	std_logic;							-- ASIC ONLY: Low frequency oscillator wake-up (asynchronous)
			mclk			: out	std_logic;							-- Main system clock
			per_addr		: out	std_logic_vector(13 downto 0);		-- Peripheral address
			per_din			: out	std_logic_vector(15 downto 0);		-- Peripheral data input
			per_we			: out	std_logic_vector(1 downto 0);		-- Peripheral write enable (high active)
			per_en			: out	std_logic;							-- Peripheral enable (high active)
			pmem_addr		: out	std_logic_vector(OMSP_PMEM_MSB downto 0);-- Program Memory address
			pmem_cen		: out	std_logic;							-- Program Memory chip enable (low active)
			pmem_din		: out	std_logic_vector(15 downto 0);		-- Program Memory data input (optional)
			pmem_wen		: out	std_logic_vector(1 downto 0);		-- Program Memory write enable (low active) (optional)
			puc_rst			: out	std_logic;							-- Main system reset
			smclk			: out	std_logic;							-- ASIC ONLY: SMCLK
			smclk_en		: out	std_logic;							-- FPGA ONLY: SMCLK enable

			-- INPUTs
			cpu_en			: in	std_logic;							-- Enable CPU code execution (asynchronous and non-glitchy)
			dbg_en			: in	std_logic;							-- Debug interface enable (asynchronous and non-glitchy)
			dbg_i2c_addr	: in	std_logic_vector(6 downto 0);		-- Debug interface: I2C Address
			dbg_i2c_broadcast : in	std_logic_vector(6 downto 0);		-- Debug interface: I2C Broadcast Address (for multicore systems)
			dbg_i2c_scl		: in	std_logic;							-- Debug interface: I2C SCL
			dbg_i2c_sda_in	: in	std_logic;							-- Debug interface: I2C SDA IN
			dbg_uart_rxd	: in	std_logic;							-- Debug interface: UART RXD (asynchronous)
			dco_clk			: in	std_logic;							-- Fast oscillator (fast clock)
			dmem_dout		: in	std_logic_vector(15 downto 0);		-- Data Memory data output
			irq				: in	std_logic_vector(13 downto 0);		-- Maskable interrupts
			lfxt_clk		: in	std_logic;							-- Low frequency oscillator (typ 32kHz)
			nmi				: in	std_logic;							-- Non-maskable interrupt (asynchronous)
			per_dout		: in	std_logic_vector(15 downto 0);		-- Peripheral data output
			pmem_dout		: in	std_logic_vector(15 downto 0);		-- Program Memory data output
			reset_n			: in	std_logic;							-- Reset Pin (low active asynchronous and non-glitchy)
			scan_enable		: in	std_logic;							-- ASIC ONLY: Scan enable (active during scan shifting)
			scan_mode		: in	std_logic;							-- ASIC ONLY: Scan mode
			wkup			: in	std_logic							-- ASIC ONLY: System Wake-up (asynchronous and non-glitchy)
		);
	end component;
	
	-- プログラムメモリー
	component MEM_PMEM is
		port(
			CLKA	: in	std_logic;
			ENA		: in	std_logic;
			WEA		: in	std_logic_vector(0 downto 0);
			ADDRA	: in	std_logic_vector(12 downto 0);
			DINA	: in	std_logic_vector(15 downto 0);
			DOUTA	: out	std_logic_vector(15 downto 0);
			CLKB	: in	std_logic;
			ENB		: in	std_logic;
			WEB		: in	std_logic_vector(0 downto 0);
			ADDRB	: in	std_logic_vector(12 downto 0);
			DINB	: in	std_logic_vector(15 downto 0);
			DOUTB	: out	std_logic_vector(15 downto 0)
		);
	end component;
	
	-- データメモリー
	component MEM_DMEM is
		port(
			CLKA	: in	std_logic;
			ENA		: in	std_logic;
			WEA		: in	std_logic_vector(1 downto 0);
			ADDRA	: in	std_logic_vector(12 downto 0);
			DINA	: in	std_logic_vector(15 downto 0);
			DOUTA	: out	std_logic_vector(15 downto 0);
			CLKB	: in	std_logic;
			ENB		: in	std_logic;
			WEB		: in	std_logic_vector(3 downto 0);
			ADDRB	: in	std_logic_vector(11 downto 0);
			DINB	: in	std_logic_vector(31 downto 0);
			DOUTB	: out	std_logic_vector(31 downto 0)
		);
	end component;
	
	
	
	-- Pバス
	constant BASE_MASK		: std_logic_vector(15 downto 0) := X"FF00";
	constant ADDRESS_MASK	: std_logic_vector(15 downto 0) := X"00FF";
	
	signal pbus_select		: std_logic;
	signal pbus_masked_addr	: std_logic_vector(15 downto 0);
	signal pbus_wait_dmem	: std_logic;
	signal pbus_dout_dmem	: std_logic_vector(15 downto 0);
	
	signal pbus_wr_cr		: std_logic;
	signal pbus_wr_prog		: std_logic;
	signal pbus_wr_tickH	: std_logic;
	signal pbus_wr_tickL	: std_logic;
	
	signal pbus_rd_exist	: std_logic;
	
	signal pbus_reg_run		: std_logic := '0';
	signal pbus_reg_addr	: std_logic_vector(OMSP_PMEM_MSB downto 0);
	
	signal pbus_reg_exist	: std_logic_vector(15 downto 0);
	signal pbus_reg_tickH	: std_logic_vector(15 downto 0);
	signal pbus_reg_tick	: std_logic_vector(31 downto 0);
	
	-- OpenMSP430
	signal x_pmem_nce		: std_logic;
	signal x_pmem_en		: std_logic;
	signal x_pmem_addr		: std_logic_vector(OMSP_PMEM_MSB downto 0);
	signal x_pmem_din		: std_logic_vector(15 downto 0);
	
	signal x_dmem_nce		: std_logic;
	signal x_dmem_en		: std_logic;
	signal x_dmem_nwr		: std_logic_vector(1 downto 0);
	signal x_dmem_we		: std_logic_vector(1 downto 0);
	signal x_dmem_addr		: std_logic_vector(OMSP_DMEM_MSB downto 0);
	signal x_dmem_dout		: std_logic_vector(15 downto 0);
	signal x_dmem_din		: std_logic_vector(15 downto 0);
	
	signal x_dma_we			: std_logic_vector(3 downto 0);
	
	
begin
	
	-- Pバス インターフェース
	pbus_select	<= PBUS_EN when (BASE_MASK and PBUS_ADDR) = PBUS_BASE_ADDRESS else '0';
	pbus_masked_addr	<= PBUS_ADDR and ADDRESS_MASK;
	PBUS_WAIT	<= '0';
	
	pbus_rd_exist	<= pbus_select and not PBUS_WR	when pbus_masked_addr = X"0000" else '0';
	pbus_wr_cr		<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0000" else '0';
	pbus_wr_prog	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0001" else '0';
	pbus_wr_tickH	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0002" else '0';
	pbus_wr_tickL	<= pbus_select and PBUS_WR		when pbus_masked_addr = X"0003" else '0';
	
	PBUS_DATA_OUT	<= pbus_reg_exist when pbus_rd_exist = '1' else X"0000";
	
	
	
	OMSP_RESET 		<= not pbus_reg_run;
	
	TICK_CNT_OUT <= pbus_reg_tick;
	
	process(RESET, CLK_SYS1)
	begin
		if (rising_edge(CLK_SYS1)) then
			-- 上昇エッジ
			
			if (RESET = '1') then
				-- リセット
				pbus_reg_run	<= '0';
				pbus_reg_addr	<= CONV_std_logic_vector(0, pbus_reg_addr'length);
				pbus_reg_tickH	<= X"0000";
				pbus_reg_tick	<= X"00000000";
				
			else
				-- 動作中
				
				-- ライト
				if (pbus_wr_cr = '1') then
					-- コントロールレジスタ (CR)
					pbus_reg_run <= PBUS_DATA_IN(0);
					if (PBUS_DATA_IN(1) = '1') then
						-- アドレスカウンタクリア
						pbus_reg_addr <= CONV_std_logic_vector(0, pbus_reg_addr'length);
					end if;
					
				elsif (pbus_wr_prog = '1') then
					-- プログラム書き込みレジスタ (PROG)
					pbus_reg_addr <= pbus_reg_addr + 1;
				end if;
				
				if (pbus_wr_tickH = '1') then
					-- チックレジスタ (TICKH)
					pbus_reg_tickH <= PBUS_DATA_IN;
				end if;
				if (pbus_wr_tickL = '1') then
					-- チックレジスタ (TICKH)
					pbus_reg_tick <= pbus_reg_tickH & PBUS_DATA_IN;
				else
					if (TICK_SYNC_IN = '1') then
						pbus_reg_tick <= pbus_reg_tick + 1;
					end if;
				end if;
				
			end if;
		end if;
	end process;
	
	
	
	OMSP_IMP : if (OMSP_IMPLEMENT = true) generate
		-- OpenMSP430をインプリメントする
		pbus_reg_exist	<= X"0430";
		
		-- プロセッサコア
		CORE : openMSP430
		port map(
			-- OUTPUTs
			aclk			=> open,
			aclk_en			=> open,
			dbg_freeze		=> open,
			dbg_i2c_sda_out	=> open,
			dbg_uart_txd	=> open,
			dco_enable		=> open,
			dco_wkup		=> open,
			dmem_addr		=> x_dmem_addr,
			dmem_cen		=> x_dmem_nce,
			dmem_din		=> x_dmem_dout,
			dmem_wen		=> x_dmem_nwr,
			irq_acc			=> IRQ_ACC,
			lfxt_enable		=> open,
			lfxt_wkup		=> open,
			mclk			=> open,
			per_addr		=> XBUS_ADDR(14 downto 1),
			per_din			=> XBUS_DATA_OUT,
			per_we			=> XBUS_WR,
			per_en			=> XBUS_EN,
			pmem_addr		=> x_pmem_addr,
			pmem_cen		=> x_pmem_nce,
			pmem_din		=> open,
			pmem_wen		=> open,
			puc_rst			=> open,
			smclk			=> open,
			smclk_en		=> open,

			-- INPUTs
			cpu_en			=> '1',
			dbg_en			=> '0',
			dbg_i2c_addr	=> "0000000",
			dbg_i2c_broadcast => "0000000",
			dbg_i2c_scl		=> '1',
			dbg_i2c_sda_in	=> '1',
			dbg_uart_rxd	=> '1',
			dco_clk			=> CLK_SYS1,
			dmem_dout		=> x_dmem_din,
			irq				=> IRQ_IN,
			lfxt_clk		=> '0',
			nmi				=> NMI_IN,
			per_dout		=> XBUS_DATA_IN,
			pmem_dout		=> x_pmem_din,
			reset_n			=> pbus_reg_run,
			scan_enable		=> '0',
			scan_mode		=> '0',
			wkup			=> '0'
			);
		
		XBUS_ADDR(15)	<= '0';
		XBUS_ADDR(0)	<= '0';
		x_pmem_en	<= not x_pmem_nce;
		x_dmem_en	<= not x_dmem_nce;
		x_dmem_we	<= x_dmem_nwr xor "11";
		x_dma_we	<= and_vector("1111", XDMA_WR);
		
		-- プログラムメモリー
		PMEM : MEM_PMEM
			port map(
				CLKA	=> CLK_SYS1,
				ENA		=> x_pmem_en,
				WEA		=> "0",
				ADDRA	=> x_pmem_addr,
				DINA	=> X"0000",
				DOUTA	=> x_pmem_din,
				CLKB	=> CLK_SYS1,
				ENB		=> pbus_wr_prog,
				WEB(0)	=> pbus_wr_prog,
				ADDRB	=> pbus_reg_addr,
				DINB(15 downto 8)	=> PBUS_DATA_IN(7 downto 0),
				DINB(7 downto 0)	=> PBUS_DATA_IN(15 downto 8),
				DOUTB	=> open
			);
		
		-- データメモリー1
		DMEM1 : MEM_DMEM
			port map(
				CLKA	=> CLK_SYS1,
				ENA		=> x_dmem_en,
				WEA		=> x_dmem_we,
				ADDRA	=> x_dmem_addr,
				DINA	=> x_dmem_dout,
				DOUTA	=> x_dmem_din,
				CLKB	=> CLK_SYS2,
				ENB		=> XDMA_EN1,
				WEB		=> x_dma_we,
				ADDRB	=> XDMA_ADDR1,
				DINB	=> XDMA_DATA_IN,
				DOUTB	=> XDMA_DATA_OUT1
			);
			
		-- データメモリー2
		DMEM2 : MEM_DMEM
			port map(
				CLKA	=> CLK_SYS1,
				ENA		=> x_dmem_en,
				WEA		=> x_dmem_we,
				ADDRA	=> x_dmem_addr,
				DINA	=> x_dmem_dout,
				DOUTA	=> open,
				CLKB	=> CLK_SYS2,
				ENB		=> XDMA_EN2,
				WEB		=> x_dma_we,
				ADDRB	=> XDMA_ADDR2,
				DINB	=> XDMA_DATA_IN,
				DOUTB	=> XDMA_DATA_OUT2
			);
	end generate;
	
	
	
	OMSP_NOT_IMP : if (OMSP_IMPLEMENT = false) generate
		-- OpenMSP430をインプリメントしない
		pbus_reg_exist	<= X"7474";
		
		x_pmem_nce		<= '1';
		x_pmem_addr		<= CONV_std_logic_vector(0, OMSP_PMEM_AWIDTH);
		x_dmem_nce		<= '1';
		x_dmem_nwr		<= "11";
		x_dmem_addr		<= CONV_std_logic_vector(0, OMSP_DMEM_AWIDTH);
		x_dmem_dout		<= X"0000";
		XBUS_EN			<= '0';
		XBUS_WR			<= "00";
		XBUS_ADDR		<= X"0000";
		XBUS_DATA_OUT	<= X"0000";
		IRQ_ACC			<= "00000000000000";
		XDMA_DATA_OUT1	<= X"00000000";
		XDMA_DATA_OUT2	<= X"00000000";
	end generate;
	
	
	
	
	
	
	
end;

