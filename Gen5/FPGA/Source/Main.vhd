--
--!	@file
--!	@brief 最上層のモジュール



library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library UNISIM;
use UNISIM.Vcomponents.all;

library work;
use work.ClockGenerator_pkg.all;
use work.SPIBridge_pkg.all;
use work.IOManager_pkg.all;
use work.ShiftRegisterIO_pkg.all;
use work.openMSP430_pkg.all;
use work.InterruptController_pkg.all;
use work.LoggerFIFO_pkg.all;
use work.BLDCControllerQuad_pkg.all;
use work.BLDCControllerDribble_pkg.all;
use work.WishboneBridge_pkg.all;
use work.UART16550_pkg.all;
use work.SimpleSPI_pkg.all;


use work.openMSP430_NPX_pkg.all;
use work.openMSP430_SMPX_pkg.all;

use work.SharedMemory_pkg.all;

use work.synchronizer_pkg.all;






---- エンティティ --------------------------------------------------------------

entity Main is
	port(
	-- クロック入力
		CLK_IN				: in	std_logic;
		
	-- 電源制御
		PWR_5V				: out	std_logic;
		
	-- 未使用
		nINIT				: out	std_logic;
		AUX0				: inout	std_logic;
		AUX1				: inout	std_logic;
		AUX2				: inout	std_logic;
		
	-- SPIスレーブ
		SPI_nCS				: in	std_logic;
		SPI_SCLK			: in	std_logic;
		SPI_SCLK2			: in	std_logic;
		SPI_MOSI			: in	std_logic;
		SPI_MISO			: out	std_logic;
		
	-- モーター1
		MOT1_PWM			: out	std_logic_vector(2 downto 0);
		MOT1_nRESET			: out	std_logic_vector(2 downto 0);
		MOT1_nFAULT			: in	std_logic;
		MOT1_nOTW			: in	std_logic;
		
	-- モーター2
		MOT2_PWM			: out	std_logic_vector(2 downto 0);
		MOT2_nRESET			: out	std_logic_vector(2 downto 0);
		MOT2_nFAULT			: in	std_logic;
		MOT2_nOTW			: in	std_logic;
		
	-- モーター3
		MOT3_PWM			: out	std_logic_vector(2 downto 0);
		MOT3_nRESET			: out	std_logic_vector(2 downto 0);
		MOT3_nFAULT			: in	std_logic;
		MOT3_nOTW			: in	std_logic;
		
	-- モーター4
		MOT4_PWM			: out	std_logic_vector(2 downto 0);
		MOT4_nRESET			: out	std_logic_vector(2 downto 0);
		MOT4_nFAULT			: in	std_logic;
		MOT4_nOTW			: in	std_logic;
		
	-- モーター5
		MOT5_PWM			: out	std_logic_vector(2 downto 0);
		MOT5_nRESET			: out	std_logic_vector(2 downto 0);
		MOT5_nFAULT			: in	std_logic;
		MOT5_nOTW			: in	std_logic;
		
	-- モーター1,2 センサー
		MOT12_EN_SENSORS	: out	std_logic;
		MOT12_nLATCH		: out	std_logic;
		MOT12_CLK			: out	std_logic;
		MOT12_nDO			: in	std_logic;
		
	-- モーター3,4,5 センサー
		MOT345_EN_SENSORS	: out	std_logic;
		MOT345_nLATCH		: out	std_logic;
		MOT345_CLK			: out	std_logic;
		MOT345_nDO			: in	std_logic;
		
	-- ADC1
		ADC1_nCS			: out	std_logic;
		ADC1_SCLK			: out	std_logic;
		ADC1_MOSI			: out	std_logic;
		ADC1_MISO			: in	std_logic;
		
	-- ADC2
		ADC2_nCS			: out	std_logic;
		ADC2_SCLK			: out	std_logic;
		ADC2_MOSI			: out	std_logic;
		ADC2_MISO			: in	std_logic;
	
	-- モーター5 電流センサー
		MOT5_CUR_SDA		: inout	std_logic;
		MOT5_CUR_SCL		: inout	std_logic;
	
	-- 外部ヘッダー1
		EXT1_nCS			: out	std_logic;
		EXT1_SCLK			: out	std_logic;
		EXT1_MOSI			: out	std_logic;
		EXT1_MISO			: in	std_logic;
		EXT1_CE				: out	std_logic;
		EXT1_IRQ			: in	std_logic;
	
	-- ボール検知
		BALL_EN				: out	std_logic;
		BALL_SCL			: inout	std_logic;
		BALL_DETECT			: inout	std_logic;
	
	-- XBee
		XBEE_nRESET			: out	std_logic;
		XBEE_TX				: out	std_logic;
		XBEE_RX				: in	std_logic;
		XBEE_nCTS			: in	std_logic;
	
	-- LED・ブザー
		LED_CLK				: out	std_logic;
		LED_DO				: out	std_logic
	);
