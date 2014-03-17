// USBの制御

#include "usb.h"
#include "../debug.h"

#include <string.h>

#include "usb_desc.cpp"





/*
	使用するエンドポイント
	EP0	-> コントロール転送
	EP1	-> HIDインタラプトOUT(ホスト→デバイス)
	EP2	-> HIDインタラプトIN(ホスト←デバイス)
*/



// ステートマシン
typedef enum{
	US_DETACHED = 0,	// はずされている
	US_DEFAULT,			// リセット済み
	US_ADDRESS,			// アドレス付与済み
	US_CONFIGURED		// コンフィグレーション済み
} USB_STATE_e;
volatile USB_STATE_e USB_State = US_DETACHED;
volatile bool USB_Suspended = false;

// 転送の状態
typedef enum{
	UTR_IDLE = 0,	// SETUPパケット・転送待ち
	UTR_STALL,		// ストール中
	UTR_WRITE,		// ホストからデバイスへの転送
	UTR_READ		// デバイスからホストへの転送
} UTR_STATE_e;

// EP0の情報
volatile struct EP0_id{
	UTR_STATE_e state;
	char buf[EP0_BUFSIZE];
	int offset;
	int size;
	bool zlp;
} EP0;







/*** USB一般 ***/

// USBを初期化
void USB_Init(void){
	USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK;
	USBB.udcon	= AVR32_USBB_UDCON_DETACH_MASK;	// プルアップ抵抗を切り離し
	
	USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK | AVR32_USBB_USBCON_OTGPADE_MASK
				| AVR32_USBB_USBCON_USBE_MASK;
	
	USBB.udinteclr = 0xFFFFFFFF;
	Int_Register(IRQ_USBB, (void*)USB_OnUSB, IL_HIGH);
	
	USBB.udinteset	= AVR32_USBB_UDINTESET_SUSPES_MASK | AVR32_USBB_UDINTESET_EORSTES_MASK;
	USBB.udcon		= 0;	// プルアップ抵抗を接続
	
	USBB.udintclr = AVR32_USBB_UDINTCLR_SUSPC_MASK;
}

// USB割り込み
IH USB_OnUSB(){
	int irq = USBB.udint;
	
	if (USB_Suspended == false){
		// ウェークアップ中
		
		if (irq & AVR32_USBB_UDINT_EP0INT_MASK){
			// エンドポイント0
			USB_OnEP0();
		}else if (irq & AVR32_USBB_UDINT_EP1INT_MASK){
			// エンドポイント1
			USB_OnEP1();
		} else if (irq & AVR32_USBB_UDINT_EP2INT_MASK){
			// エンドポイント2
			USB_OnEP2();
		} else if (irq & AVR32_USBB_UDINT_SUSP_MASK){
			// サスペンド
			USBB.UDINTCLR.suspc = 1;
			USBB.UDINTESET.wakeupes = 1;
		
			USB_Suspended = true;
		
			PutLine("Suspend");
		}
	}else{
		// サスペンド中
		
		if (irq & AVR32_USBB_UDINT_WAKEUP_MASK){
			// ウェークアップ
			USBB.UDINTCLR.wakeupc = 1;
			USBB.UDINTECLR.wakeupec = 1;
		
			USB_Suspended = false;
		
			PutLine("Wakeup");
		}
	}
	
	if (irq & AVR32_USBB_UDINT_EORST_MASK){
		USB_OnReset();
	}
}

