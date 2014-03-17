// USBの制御

#ifndef USB_H_
#define USB_H_

#include "../../define.h"
#include "../int.h"
#include "usb_struct.h"



/*** デバイス情報 ***/
#define USB_VERSION_BCD			0x0200
#define USB_HID_BCD				0x0101
#define USB_VENDOR_ID			0x9393
#define USB_PRODUCT_ID			0x0072
#define USB_RELEASE_BCD			0x0101	// 0x0100=ブートローダー, 0x0101=アプリケーション

#define USB_LANGID_ENGLISH		0x409



// FIFO・バッファ
#define EP0_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x00000))
#define EP1_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000))
#define EP2_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x20000))

#define EP0_FIFOSIZE	64
#define EP0_BUFSIZE		512



/*** USB一般 ***/

// USBを初期化
void USB_Init(void);

// USB割り込み
IH USB_OnUSB();

// USBリセット
void USB_OnReset(void);


// FIFOから読み込み
void USB_ReadFIFO(int ep, void *buf, int size);

// FIFOに書き込み
void USB_WriteFIFO(int ep, const void *buf, int size);



/*** エンドポイント0 ***/

typedef enum{
	EP0_REPLY_NO_DATA,	// データなし
	EP0_REPLY_RECEIVE,	// ホストからデータを受信する
	EP0_REPLY_TRANSMIT,	// ホストへデータを送信する
	EP0_REPLY_STALL		// 未対応のリクエスト
} EP0_Reply_e;

// エンドポイント0の割り込み
void USB_OnEP0(void);

// EP0のバッファに書き込み
void EP0_WriteBuffer(const char *buf, int size, int reqsize);

// EP0の転送を中止
void EP0_DestroyBuffer(void);

// EP0のFIFOを更新
bool EP0_UpdateFIFO(void);

// ゼロレングスパケット(ZLP)を返す
void EP0_ReturnZeroLengthData(void);

// STALLを返す
void EP0_SetSTALL(void);

// アイドルステートに遷移 
void EP0_SetIDLE(void);



/*** エンドポイント0 リクエスト ***/

// ベーシックディスクリプタを返す
EP0_Reply_e EP0_ReplyBasicDescriptor(int wValue, int wLength);

// アドレスをセット
void EP0_SetAddress(int wValue);

// コンフィグレーションをセット
void EP0_SetConfiguration(int wValue);

// HIDクラスのディスクリプタを返す
EP0_Reply_e EP0_ReplyHIDDescriptor(int wValue, int wLength);



/*** エンドポイント1/2 ***/

// エンドポイント1の割り込み
void USB_OnEP1(void);

// エンドポイント2の割り込み
void USB_OnEP2(void);






#define EnableUSB()			USBB.USBCON.usbe = 1
#define DisableUSB()		USBB.USBCON.usbe = 0

#define EnableRXOUTI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_RXOUTES_MASK
#define DisableRXOUTI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_RXOUTEC_MASK
#define EnableTXINI(ep)		USBB.uecon##ep##set = AVR32_USBB_UECON0SET_TXINES_MASK
#define DisableTXINI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_TXINEC_MASK
#define EnableNAKINI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKINES_MASK
#define DisableNAKINI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKINEC_MASK
#define EnableNAKOUTI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKOUTES_MASK
#define DisableNAKOUTI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKOUTEC_MASK

#define ReturnSTALL(ep)		USBB.uecon##ep##set = AVR32_USBB_UECON0SET_STALLRQS_MASK
#define ClearSTALL(ep)		USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_STALLRQC_MASK

#define AckRXSTPI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXSTPIC_MASK;
#define AckNAKINI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKINIC_MASK;
#define AckTXINI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_TXINIC_MASK;
#define AckNAKOUTI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKOUTIC_MASK;
#define AckRXOUTI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXOUTIC_MASK;
#define AckSTALLEDI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_STALLEDIC_MASK;

#define ClearFIFOCON(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_FIFOCONC_MASK;



#endif
