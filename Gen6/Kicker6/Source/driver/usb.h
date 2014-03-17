/**	@file
	@brief USBの制御
*/

#ifndef USB_H_
#define USB_H_

#include "../define.h"
#include "usb_struct.h"



namespace USBC{
	
	static const unsigned short USB_EP0_PKTLENGTH	= 64;	// パケットの長さ
	static const unsigned short USB_EP0_FIFOLENGTH	= 256;	// FIFOの長さ
	
	
	
	
	// USBを有効化する
	void Enable(void);
	
	// USBを無効化する
	void Disable(void);
	
	// USBを接続する
	void Attach(void);
	
	// リンクがアクティブか？
	// SOFの周期より遅く呼ぶこと
	bool LinkAlive(void);
	
	// リセット
	void Reset(void);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// EP0 コントロールエンドポイント
	namespace EP0{
		// 初期化 アイドルステートへ移行
		void Init(void);
		
		
		
		
		
		
		// SETUPパケットの処理
		bool ReceivedSETUP(void);
		
		// NACKされたOUTパケットの処理
		void ReceivedNAKOUT(void);

		// OUTパケットの処理
		void ReceivedOUT(void);
		
		// NACKされたINパケットの処理
		void ReceivedNAKIN(void);
		
		// INパケットの処理
		void ReceivedIN(void);
		
		// リクエストが終了した
		void EndOfRequest(void);
		
		
		// ストールを返す
		void SetStall(void);
		
		// IN転送のバッファへ書き込み
		void WriteInBuffer(const void *buf, unsigned short size, char flags = 0);
		//void WriteInBuffer(const void *buf, unsigned short size, bool flash = false);
		
		// OUT転送のSTATUSを返す用意をする
		void SetupOutStatus(void);
		
		// IN転送のSTATUSを受け取る用意をする
		void SetupInStatus(void);
		
		
		// IN転送のDATAを返す用意をする
		bool SetupInData(void);
		
		// OUT転送のDATAを受け取る用意をする
		bool SetupOutData(void);
		
		

		
	}









	

	/*#define USB_SetSTALL(ep_ctrl)		ep_ctrl.CTRL |= USB_EP_STALL_bm;
	#define USB_ResetSTALL(ep_ctrl)		ep_ctrl.CTRL &= ~USB_EP_STALL_bm;

	#define USB_ClearOVF(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_OVF_bm;
	#define USB_ClearUNF(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_UNF_bm;
	#define USB_ClearSTALLED(ep_ctrl)	ep_ctrl.STATUS &= ~USB_EP_STALLF_bm;
	#define USB_ClearTRNCOMPL(ep_ctrl)	ep_ctrl.STATUS &= ~USB_EP_TRNCOMPL0_bm;
	#define USB_ClearSETUP(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_SETUP_bm;
	#define USB_SetNACK(ep_ctrl)		ep_ctrl.STATUS |= USB_EP_BUSNACK0_bm;
	#define USB_ClearNACK(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_BUSNACK0_bm;*/





}




// Load and Clear
#define lac(addr, msk) \
   __asm__ __volatile__ ( \
         "ldi r24, %1" "\n\t" \
		 "lac Z, r24" "\n\t" \
         ::"z" (addr), "M" (msk):"r24")
// Load and Set
#define las(addr, msk) \
   __asm__ __volatile__ ( \
         "ldi r24, %1" "\n\t" \
		 "las Z, r24" "\n\t" \
         ::"z" (addr), "M" (msk):"r24")//


	
#endif