// USBリセット
void USB_OnReset(void){
	// リセット
	USBB.UDINTCLR.eorstc = 1;
		
	USB_State = US_DEFAULT;
	
	// エンドポイントの初期化
	USBB.uerst	= AVR32_USBB_UERST_EPRST0_MASK | AVR32_USBB_UERST_EPRST1_MASK | AVR32_USBB_UERST_EPRST2_MASK;
	USBB.uerst	= AVR32_USBB_UERST_EPEN0_MASK | AVR32_USBB_UERST_EPEN1_MASK | AVR32_USBB_UERST_EPEN2_MASK;
		
	USBB.uecfg0	= (AVR32_USBB_UECFG0_EPTYPE_CONTROL << AVR32_USBB_UECFG0_EPTYPE)
				| AVR32_USBB_UECFG0_EPDIR_MASK
		        | (AVR32_USBB_UECFG0_EPSIZE_64 << AVR32_USBB_UECFG0_EPSIZE)
				| AVR32_USBB_UECFG0_ALLOC_MASK;
	USBB.uecon0set	= AVR32_USBB_UECON0_RXSTPE_MASK
					| AVR32_USBB_UECON0_STALLEDE_MASK;
	
	USBB.uecfg1 = (AVR32_USBB_UECFG1_EPTYPE_BULK << AVR32_USBB_UECFG1_EPTYPE)
		        | (AVR32_USBB_UECFG1_EPSIZE_64 << AVR32_USBB_UECFG1_EPSIZE) | (AVR32_USBB_UECFG1_EPBK_DOUBLE << AVR32_USBB_UECFG1_EPBK)
				| AVR32_USBB_UECFG1_ALLOC_MASK;
	USBB.uecon1set = AVR32_USBB_UECON1_RXOUTE_MASK;
	
	USBB.uecfg2 = (AVR32_USBB_UECFG2_EPTYPE_BULK << AVR32_USBB_UECFG2_EPTYPE)
				| AVR32_USBB_UECFG2_EPDIR_MASK
		        | (AVR32_USBB_UECFG2_EPSIZE_64 << AVR32_USBB_UECFG2_EPSIZE) | (AVR32_USBB_UECFG2_EPBK_DOUBLE << AVR32_USBB_UECFG2_EPBK)
				| AVR32_USBB_UECFG2_ALLOC_MASK;
	
	USBB.udinteset	= AVR32_USBB_UDINTESET_EP0INTES_MASK | AVR32_USBB_UDINTESET_EP1INTES_MASK | AVR32_USBB_UDINTESET_EP2INTES_MASK;
	EP0.state = UTR_IDLE;
		
	PutLine("Reset");
}



// FIFOから読み込み
void USB_ReadFIFO(int ep, void *buf_, int size){
	char *FIFO = (char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * ep);
	char *buf = (char*)buf_;
	while(0 < size){
		*buf++ = *FIFO++;
		size--;
	}
}

// FIFOに書き込み
void USB_WriteFIFO(int ep, const void *buf_, int size){
	char *FIFO = (char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * ep);
	const char *buf = (const char*)buf_;
	while(0 < size){
		*FIFO++ = *buf++;
		size--;
	}
}



/*** エンドポイント0 ***/