end;



---- アーキテクチャ ------------------------------------------------------------

architecture RTL of Main is
	
	signal clk_sys1			: std_logic;	-- システムクロック1
	signal clk_sys2			: std_logic;	-- システムクロック2
	signal clk_pwm			: std_logic;	-- PWMクロック
	
	signal reset_p			: std_logic;
	signal reset_n			: std_logic;
	signal omsp_reset		: std_logic;
	
	signal tick_sync		: std_logic;	-- 1ms周期の同期信号(ワンショット)
	signal tick_counter		: std_logic_vector(31 downto 0);
	
	signal omsp_sync		: std_logic;	-- OMSP周りの同期信号(ワンショット)
	
	
	-- 入力信号
	signal BALL_DETECT_int	: std_logic;
	signal EXT1_IRQ_int		: std_logic;
	signal XBEE_nCTS_int	: std_logic;
	
	-- GPIO
	signal iom_gpoa			: std_logic_vector(15 downto 0);
	signal iom_gpob			: std_logic_vector(15 downto 0);
	signal iom_gpoc			: std_logic_vector(15 downto 0);
	signal iom_gpod			: std_logic_vector(15 downto 0);
	signal iom_gpia			: std_logic_vector(15 downto 0) := X"0000";
	signal iom_gpib			: std_logic_vector(15 downto 0) := X"0000";
	signal iom_gpic			: std_logic_vector(15 downto 0) := X"0000";
	signal iom_gpid			: std_logic_vector(15 downto 0) := X"0000";
	
	-- Pバス
	signal pbus_en			: std_logic;
	signal pbus_wr			: std_logic;
	signal pbus_wait		: std_logic;
	signal pbus_addr		: std_logic_vector(15 downto 0);
	signal pbus_din			: std_logic_vector(15 downto 0);
	signal pbus_dout		: std_logic_vector(15 downto 0);
	
	signal pbus_wait_iom	: std_logic;
	signal pbus_wait_omsp	: std_logic;
	signal pbus_wait_fifo	: std_logic;
	signal pbus_wait_smem	: std_logic;
	signal pbus_wait_qmotor	: std_logic;
	signal pbus_wait_drmot	: std_logic;
	
	signal pbus_dout_iom	: std_logic_vector(15 downto 0);
	signal pbus_dout_omsp	: std_logic_vector(15 downto 0);
	signal pbus_dout_fifo	: std_logic_vector(15 downto 0);
	signal pbus_dout_smem	: std_logic_vector(15 downto 0);
	signal pbus_dout_qmotor	: std_logic_vector(15 downto 0);
	signal pbus_dout_drmot	: std_logic_vector(15 downto 0);
	
	-- Xバス
	signal xbus_en			: std_logic;
	signal xbus_wr			: std_logic_vector(1 downto 0);
	signal xbus_addr		: std_logic_vector(15 downto 0);
	signal xbus_dout		: std_logic_vector(15 downto 0);
	signal xbus_din			: std_logic_vector(15 downto 0);
	signal xbus_irq			: std_logic_vector(13 downto 0) := "00000000000000";
	signal xbus_irq_acc		: std_logic_vector(13 downto 0);
	
	signal xbus_dout_intc	: std_logic_vector(15 downto 0);
	signal xbus_dout_iom	: std_logic_vector(15 downto 0);
	signal xbus_dout_uart	: std_logic_vector(15 downto 0);
	signal xbus_dout_spi	: std_logic_vector(15 downto 0);
	signal xbus_dout_fifo	: std_logic_vector(15 downto 0);
	signal xbus_dout_smpx	: std_logic_vector(15 downto 0);
	signal xbus_dout_qmotor	: std_logic_vector(15 downto 0);
	signal xbus_dout_drmot	: std_logic_vector(15 downto 0);
	signal xbus_dout_npx	: std_logic_vector(15 downto 0);
	signal xbus_dout_smem	: std_logic_vector(15 downto 0);
	
	-- Wishbone1 UART16550
	signal wb1_rst			: std_logic;
	signal wb1_cyc			: std_logic;
	signal wb1_stb			: std_logic;
	signal wb1_we			: std_logic;
	signal wb1_addr			: std_logic_vector(2 downto 0);
	signal wb1_dout			: std_logic_vector(7 downto 0);
	signal wb1_din			: std_logic_vector(7 downto 0);
	signal wb1_irq			: std_logic;
	
	-- Wishbone2 SimpleSPI
	signal wb2_rst			: std_logic;
	signal wb2_cyc			: std_logic;
	signal wb2_stb			: std_logic;
	signal wb2_we			: std_logic;
	signal wb2_addr			: std_logic_vector(1 downto 0);
	signal wb2_dout			: std_logic_vector(7 downto 0);
	signal wb2_din			: std_logic_vector(7 downto 0);
	
	-- XDMA
	signal xdma_en1			: std_logic;
	signal xdma_en2			: std_logic;
	signal xdma_wr			: std_logic;
	signal xdma_addr1		: std_logic_vector(OMSP_DMEM_MSB32 downto 0);
	signal xdma_addr2		: std_logic_vector(OMSP_DMEM_MSB32 downto 0);
	signal xdma_dout		: std_logic_vector(31 downto 0);
	signal xdma_din1		: std_logic_vector(31 downto 0);
	signal xdma_din2		: std_logic_vector(31 downto 0);
	
	-- モーター
	signal mot_update		: std_logic;
	signal mot1_bawvu		: std_logic_vector(4 downto 0);
	signal mot2_bawvu		: std_logic_vector(4 downto 0);
	signal mot3_bawvu		: std_logic_vector(4 downto 0);
	signal mot4_bawvu		: std_logic_vector(4 downto 0);
	signal mot5_wvu			: std_logic_vector(2 downto 0);
	signal mot12_powered	: std_logic;
	signal mot345_powered	: std_logic;
	
	
	
	
	
	
	
	
	
	
