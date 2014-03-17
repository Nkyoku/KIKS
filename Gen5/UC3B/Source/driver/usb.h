/**	@file
	@brief USBの制御
*/

#ifndef USB_H_
#define USB_H_

#include "../define.h"
#include "int.h"
#include "usb_struct.h"



#define IO_USBB		AVR32_USBB



namespace USB{
	/*** 短縮 ***/
	inline void EnableUSB(void)		{IO_USBB.USBCON.usbe = 1;}
	inline void DisableUSB(void)	{IO_USBB.USBCON.usbe = 0;}
	inline void AttachUSB(void)		{IO_USBB.UDCON.detach = 0;}
	inline void DetachUSB(void)		{IO_USBB.UDCON.detach = 1;}
	
	inline void EnableRXOUTI(int ep)	{*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_RXOUTES_MASK;}
	inline void DisableRXOUTI(int ep)	{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_RXOUTEC_MASK;}
	inline void EnableTXINI(int ep)		{*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_TXINES_MASK;}
	inline void DisableTXINI(int ep)	{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_TXINEC_MASK;}
	inline void EnableNAKINI(int ep)	{*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_NAKINES_MASK;}
	inline void DisableNAKINI(int ep)	{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_NAKINEC_MASK;}
	inline void EnableNAKOUTI(int ep)	{*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_NAKOUTES_MASK;}
	inline void DisableNAKOUTI(int ep)	{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_NAKOUTEC_MASK;}
	
	inline void ReturnSTALL(int ep)		{*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_STALLRQS_MASK;}
	inline void ClearSTALL(int ep)		{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_STALLRQC_MASK;}
	
	inline void AckRXSTPI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_RXSTPIC_MASK;}
	inline void AckNAKINI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_NAKINIC_MASK;}
	inline void AckTXINI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_TXINIC_MASK;}
	inline void AckNAKOUTI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_NAKOUTIC_MASK;}
	inline void AckRXOUTI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_RXOUTIC_MASK;}
	inline void AckSTALLEDI(int ep)		{*(&IO_USBB.uesta0clr + ep) = AVR32_USBB_UESTA0CLR_STALLEDIC_MASK;}
	
	inline void ClearFIFOCON(int ep)	{*(&IO_USBB.uecon0clr + ep) = AVR32_USBB_UECON0CLR_FIFOCONC_MASK;}
	
	//inline char* GetUSBFIFO(int ep)		{return (char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * ep);}
	
	// ↑よりマクロ化したほうが最適化がかかりやすい
	/*#define EnableUSB()			IO_USBB.USBCON.usbe = 1
	#define DisableUSB()		IO_USBB.USBCON.usbe = 0
	
	#define AttachUSB()			IO_USBB.UDCON.detach = 0
	#define DetachUSB()			IO_USBB.UDCON.detach = 1
	
	#define EnableRXOUTI(ep)	IO_USBB.uecon##ep##set = AVR32_USBB_UECON0SET_RXOUTES_MASK
	#define DisableRXOUTI(ep)	IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_RXOUTEC_MASK
	#define EnableTXINI(ep)		IO_USBB.uecon##ep##set = AVR32_USBB_UECON0SET_TXINES_MASK
	#define DisableTXINI(ep)	IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_TXINEC_MASK
	#define EnableNAKINI(ep)	IO_USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKINES_MASK
	#define DisableNAKINI(ep)	IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKINEC_MASK
	#define EnableNAKOUTI(ep)	IO_USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKOUTES_MASK
	#define DisableNAKOUTI(ep)	IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKOUTEC_MASK
	
	#define ReturnSTALL(ep)		IO_USBB.uecon##ep##set = AVR32_USBB_UECON0SET_STALLRQS_MASK
	#define ClearSTALL(ep)		IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_STALLRQC_MASK
	
	#define AckRXSTPI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXSTPIC_MASK;
	#define AckNAKINI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKINIC_MASK;
	#define AckTXINI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_TXINIC_MASK;
	#define AckNAKOUTI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKOUTIC_MASK;
	#define AckRXOUTI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXOUTIC_MASK;
	#define AckSTALLEDI(ep)		IO_USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_STALLEDIC_MASK;
	
	#define ClearFIFOCON(ep)	IO_USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_FIFOCONC_MASK;*/
	
	#define GetUSBFIFO(ep)		((char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * (ep)))
	
	
	
	
	/*** USB一般 ***/
	
	// USBを初期化
	void Init(void);
	
	// USBが接続されているか
	bool IsConnected(void);
	
	// USBリセット
	//void OnReset(void);
	
	// USB割り込み
	IH OnUSBB();
	
	
	
	/*** エンドポイント0 ***/
	
	// エンドポイント0の割り込み
	void OnEP0(void);
	
	// EP0のバッファに書き込み
	void EP0_WriteBuffer(const char *buf, int size, int reqsize);
	void EP0_WriteBuffer(int size, int reqsize);
	void* EP0_GetBuffer(void);
	
	// EP0のFIFOを更新
	bool EP0_UpdateFIFO(void);
	
	// ゼロレングスパケット(ZLP)を返す
	void EP0_ReturnZeroLengthPacket(void);
	
	// STALLを返す
	void EP0_SetSTALL(void);
	
	
	
	/*** エンドポイント0 リクエスト ***/
	
	// グローバルコマンドを取得
	extern volatile int GlobalCommand;
	inline int GetGlobalCommand(void){
		return GlobalCommand;
	}	
	
	/*** デバッグインターフェース ***/
	namespace Debug{
		// エンドポイント1の割り込み
		void OnEP1(void);
	
		// エンドポイント2の割り込み
		void OnEP2(void);
	
		// 書き込み
		void Write(char c);
	
		// 読み込みを始める
		int BeginRead(const char **s);
	
		// 読み込みを終える
		void EndRead(void);
	}
	
	/*** 大容量データ転送 ***/
	namespace Data{
		// エンドポイント3の割り込み
		void OnEP3(void);
	
		// エンドポイント4の割り込み
		void OnEP4(void);
		
		// 送信する用意があることをUSBBに通知
		inline void TxReady(void){
			EnableTXINI(3);
		}
		
		// 受信する用意があることをUSBBに通知
		inline void RxReady(void){
			EnableRXOUTI(4);
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}

	
#endif