// エンドポイント0の割り込み
void USB_OnEP0(void){
	int status = USBB.uesta0;
	int mask = USBB.uecon0;
	
	if (status & AVR32_USBB_UESTA0_RXSTPI_MASK){
		// SETUP
		EP0_Reply_e reply = EP0_REPLY_STALL;
		
		USB_DeviceRequest_t req;
		USB_ReadFIFO(0, &req, 8);
		AckRXSTPI(0);
		
		req.wValue = SWAP16(req.wValue);
		req.wIndex = SWAP16(req.wIndex);
		req.wLength = SWAP16(req.wLength);
		
		PutString("SETUP[");
		PutHexBYTE(req.bmRequestType); PutByte(' ');
		PutHexBYTE(req.bRequest); PutByte(' ');
		PutHexWORD(req.wValue); PutByte(' ');
		PutDecimal(req.wIndex); PutByte(' ');
		PutDecimal(req.wLength);
		PutString("] ");
		
		int type = req.bmRequestType & 0x60;
		int target = req.bmRequestType & 0x1F;
		switch(type){
		case USB_DRQ_TYPE_BASIC:
			// 標準リクエスト
			switch(target){
			case USB_DRQ_TARGET_DEVICE:
				// デバイス
				switch(req.bRequest){
				case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
					reply = EP0_REPLY_NO_DATA;
					break;
					
				case USB_DRQ_RQ_SET_ADDRESS:		// Set Address
					EP0_SetAddress(req.wValue);
					reply = EP0_REPLY_NO_DATA;
					break;
					
				case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
					reply = EP0_ReplyBasicDescriptor(req.wValue, req.wLength);
					break;
					
				case USB_DRQ_RQ_SET_CONFIGURATION:	// Set Configration
					EP0_SetConfiguration(req.wValue);
					reply = EP0_REPLY_NO_DATA;
					break;
				}
				break;
				
			case USB_DRQ_TARGET_INTERFACE:
				// インターフェース
				switch(req.bRequest){
				case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
					reply = EP0_ReplyHIDDescriptor(req.wValue, req.wLength);
					break;
				}
				break;
				
			case USB_DRQ_TARGET_ENDPOINT:
				// エンドポイント
				switch(req.bRequest){
				case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
					{
						int ep = req.wIndex & 0xF;
						if ((0 <= ep) && (ep <= 7))
							// 次のデータパケットをDATA0にする
							*(&USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_RSTDTS_MASK;
					}					
					reply = EP0_REPLY_NO_DATA;
					break;
				}
				break;
			}
			break;
			
		case USB_DRQ_TYPE_CLASS:
			// クラスリクエスト
			
			break;
		}
			
		// 返事をする
		switch(reply){
		case EP0_REPLY_TRANSMIT:
			EP0_UpdateFIFO();
			break;
			
		case EP0_REPLY_NO_DATA:
			EP0_ReturnZeroLengthData();
			EnableTXINI(0);
			EP0.state = UTR_WRITE;
			break;
			
		//case EP0_REPLY_STALL:
		default:
			EP0_SetSTALL();
			PutString("Stall ");
			break;
		}
		PutReturn();
		return;
	}
	if ((mask & AVR32_USBB_UECON0_NAKOUTE_MASK) && (status & AVR32_USBB_UESTA0_NAKOUTI_MASK)){
		// OUTパケットがNAKされた (IN転送のSTATUS)
		AckNAKOUTI(0);
		if (EP0.state == UTR_READ){
			DisableNAKOUTI(0);
			EP0_DestroyBuffer();
			status = USBB.uesta0;
		}
	}
	if ((mask & AVR32_USBB_UECON0_TXINE_MASK) && (status & AVR32_USBB_UESTA0_TXINI_MASK)){
		// INパケット (デバイスからホスト)
		if (EP0.state == UTR_READ){
			bool result = EP0_UpdateFIFO();
			if (result == false){
				DisableTXINI(0);
			}
		}
		if (EP0.state == UTR_WRITE){
			EP0_SetIDLE();
			
			if (USB_State == US_DEFAULT){
				int address = (USBB.udcon & AVR32_USBB_UDCON_UADD_MASK) >> AVR32_USBB_UDCON_UADD;
				if (address != 0){
					USBB.udcon |= AVR32_USBB_UDCON_ADDEN_MASK;
					USB_State = US_ADDRESS;
				}
			}
		}
	}
	if ((mask & AVR32_USBB_UECON0_RXOUTE_MASK) && (status & AVR32_USBB_UESTA0_RXOUTI_MASK)){
		// OUTパケット (ホストからデバイス)
		if (EP0.state == UTR_WRITE){
			AckRXOUTI(0);
		}
		if (EP0.state == UTR_READ){
			AckRXOUTI(0);
			EP0_SetIDLE();
		}
	}
	if (status & AVR32_USBB_UESTA0_STALLEDI_MASK){
		// STALLした
		AckSTALLEDI(0);
		EP0_SetIDLE();
	}
	
}

// EP0のバッファに書き込み
void EP0_WriteBuffer(const char *buf, int size, int reqsize){
	volatile char *dst = EP0.buf;
	if (EP0_BUFSIZE < reqsize) reqsize = EP0_BUFSIZE;
	if (EP0_BUFSIZE < size) size = EP0_BUFSIZE;
	
	EP0.zlp = false;
	if (size < reqsize){
		if ((size % EP0_FIFOSIZE) == 0) EP0.zlp = true;
	}else{
		size = reqsize;
	}		
	EP0.size = size;
	
	memcpy((void*)dst, buf, size);
	/*while(0 < size--){		// Copy data
		*dst++ = *buf++;
	}*/
	
	EP0.offset = 0;
	EP0.state = UTR_READ;
	
	EnableTXINI(0);
	EnableRXOUTI(0);
	EnableNAKOUTI(0);
	
	AckNAKOUTI(0);
	AckRXOUTI(0);
}

// EP0の転送を中止
void EP0_DestroyBuffer(void){
	EP0.size = 0;
	EP0.zlp = false;
}
	
// EP0のFIFOを更新
bool EP0_UpdateFIFO(void){
	int size = EP0.size;
	if (size <= 0){
		if (EP0.zlp == true){
			EP0.zlp = false;
			EP0_ReturnZeroLengthData();
		}
		return false;
	}
	if (EP0_FIFOSIZE < size) size = EP0_FIFOSIZE;
	USB_WriteFIFO(0, (void*)(EP0.buf + EP0.offset), size);
	EP0.offset += size;
	EP0.size -= size;
	
	AckTXINI(0);	// Reply IN
	
	if ((EP0.size == 0) && (EP0.zlp == false))
		return false;
	else
		return true;
}

// ゼロレングスパケット(ZLP)を返す
void EP0_ReturnZeroLengthData(void){
	AckTXINI(0);	// Reply IN
}

// STALLを返す
void EP0_SetSTALL(void){
	EP0.state = UTR_STALL;
	DisableRXOUTI(0);
	DisableTXINI(0);
	DisableNAKINI(0);
	DisableNAKOUTI(0);
	ReturnSTALL(0);
}

// アイドルステートに遷移 
void EP0_SetIDLE(void){
	EP0.state = UTR_IDLE;
	DisableRXOUTI(0);
	DisableTXINI(0);
	DisableNAKINI(0);
	DisableNAKOUTI(0);
}



/*** エンドポイント0 リクエスト ***/

// ベーシックディスクリプタを返す
EP0_Reply_e EP0_ReplyBasicDescriptor(int wValue, int wLength){
	int type = (wValue >> 8) & 0xFF;
	int index = wValue & 0xFF;
	switch(type){
	case USB_DESC_DEVICE:
		// デバイスディスクリプタを返す
		PutString("GetDeviceDesc() ");
		EP0_WriteBuffer((char*)&DeviceDescriptor, sizeof(DeviceDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_CONFIGURATION:
		// コンフィグレーションディスクリプタ他を返す
		PutFormat("GetConfDesc(%d) ", index);
		EP0_WriteBuffer((char*)&ConfigurationDescriptor, sizeof(ConfigurationDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_STRING:
		// ストリングディスクリプタを返す
		PutFormat("GetStringDesc(%d) ", index);
		{
			const char *buf;
			if (index == 0)			buf = StringDescriptor0;	// LANGID
			else if (index == 1)	buf = StringDescriptor1;	// Manufacturer
			else if (index == 2)	buf = StringDescriptor2;	// Product
			else if (index == 3){	// シリアル番号
				// シリアル番号はAVR32の各チップが持つ固有の番号を返す
				short sn[31];
				sn[0] = (sizeof(sn) << 8) | 0x03;
				for(int cnt = 0; cnt < 15; cnt++){
					char hex = ((volatile char*)0x80800204)[cnt];	// ユニークIDの格納場所
					char c;
					c = ((hex >> 4) & 0xF) + '0';	// 上位ニブル
					if ('9' < c) c += ('A' - '9' - 1);
					sn[1 + cnt * 2] = c << 8;
					c = (hex & 0xF) + '0';			// 下位ニブル
					if ('9' < c) c += ('A' - '9' - 1);
					sn[1 + cnt * 2 + 1] = c << 8;
				}
				EP0_WriteBuffer((char*)sn, sizeof(sn), wLength);
				return EP0_REPLY_TRANSMIT;
			}else{
				break;
			}				
			EP0_WriteBuffer(buf, buf[0], wLength);
		}
		return EP0_REPLY_TRANSMIT;
	}
	return EP0_REPLY_STALL;	// 要求されたデスクリプタを持っていないのでストールを返す
}

// アドレスをセット
void EP0_SetAddress(int wValue){
	int address = wValue & 0x7F;
	USBB.udcon = (USBB.udcon & ~AVR32_USBB_UDCON_UADD_MASK) | (address << AVR32_USBB_UDCON_UADD);
	PutFormat("SetAddress(%d) ", address);
}

// コンフィグレーションをセット
void EP0_SetConfiguration(int wValue){
	PutFormat("SetConf(%d) ", wValue);
	if (wValue == 1)
		USB_State = US_CONFIGURED;
	else
		USB_State = US_ADDRESS;
}

// HIDクラスのディスクリプタを返す
EP0_Reply_e EP0_ReplyHIDDescriptor(int wValue, int wLength){
	int type = (wValue >> 8) & 0xFF;
	int index = wValue & 0xFF;
	switch(type){
	case USB_DESC_HID:
		PutString("GetHIDDesc() ");
		EP0_WriteBuffer((char*)&ConfigurationDescriptor.HIDClass, sizeof(ConfigurationDescriptor.HIDClass), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_HID_REPORT:
		PutFormat("GetHIDReportDesc(%d) ", index);
		EP0_WriteBuffer(HIDReportDescriptor, sizeof(HIDReportDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
	}
	return EP0_REPLY_STALL;	// 要求されたデスクリプタを持っていないのでストールを返す
}





/*** エンドポイント1/2 ***/

// エンドポイント1(HIDインタラプトOUT)の割り込み
void USB_OnEP1(void){
	int status = USBB.uesta1 & USBB.uecon1;
	
	if (status & AVR32_USBB_UESTA1_RXOUTI_MASK){
		// OUTパケット (ホストからデバイス)
		
		AckRXOUTI(1);
		
		int byte = USBB.UESTA1.byct;
		char data[64];
		USB_ReadFIFO(1, data, byte);
		
		PutString("OUT[");
		PutDump(data, byte);
		PutLine("]");
		
		ClearFIFOCON(1);
		
		
	}
	
}

// エンドポイント2(HIDインタラプトIN)の割り込み
void USB_OnEP2(void){
	int status = USBB.uesta2 & USBB.uecon2;
	
	if (status & AVR32_USBB_UESTA2_TXINI_MASK){
		// INパケット (デバイスからホスト)
		
		DisableTXINI(2);
		
	}
	
}