begin
	-- クロック生成器
	CLKGEN : ClockGenerator
		port map(
			CLK_IN		=> CLK_IN,
			CLK_SYS2	=> clk_sys2,
			CLK_SYS1	=> clk_sys1,
			CLK_PWM		=> clk_pwm,
			TICK_SYNC	=> tick_sync,
			RESET_OUTP	=> reset_p,
			RESET_OUTN	=> reset_n
		);
	
	-- シフトレジスタによる入出力
	SRIO : ShiftRegisterIO
		port map(
			CLK_SYS			=> clk_sys1,
			RESET			=> reset_p,
			
			LED_CLK			=> LED_CLK,
			LED_DO			=> LED_DO,
			
			MOT12_nLATCH	=> MOT12_nLATCH,
			MOT12_CLK		=> MOT12_CLK,
			MOT12_nDO		=> MOT12_nDO,
			MOT345_nLATCH	=> MOT345_nLATCH,
			MOT345_CLK		=> MOT345_CLK,
			MOT345_nDO		=> MOT345_nDO,
			
			LED_IN			=> iom_gpoa(6 downto 0),
			BUZ_IN			=> iom_gpoa(15),
			
			MOT_UPDATE_OUT	=> mot_update,
			MOT1_BAWVU_OUT	=> mot1_bawvu,
			MOT2_BAWVU_OUT	=> mot2_bawvu,
			MOT3_BAWVU_OUT	=> mot3_bawvu,
			MOT4_BAWVU_OUT	=> mot4_bawvu,
			MOT5_WVU_OUT	=> mot5_wvu,
			MOT12_POWERED	=> mot12_powered,
			MOT345_POWERED	=> mot345_powered
		);
	
	-- SPI-to-Pバス・ブリッジ
	SPIBUSMST : SPIBridge
		port map(
			CLK_SYS			=> clk_sys1,
			CLK_ALT			=> clk_sys1,
			RESET			=> reset_p,
			SPI_nCS			=> SPI_nCS,
			SPI_SCLK		=> SPI_SCLK,
			SPI_MOSI		=> SPI_MOSI,
			SPI_MISO		=> SPI_MISO,
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_din,
			PBUS_DATA_OUT	=> pbus_dout
		);
	
	-- IOM (PBUS:0x0000～0x00FF, XBUS:0x0020～0x003F)
	IOM : IOManager
		generic map(
			PBUS_BASE_ADDRESS	=> X"0000",
			XBUS_BASE_ADDRESS	=> X"0020",
			RESET_VALUE_GPOA	=> X"0000",
			RESET_VALUE_GPOB	=> X"0000",
			RESET_VALUE_GPOC	=> X"0002",
			RESET_VALUE_GPOD	=> X"0000"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			RESET			=> reset_p,
			OMSP_RESET		=> omsp_reset,
			GPOA_OUT		=> iom_gpoa,
			GPOB_OUT		=> iom_gpob,
			GPOC_OUT		=> iom_gpoc,
			GPOD_OUT		=> iom_gpod,
			GPIA_IN			=> iom_gpia,
			GPIB_IN			=> iom_gpib,
			GPIC_IN			=> iom_gpic,
			GPID_IN			=> iom_gpid,
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_iom,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_iom,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_iom
		);
	
	-- OpenMSP430 (PBUS:0x0100～0x01FF)
	OMSP : OMSPWrapper
		generic map(
			PBUS_BASE_ADDRESS	=> X"0100"
		)
		port map(
			CLK_SYS1		=> clk_sys1,
			CLK_SYS2		=> clk_sys2,
			RESET			=> reset_p,
			OMSP_RESET		=> omsp_reset,
			TICK_SYNC_IN	=> tick_sync,
			TICK_CNT_OUT	=> tick_counter,
			NMI_IN			=> '0',
			IRQ_IN			=> xbus_irq,
			IRQ_ACC			=> xbus_irq_acc,
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_omsp,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_omsp,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_din,
			XBUS_DATA_OUT	=> xbus_dout,
			XDMA_EN1		=> xdma_en1,
			XDMA_EN2		=> xdma_en2,
			XDMA_WR			=> xdma_wr,
			XDMA_ADDR1		=> xdma_addr1,
			XDMA_ADDR2		=> xdma_addr2,
			XDMA_DATA_IN	=> xdma_dout,
			XDMA_DATA_OUT1	=> xdma_din1,
			XDMA_DATA_OUT2	=> xdma_din2
		);
	
	-- ロガーFIFO (PBUS:0x0200～0x02FF, XBUS:0x0090～0x009F)
	LOGFIFO : LoggerFIFO
		generic map(
			PBUS_BASE_ADDRESS	=> X"0200",
			XBUS_BASE_ADDRESS	=> X"0090"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			
			RESET			=> reset_p,
			OMSP_RESET		=> omsp_reset,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_fifo,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_fifo,
			
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_fifo
		);
	
	-- 共有メモリー (PBUS:0x0300～0x033F, XBUS:0x0300～0x037F)
	SMEM : SharedMemory
		generic map(
			PBUS_BASE_ADDRESS	=> X"0300",
			XBUS_BASE_ADDRESS	=> X"0300"
		)
		port map(
			CLK_SYS			=> CLK_SYS1,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_smem,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_smem,
			
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_smem
		);
	
	-- クアッドBLDCモーターコントローラ (PBUS:0x0400～0x04FF, XBUS:0x0100～0x011F)
	QMOTOR : BLDCControllerQuad
		generic map(
			PBUS_BASE_ADDRESS	=> X"0400",
			XBUS_BASE_ADDRESS	=> X"0100"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			CLK_PWM			=> clk_pwm,
			
			RESET			=> reset_p,
			OMSP_RESET		=> omsp_reset,
			
			OMSP_SYNC		=> omsp_sync,
			
			BAWVU_UPDATE	=> mot_update,
			BAWVU_IN_0		=> mot1_bawvu,
			BAWVU_IN_1		=> mot2_bawvu,
			BAWVU_IN_2		=> mot3_bawvu,
			BAWVU_IN_3		=> mot4_bawvu,
			
			PWM_OUT_0		=> MOT1_PWM,
			PWM_OUT_1		=> MOT2_PWM,
			PWM_OUT_2		=> MOT3_PWM,
			PWM_OUT_3		=> MOT4_PWM,
			nRESET_OUT_0	=> MOT1_nRESET,
			nRESET_OUT_1	=> MOT2_nRESET,
			nRESET_OUT_2	=> MOT3_nRESET,
			nRESET_OUT_3	=> MOT4_nRESET,
			nFAULT_IN(0)	=> MOT1_nFAULT,
			nFAULT_IN(1)	=> MOT2_nFAULT,
			nFAULT_IN(2)	=> MOT3_nFAULT,
			nFAULT_IN(3)	=> MOT4_nFAULT,
			nOTW_IN(0)		=> MOT1_nOTW,
			nOTW_IN(1)		=> MOT2_nOTW,
			nOTW_IN(2)		=> MOT3_nOTW,
			nOTW_IN(3)		=> MOT4_nOTW,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_qmotor,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_qmotor,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_qmotor
		);
	
	-- ドリブルBLDCモーターコントローラ (PBUS:0x0500～0x05FF, XBUS:0x0120～0x012F)
	DRMOT : BLDCControllerDribble
		generic map(
			PBUS_BASE_ADDRESS	=> X"0500",
			XBUS_BASE_ADDRESS	=> X"0120"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			CLK_PWM			=> clk_pwm,
			
			OMSP_SYNC		=> omsp_sync,
			
			RESET			=> reset_p,
			OMSP_RESET		=> omsp_reset,
			
			WVU_UPDATE		=> mot_update,
			WVU_IN			=> mot5_wvu,
			
			PWM_OUT			=> MOT5_PWM,
			nRESET_OUT		=> MOT5_nRESET,
			nFAULT_IN		=> MOT5_nFAULT,
			nOTW_IN			=> MOT5_nOTW,
			
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_drmot,
			
			PBUS_EN			=> pbus_en,
			PBUS_WR			=> pbus_wr,
			PBUS_WAIT		=> pbus_wait_drmot,
			PBUS_ADDR		=> pbus_addr,
			PBUS_DATA_IN	=> pbus_dout,
			PBUS_DATA_OUT	=> pbus_dout_drmot
		);
	
	
	
	
	-- INTC (XBUS:0x0010～0x001F)
	INTC : InterruptController
		generic map(
			XBUS_BASE_ADDRESS	=> X"0010"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			OMSP_RESET		=> omsp_reset,
			OMSP_SYNC_OUT	=> omsp_sync,
			TICK_SYNC_IN	=> tick_sync,
			TICK_CNT_IN		=> tick_counter,
			EXT_INT_IN		=> EXT1_IRQ_int,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_intc
		);
		
	-- Wishboneブリッジ1 UART16550 (XBUS:0x0050～0x005F)
	WBRIDGE1 : WishboneBridge
		generic map(
			XBUS_BASE_ADDRESS	=> X"0050",
			XBUS_BASE_MASK		=> X"FFF0",
			WB_ADDR_WIDTH		=> 3
		)
		port map(
			CLK_SYS			=> clk_sys1,
			OMSP_RESET		=> omsp_reset,
			IRQ_IN			=> wb1_irq,
			IRQ_OUT			=> xbus_irq(0),
			IRQ_ACC			=> xbus_irq_acc(0),
			WB_RST_O		=> wb1_rst,
			WB_CYC_O		=> wb1_cyc,
			WB_STB_O		=> wb1_stb,
			WB_WE_O			=> wb1_we,
			WB_ADDR_O		=> wb1_addr,
			WB_DAT_O		=> wb1_dout,
			WB_DAT_I		=> wb1_din,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_uart
		);
	
	-- Wishbone1 UART16550
	UARTCON : UART16550
		port map(
			wb_clk_i		=> clk_sys1,
			wb_rst_i		=> wb1_rst,
			wb_adr_i		=> wb1_addr,
			wb_dat_i		=> wb1_dout,
			wb_dat_o		=> wb1_din,
			wb_we_i			=> wb1_we,
			wb_stb_i		=> wb1_stb,
			wb_cyc_i		=> wb1_cyc,
			wb_ack_o		=> open,
			wb_sel_i		=> "1111",
			int_o			=> wb1_irq,
			stx_pad_o		=> XBEE_TX,
			srx_pad_i		=> XBEE_RX,
			rts_pad_o		=> open,
			cts_pad_i		=> XBEE_nCTS,
			dtr_pad_o		=> open,
			dsr_pad_i		=> '1',
			ri_pad_i		=> '1',
			dcd_pad_i		=> '1'
		);
	
	-- Wishboneブリッジ2 SimpleSPI (BBUS:0x0060～0x0067)
	WBRIDGE2 : WishboneBridge
		generic map(
			XBUS_BASE_ADDRESS	=> X"0060",
			XBUS_BASE_MASK		=> X"FFF8",
			WB_ADDR_WIDTH		=> 2
		)
		port map(
			CLK_SYS			=> clk_sys1,
			OMSP_RESET		=> omsp_reset,
			IRQ_IN			=> '0',
			IRQ_OUT			=> open,
			IRQ_ACC			=> '0',
			WB_RST_O		=> wb2_rst,
			WB_CYC_O		=> wb2_cyc,
			WB_STB_O		=> wb2_stb,
			WB_WE_O			=> wb2_we,
			WB_ADDR_O		=> wb2_addr,
			WB_DAT_O		=> wb2_dout,
			WB_DAT_I		=> wb2_din,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_spi
		);
	
	-- Wishbone2 SimpleSPI
	SPIMST : SimpleSPI
		port map(
			clk_i			=> clk_sys1,
			rst_i			=> wb2_rst,
			cyc_i			=> wb2_cyc,
			stb_i			=> wb2_stb,
			adr_i			=> wb2_addr,
			we_i			=> wb2_we,
			dat_i			=> wb2_dout,
			dat_o			=> wb2_din,
			ack_o			=> open,
			inta_o			=> open,
			sck_o			=> EXT1_SCLK,
			mosi_o			=> EXT1_MOSI,
			miso_i			=> EXT1_MISO
		);
	
	-- SMPX (XBUS:0x0180～0x018F)
	SMPX : openMSP430_SMPX
		generic map(
			XBUS_BASE_ADDRESS	=> X"0180"
		)
		port map(
			CLK_SYS1		=> clk_sys1,
			CLK_SYS2		=> clk_sys2,
			OMSP_RESET		=> omsp_reset,
			XDMA_EN1		=> xdma_en1,
			XDMA_EN2		=> xdma_en2,
			XDMA_WR			=> xdma_wr,
			XDMA_ADDR1		=> xdma_addr1,
			XDMA_ADDR2		=> xdma_addr2,
			XDMA_DATA_IN1	=> xdma_din1,
			XDMA_DATA_IN2	=> xdma_din2,
			XDMA_DATA_OUT	=> xdma_dout,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_smpx
		);
	
	-- NPX (XBUS:0x0200～0x02FF)
	NPX : openMSP430_NPX
		generic map(
			XBUS_BASE_ADDRESS	=> X"0200"
		)
		port map(
			CLK_SYS			=> clk_sys1,
			OMSP_RESET		=> omsp_reset,
			XBUS_EN			=> xbus_en,
			XBUS_WR			=> xbus_wr,
			XBUS_ADDR		=> xbus_addr,
			XBUS_DATA_IN	=> xbus_dout,
			XBUS_DATA_OUT	=> xbus_dout_npx
		);
	
	
	
	
	-- バスMUX
	pbus_wait	<=	pbus_wait_iom		or
					pbus_wait_omsp		or
					pbus_wait_fifo		or
					pbus_wait_smem		or
					pbus_wait_qmotor	or
					pbus_wait_drmot		or
					'0';
	
	pbus_din	<=	pbus_dout_iom		or
					pbus_dout_omsp		or
					pbus_dout_fifo		or
					pbus_dout_smem		or
					pbus_dout_qmotor	or
					pbus_dout_drmot		or
					X"0000";
	
	xbus_din	<=	xbus_dout_intc		or
					xbus_dout_iom		or
					xbus_dout_uart		or
					xbus_dout_spi		or
					xbus_dout_fifo		or
					xbus_dout_smpx		or
					xbus_dout_qmotor	or
					xbus_dout_drmot		or
					xbus_dout_npx		or
					xbus_dout_smem		or
					X"0000";
	
	
	
	-- IOMの配線
	PWR_5V				<= iom_gpob(0);
	MOT12_EN_SENSORS	<= iom_gpob(1);
	MOT345_EN_SENSORS	<= iom_gpob(2);
	BALL_EN				<= iom_gpob(3);
	XBEE_nRESET			<= iom_gpoc(0);
	EXT1_nCS			<= iom_gpoc(1);
	EXT1_CE				<= iom_gpoc(2);
	nINIT				<= iom_gpoc(3);
	
	iom_gpia(0)			<= BALL_DETECT_int;
	iom_gpia(1)			<= EXT1_IRQ_int;
	iom_gpia(2)			<= XBEE_nCTS_int;
	iom_gpib			<= mot12_powered & "00000" & mot2_bawvu & mot1_bawvu;
	iom_gpic			<= mot345_powered & "00" & mot5_wvu & mot4_bawvu & mot3_bawvu;
	
	
	
	-- 固定ピン
	--nINIT				<= '0';
	AUX0				<= 'Z';
	AUX1				<= 'Z';
	AUX2				<= 'Z';
	
	ADC1_nCS			<= '1';
	ADC1_SCLK			<= '0';
	ADC1_MOSI			<= '1';
	
	ADC2_nCS			<= '1';
	ADC2_SCLK			<= '0';
	ADC2_MOSI			<= '1';
	
	MOT5_CUR_SCL		<= 'Z';
	MOT5_CUR_SDA		<= 'Z';
	
	BALL_SCL			<= 'Z';
	BALL_DETECT			<= 'Z';
	
	--EXT1_nCE			<= '1';
	--EXT1_SCLK			<= '0';
	--EXT1_MOSI			<= '1';
	--EXT1_CE				<= '0';
	
	--XBEE_nRESET			<= '0';
    --XBEE_TX				<= '1';
	--XBEE_RX			<= 'Z';
	
	
	
	-- 同期化
	dff_gpia0 : DoubleFF port map(clk_sys1, BALL_DETECT_int, BALL_DETECT);
	dff_gpia1 : DoubleFF port map(clk_sys1, EXT1_IRQ_int, EXT1_IRQ);
	dff_gpia2 : DoubleFF port map(clk_sys1, XBEE_nCTS_int, XBEE_nCTS);
	
	
	
	
	-- OMSPのチック割り込み
	process(clk_sys1)
	begin
		if (rising_edge(clk_sys1)) then
			xbus_irq(13) <= omsp_sync or (xbus_irq(13) and not xbus_irq_acc(13));
		end if;
	end process;
	
	
	
	
	
	
	
	
	
	
	
	
end;
 