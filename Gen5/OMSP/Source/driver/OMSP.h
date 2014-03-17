/********************************************************************
*
* Standard register and bit definitions for the Texas Instruments
* MSP430 microcontroller.
*
* Texas Instruments, Version 1.2
*
* Rev. 1.0, ---
* Rev. 1.1, added definitions for Interrupt Vectors xxIV
* Rev. 1.2, added dummy TRAPINT_VECTOR interrupt vector as bugfix for USCI29
*
********************************************************************/

#ifndef __OMSP
#define __OMSP

#define __MSP430_HEADER_VERSION__ 1065           /* Beta-Build-Tag: #0025 */

#ifdef __cplusplus
extern "C" {
#endif



/*----------------------------------------------------------------------------*/
/* PERIPHERAL FILE MAP                                                        */
/*----------------------------------------------------------------------------*/

/* External references resolved by a device-specific linker command file */
#define SFR_8BIT(address)   extern volatile unsigned char address
#define SFR_16BIT(address)  extern volatile unsigned int address
#define SFR_32BIT(address)  extern volatile unsigned long address
#define SFR_64BIT(address)  extern volatile unsigned long long address


/************************************************************
* STATUS REGISTER BITS
************************************************************/

#define C                      (0x0001)
#define Z                      (0x0002)
#define N                      (0x0004)
#define V                      (0x0100)
#define GIE                    (0x0008)
#define CPUOFF                 (0x0010)
#define OSCOFF                 (0x0020)
#define SCG0                   (0x0040)
#define SCG1                   (0x0080)



/************************************************************
* PERIPHERAL FILE MAP
************************************************************/

/************************************************************
* SPECIAL FUNCTION REGISTER ADDRESSES + CONTROL BITS
************************************************************/

SFR_8BIT(IE1);                                /* Interrupt Enable 1 */
#define WDTIE                  (0x01)         /* Watchdog Interrupt Enable */
#define OFIE                   (0x02)         /* Osc. Fault  Interrupt Enable */
#define NMIIE                  (0x10)         /* NMI Interrupt Enable */
#define ACCVIE                 (0x20)         /* Flash Access Violation Interrupt Enable */

SFR_8BIT(IFG1);                               /* Interrupt Flag 1 */
#define WDTIFG                 (0x01)         /* Watchdog Interrupt Flag */
#define OFIFG                  (0x02)         /* Osc. Fault Interrupt Flag */
#define PORIFG                 (0x04)         /* Power On Interrupt Flag */
#define RSTIFG                 (0x08)         /* Reset Interrupt Flag */
#define NMIIFG                 (0x10)         /* NMI Interrupt Flag */




/************************************************************
* HARDWARE MULTIPLIER
************************************************************/
#define __MSP430_HAS_MPY__                    /* Definition to show that Module is available */

SFR_16BIT(MPY);                               /* Multiply Unsigned/Operand 1 */
SFR_16BIT(MPYS);                              /* Multiply Signed/Operand 1 */
SFR_16BIT(MAC);                               /* Multiply Unsigned and Accumulate/Operand 1 */
SFR_16BIT(MACS);                              /* Multiply Signed and Accumulate/Operand 1 */
SFR_16BIT(OP2);                               /* Operand 2 */
SFR_16BIT(RESLO);                             /* Result Low Word */
SFR_16BIT(RESHI);                             /* Result High Word */
SFR_16BIT(SUMEXT);                            /* Sum Extend */



/************************************************************
* Interrupt Controller
************************************************************/
SFR_16BIT(INTE);			// Interrupt Enable Register
SFR_16BIT(TICK16);			// Tick Counter (16bit)
SFR_32BIT(TICK);			// Tick Counter (32bit)
SFR_16BIT(CYCLE1);			// Cycle Counter1 (1/1) (16bit)
SFR_16BIT(CYCLE16);			// Cycle Counter2 (1/16) (16bit)


/************************************************************
* I/O Manager
************************************************************/
typedef struct{
	unsigned short IN;		// Input Register
	unsigned short OUT;		// Output Register
	unsigned short OUTCLR;	// Output Clear Register
	unsigned short OUTSET;	// Output Toggle Register
} PORT_t;
extern volatile PORT_t PORT[4];


/************************************************************
* UART 16550
************************************************************/
typedef struct{
	unsigned short DATA;	// Transmit Holding/Receive Buffer Register
	unsigned short IER;		// Interrupt Enable Register
	unsigned short IIR;		// Interrupt Identification Register
	unsigned short LCR;		// Line Control Register
	unsigned short MCR;		// Modem Control Register
	unsigned short LSR;		// Line Status Register
	unsigned short MSR;		// Modem Status Register
} UART16550_t;
typedef struct{
	unsigned short BAUDL;	// Baudrate Divisor Register (LSB)
	unsigned short BAUDH;	// Baudrate Divisor Register (MSB)
	unsigned short FCR;		// FIFO Control Register
} UART16550Alt_t;
extern volatile UART16550_t UART;			// 主レジスタ
extern volatile UART16550Alt_t UARTALT;		// 代替レジスタ


/************************************************************
* Simple SPI
************************************************************/
typedef struct{
	unsigned short SPCR;	// Control Register
	unsigned short SPSR;	// Status Register
	unsigned short SPDR;	// Data Register
	unsigned short SPER;	// Extensions Register
} SPI_t;
extern volatile SPI_t SPI;


/************************************************************
* Logger FIFO
************************************************************/
SFR_16BIT(LOGTXID);			// FIFO Transmit ID Register (1byte)
SFR_8BIT (LOGTXD1);			// FIFO Transmit Data Register (1byte)
SFR_16BIT(LOGTXD2);			// FIFO Transmit Data Register (2byte)
SFR_32BIT(LOGTXD4);			// FIFO Transmit Data Register (4byte)


/************************************************************
* Scalable Matrix Processing Extension
************************************************************/
SFR_16BIT(SMPXDISPATCH);	// 命令発行
SFR_16BIT(SMPXSTATUS);		// ステータス
SFR_16BIT(SMPXADDR0);		// アドレス0 出力
SFR_16BIT(SMPXADDR1);		// アドレス1 入力1
SFR_16BIT(SMPXADDR2);		// アドレス2 入力2


/************************************************************
* Quad Motor Driver
************************************************************/
typedef struct{
	unsigned short CR;		// Control Register
	unsigned short SR;		// Status Register
	  signed short DUTY[4];	// Duty Register x4
	unsigned short pd0C[2];	// (padding)
	  signed short ROT[4];	// Rotation Register x4
	unsigned short pd18[2];	// (padding)
} QMOTOR_t;
extern volatile QMOTOR_t QMOTOR;


/************************************************************
* Dribble Motor Driver
************************************************************/
typedef struct{
	unsigned short CR;		// Control Register
	unsigned short SR;		// Status Register
	unsigned short DUTY;	// Duty Setting Register
} DRMOT_t;
extern volatile DRMOT_t DRMOT;


/************************************************************
* Numeric Processing Extension
************************************************************/
SFR_32BIT(NPXDVD);		// 除算器 被除数
SFR_32BIT(NPXDVS);		// 除算器 除数
SFR_32BIT(NPXDVQ);		// 除算器 商(**) 32bit
SFR_16BIT(NPXDVQL);		// 除算器 商(-*) 16bit
SFR_16BIT(NPXDVQH);		// 除算器 商(*-) 16bit
SFR_32BIT(NPXMPC);		// 乗算器 被乗数
SFR_32BIT(NPXMPR);		// 乗算器 乗数
SFR_16BIT(NPXMPPLL);	// 乗算器 積(---*) 16bit
SFR_16BIT(NPXMPPUL);	// 乗算器 積(--*-) 16bit
SFR_16BIT(NPXMPPLH);	// 乗算器 積(-*--) 16bit
SFR_16BIT(NPXMPPUH);	// 乗算器 積(*---) 16bit
SFR_32BIT(NPXMPPL);		// 乗算器 積(--**) 32bit
SFR_32BIT(NPXMPPM);		// 乗算器 積(-**-) 32bit
SFR_32BIT(NPXMPPH);		// 乗算器 積(**--) 32bit
SFR_16BIT(NPXFRES);		// 関数器 結果
SFR_16BIT(NPXFLOG2);	// 関数器 2底の対数
SFR_16BIT(NPXFPOW2);	// 関数器 2のべき乗
SFR_16BIT(NPXFSIN);		// 関数器 サイン
SFR_16BIT(NPXFASIN);	// 関数器 アークサイン





/************************************************************
* Interrupt Vectors (offset from 0xFFE0)
************************************************************/

#define VECTOR_NAME(name)		name##_ptr
#define EMIT_PRAGMA(x)			_Pragma(#x)
#define CREATE_VECTOR(name)		void (* const VECTOR_NAME(name))(void) = &name
#define PLACE_VECTOR(vector,section)	EMIT_PRAGMA(DATA_SECTION(vector,section))
#define ISR_VECTOR(func,offset)	CREATE_VECTOR(func); \
								PLACE_VECTOR(VECTOR_NAME(func), offset)

#ifdef __ASM_HEADER__
#define UART_VECTOR				".int00"					/* 0xFFF0 UART Interrupt */
#define PERIOD_VECTOR			".int13"					/* 0xFFFA Periodic Interrupt */
#define RESET_VECTOR			".reset"					/* 0xFFFE Reset [Highest Priority] */
#else
#define UART_VECTOR				(0 * 1u)					/* 0xFFF0 UART */
#define PERIOD_VECTOR			(13 * 1u)					/* 0xFFFA Periodic Interrupt */
#define RESET_VECTOR			(15 * 1u)					/* 0xFFFE Reset [Highest Priority] */
#endif



/************************************************************
* End of Modules
************************************************************/

#ifdef __cplusplus
}
#endif /* extern "C" */

#endif /* #ifndef __OMSP */

