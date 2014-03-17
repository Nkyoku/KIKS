/**	@file
	@brief USBの制御
*/

#include "usb.h"
#include "usb_desc.h"
#include "gpio.h"
#include "../usbif.h"

#include <stddef.h>
#include <string.h>
#include <avr/pgmspace.h>



//#ifdef _DFU_
#define USB_OUTPUT_DEBUG_STRING 0
/*#else
#define USB_OUTPUT_DEBUG_STRING 1
#endif*/

#if USB_OUTPUT_DEBUG_STRING
#include "../misc/xprintf.h"
#endif










/*
	EP0Data	-> コントロール転送
*/

namespace USBC{
	
	/* 定数 */
	
	//static const unsigned short NUM_OF_ENDPOINTS	= 0;	// エンドポイントの数(EP0Dataは含めない)

	
	
	// エンドポイントの設定レジスタ
	struct USB_SRAM_t{
		unsigned long FIFO;
		USB_EP_t OUT;
		USB_EP_t IN;
		unsigned short FrameNumber;
	};
	
	// EP0Dataの情報
	enum EP0S_STATE_e{
		EP0S_IDLE = 0,		// SETUPパケット・転送待ち
		EP0S_STALL,			// ストール中
		EP0S_OUT_DATA,		// ホストからデバイスへの転送
		EP0S_OUT_STATUS,	// ホストからデバイスへの転送のステータス
		EP0S_IN_DATA,		// デバイスからホストへの転送
		EP0S_IN_STATUS,		// デバイスからホストへの転送のステータス
	};
	
	// SETUPパケットの扱い
	enum EP0_REPLY_e{
		EP0_REPLY_NO_DATA,	// データなし
		EP0_REPLY_RECEIVE,	// ホストからデータを受信する
		EP0_REPLY_TRANSMIT,	// ホストへデータを送信する
		EP0_REPLY_STALL		// 未対応のリクエスト
	};
	
	// EP0 IN転送の構造体
	struct EP0IN_t{
		char PktBuffer[USB_EP0_PKTLENGTH];
		char FIFO[USB_EP0_FIFOLENGTH];
		unsigned short Size;
		unsigned short Next;
		bool ZLP;
	};
	
	// EP0 OUT転送の構造体
	struct EP0OUT_t{
		char PktBuffer[USB_EP0_PKTLENGTH];
		char FIFO[USB_EP0_FIFOLENGTH];
		unsigned short Size;
	};
	
	
	
	/* 変数 */
	
	EP0S_STATE_e EP0State;			// 転送のステートマシン
	volatile EP0IN_t EP0In;			// IN転送のバッファ
	volatile EP0OUT_t EP0Out;		// OUT転送のバッファ
	USB_DeviceRequest_t EP0Setup;	// SETUPパケットの内容
	
	// ステート
	volatile unsigned char m_Address;	// Set Address受信からステータスの送信の間、アドレスを保持する
	unsigned short m_FrameNumber;	// 前回LinkAliveが呼ばれたときのフレーム番号
	
	volatile ALIGN4 USB_SRAM_t USB_SRAM;
	
	
	
	
	


	/*** USB一般 ***/
	
	// USBを有効化する
	void Enable(void){
		// USBのキャリブレーション値を読み込む
		char usb_cal;
		NVM.CMD = NVM_CMD_READ_CALIB_ROW_gc;
		usb_cal = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL0));
		if (usb_cal != 0xFF) USB.CAL0 = usb_cal; else USB.CAL0 = 0x1F;
		usb_cal = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBCAL1));
		if (usb_cal != 0xFF) USB.CAL1 = usb_cal; else USB.CAL1 = 0x1F;
		NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		
		// エンドポイントレジスタを初期化
		USB_SRAM.OUT.CTRL = 0;
		USB_SRAM.IN.CTRL = 0;
		
		// レジスタ設定
		USB.ADDR = 0;
		USB.EPPTR = (unsigned short)&USB_SRAM.OUT;
		USB.CTRLA = USB_ENABLE_bm | USB_SPEED_bm | USB_FIFOEN_bm | USB_STFRNUM_bm;
		USB.CTRLB = 0;
		
		USB.FIFORP = 0xFF;
		
		USB.INTCTRLA = USB_INTLVL_LO_gc;
		USB.INTCTRLB = 0;
		
		LinkAlive();
	}
	
	// USBを無効化する
	void Disable(void){
		cli();
		//CriticalSection{
			USB.CTRLB &= ~USB_ATTACH_bm;
			USB.CTRLA = 0;
			USB.CTRLB = 0;
			USB.INTCTRLA = 0;
			USB.INTCTRLB = 0;
		//}
		sei();
	}
	
	// USBを接続する
	void Attach(void){
		cli();
		//CriticalSection{
			USB.INTFLAGSACLR = USB_SUSPENDIF_bm | USB_RESUMEIF_bm;
			USB.CTRLB |= USB_ATTACH_bm;
			USB.INTCTRLA |= USB_BUSEVIE_bm/* | USB_SOFIE_bm*/;
			USB.INTCTRLB = USB_TRNIE_bm | USB_SETUPIE_bm;
		//}
		sei();
	}
	
	// リンクがアクティブか？
	bool LinkAlive(void){
		bool result;
		unsigned short num = USB_SRAM.FrameNumber;
		result = num != m_FrameNumber;
		m_FrameNumber = num;
		return result;
	}
	
	// リセット
	void Reset(void){
		// アドレスをリセット
		USB.ADDR = 0;
		
		// エンドポイントをリセット
		USB_SRAM.OUT.CTRL		= 0;
		USB_SRAM.OUT.STATUS		= USB_EP_BUSNACK1_bm | USB_EP_BUSNACK0_bm;
		USB_SRAM.OUT.CTRL		= USB_EP_TYPE_CONTROL_gc | USB_EP_BUFSIZE_64_gc;
		USB_SRAM.IN.CTRL		= 0;
		USB_SRAM.IN.STATUS		= USB_EP_BUSNACK1_bm | USB_EP_BUSNACK0_bm;
		USB_SRAM.IN.CTRL		= USB_EP_TYPE_CONTROL_gc | USB_EP_BUFSIZE_64_gc;
		
		// OUTパケットのバッファを指定
		USB_SRAM.OUT.DATAPTR	= (unsigned short)EP0Out.PktBuffer;
		
		// EP0を初期化
		EP0::Init();
	}
	
	// バスイベント割り込み
	ISR(USB_BUSEVENT_vect){
		if (USB.INTFLAGSACLR & USB_SOFIF_bm){
			// Start Of Frame
			USB.INTFLAGSACLR = USB_SOFIF_bm;
			return;
		}
		
		if (USB.INTFLAGSACLR & USB_UNFIF_bm){
			// INパケットがNACKされた
			USB.INTFLAGSACLR = USB_UNFIF_bm;
			if (USB_SRAM.IN.STATUS & USB_EP_UNF_bm){
				lac(&USB_SRAM.IN.STATUS, USB_EP_UNF_bm);
				EP0::ReceivedNAKIN();
			}
			return;
		}
		if (USB.INTFLAGSACLR & USB_OVFIF_bm){
			// OUTパケットがNACKされた
			USB.INTFLAGSACLR = USB_OVFIF_bm;
			if (USB_SRAM.OUT.STATUS & USB_EP_OVF_bm){
				lac(&USB_SRAM.OUT.STATUS, USB_EP_OVF_bm);
				EP0::ReceivedNAKOUT();
			}
			return;
		}
		
		if (USB.INTFLAGSACLR & USB_RSTIF_bm){
			// リセット
			USB.INTFLAGSACLR = USB_RSTIF_bm;
			
			// 処理
			Reset();
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("RESET\n");
			#endif
			return;
		}
		
		if (USB.INTFLAGSACLR & USB_STALLIF_bm){
			// ストールした
			USB.INTFLAGSACLR = USB_STALLIF_bm;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("STALLIF\n");
			#endif
			
			return;
		}
		
		if (USB.INTFLAGSACLR & USB_SUSPENDIF_bm){
			// サスペンド
			USB.INTFLAGSACLR = USB_SUSPENDIF_bm;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("SUSPEND\n");
			#endif
			return;
		}
		if (USB.INTFLAGSACLR & USB_RESUMEIF_bm){
			// ウェークアップ
			USB.INTFLAGSACLR = USB_RESUMEIF_bm;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("WAKEUP\n");
			#endif
			return;
		}
		
		if (USB.INTFLAGSACLR & USB_CRCIF_bm){
			// CRCエラー(アイソクロナス転送)
			USB.INTFLAGSACLR = USB_CRCIF_bm;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("CRC Error\n");
			#endif
			return;
		}
	}

	// トランザクション割り込み
	ISR(USB_TRNCOMPL_vect){
		if (EP0::ReceivedSETUP() == true){
			// SETUPパケット
			return;
		}
		
		if (USB.INTFLAGSBCLR & USB_TRNIF_bm){
			// IN/OUTパケット
			USB.INTFLAGSBCLR = USB_TRNIF_bm;
			
			USB_FIFORP;
			if (USB_SRAM.OUT.STATUS & (USB_EP_TRNCOMPL0_bm | USB_EP_TRNCOMPL1_bm)){
				// EP0 OUTパケット
				lac(&USB_SRAM.OUT.STATUS, USB_EP_TRNCOMPL0_bm | USB_EP_TRNCOMPL1_bm);
				
				// パケットを処理
				EP0::ReceivedOUT();
			}else{
				// EP0 INパケット
				lac(&USB_SRAM.IN.STATUS, USB_EP_TRNCOMPL0_bm | USB_EP_TRNCOMPL1_bm);
				
				// パケットを処理
				EP0::ReceivedIN();
			}
			return;
		}
	}
	
	
	
	/*** エンドポイント0 ***/
	namespace EP0{
		
		// 初期化 アイドルステートへ移行
		void Init(void){
			USB.INTCTRLA &= ~USB_BUSERRIE_bm;	// OVF/UNF割り込みを禁止
			
			las(&USB_SRAM.IN.STATUS, USB_EP_BUSNACK1_bm | USB_EP_BUSNACK0_bm);
			USB_SRAM.IN.CNT = 0;
			lac(&USB_SRAM.IN.STATUS, USB_EP_UNF_bm | USB_EP_TRNCOMPL0_bm | USB_EP_TRNCOMPL1_bm);
			//lac(&USB_SRAM.IN.STATUS, USB_EP_UNF_bm);
			lac(&USB_SRAM.OUT.STATUS, USB_EP_OVF_bm | USB_EP_TRNCOMPL0_bm | USB_EP_TRNCOMPL1_bm);
			//lac(&USB_SRAM.OUT.STATUS, USB_EP_OVF_bm);
			
			EP0State = EP0S_IDLE;
		}
		
		// ベーシックディスクリプタを返す
		static EP0_REPLY_e ReplyBasicDescriptor(void);
		
		// HIDクラスのディスクリプタを返す
		//static EP0_REPLY_e ReplyHIDDescriptor(void);
		
		// SETUPパケットの処理
		bool ReceivedSETUP(void){
			// SETUPパケットか？
			if (~USB.INTFLAGSBCLR & USB_SETUPIF_bm){
				return false;
			}
			USB.INTFLAGSBCLR = USB_SETUPIF_bm;
			
			// ストールを解除
			lac(&USB_SRAM.OUT.STATUS, USB_EP_STALLF_bm);
			lac(&USB_SRAM.IN.STATUS, USB_EP_STALLF_bm);
			USB.INTFLAGSACLR = USB_STALLIF_bm;
			
			// フラグをクリア
			lac(&USB_SRAM.OUT.STATUS, USB_EP_SETUP_bm);
			
			// Idleステート以外のときにSETUP割り込みが来てしまったら
			switch(EP0State){
			case EP0S_IDLE:
				break;
			case EP0S_OUT_STATUS:
			case EP0S_IN_STATUS:
				EndOfRequest();
			default:
				Init();
			}
			
			if (USB_SRAM.OUT.CNT != 8){
				return true;	// エラー
			}
			memcpy(&EP0Setup, (const void*)EP0Out.PktBuffer, 8);
			
			// OVF/UNF割り込みを許可
			USB.INTCTRLA |= USB_BUSERRIE_bm;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("STP[%02X %02X %04X %04X %04X] ",
					EP0Setup.bmRequestType, EP0Setup.bRequest,
					EP0Setup.wValue, EP0Setup.wIndex, EP0Setup.wLength);
			#endif
			
			EP0_REPLY_e reply = EP0_REPLY_STALL;
			//unsigned char dir = EP0Setup.bmRequestType & USB_DRQ_DIR_DEVICE_TO_HOST;
			unsigned char type = EP0Setup.bmRequestType & 0x60;
			unsigned char target = EP0Setup.bmRequestType & 0x1F;
			
			switch(type){
			case USB_DRQ_TYPE_BASIC:
				// 標準リクエスト
				switch(target){
				case USB_DRQ_TARGET_DEVICE:
					// デバイス
					switch(EP0Setup.bRequest){
					case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
						reply = EP0_REPLY_NO_DATA;
						break;
					case USB_DRQ_RQ_SET_ADDRESS:		// Set Address
						m_Address = EP0Setup.wValue & 0x7F;
						#if USB_OUTPUT_DEBUG_STRING
							xprintf("SetAddress(%d) ", m_Address);
						#endif
						reply = EP0_REPLY_NO_DATA;
						break;
					case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
						reply = ReplyBasicDescriptor();
						break;
					case USB_DRQ_RQ_SET_CONFIGURATION:	// Set Configration
						#if USB_OUTPUT_DEBUG_STRING
							xprintf("SetConf(%d) ", EP0Setup.wValue);
						#endif
						reply = EP0_REPLY_NO_DATA;
						break;
					}
					break;
					
				/*case USB_DRQ_TARGET_INTERFACE:
					// インターフェース
					switch(EP0Setup.bRequest){
					case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
						reply = ReplyHIDDescriptor();
						break;
					}
					break;*/
				}
				break;
				
			case USB_DRQ_TYPE_CLASS:
				// クラスリクエスト
				switch(target){
				case USB_DRQ_TARGET_INTERFACE:
					// インターフェース
					switch(EP0Setup.bRequest){
					case USB_DRQ_RQ_HID_GET_REPORT:		// Get Report
						{
							unsigned char id = EP0Setup.wValue;
							unsigned short len = EP0Setup.wLength;
							if (USB_EP0_FIFOLENGTH < len) len = USB_EP0_FIFOLENGTH;
							if (USBIF::HIDGetReportRequest(id, len, (char*)EP0In.FIFO) == true){
								WriteInBuffer(NULL, len, -1);
								reply = EP0_REPLY_TRANSMIT;
							}
						}
						break;
					case USB_DRQ_RQ_HID_SET_REPORT:		// Set Report
						reply = EP0_REPLY_RECEIVE;
						break;
					}
					break;
				}
				break;
			}
			
			// 返答をする
			switch(reply){
			case EP0_REPLY_NO_DATA:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("NoData\n");
				#endif
				SetupOutStatus();	// ZLPを送信
				break;
				
			case EP0_REPLY_RECEIVE:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("Rx\n");
				#endif
				EP0Out.Size = 0;
				EP0State = EP0S_OUT_DATA;
				lac(&USB_SRAM.OUT.STATUS, USB_EP_BUSNACK0_bm);	// 受信を許可
				break;
				
			case EP0_REPLY_TRANSMIT:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("Tx\n");
				#endif
				SetupInData();	// 送信開始
				break;
				
			default:
				SetStall();		// ストール
				break;
			}
			
			return true;
		}
		
		// NACKされたOUTパケットの処理
		void ReceivedNAKOUT(void){
			if (USB.INTFLAGSBCLR & USB_TRNIF_bm) return;
			if (ReceivedSETUP() == true){
				// SETUPパケット
				return;
			}
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("NAKOUT %d\n", EP0State);
			#endif
			
			if (EP0State == EP0S_IN_DATA){
				SetupInStatus();
			}else if (EP0State == EP0S_OUT_STATUS){
				SetStall();
			}
		}
		
		// NACKされたINパケットの処理
		void ReceivedNAKIN(void){
			if (USB.INTFLAGSBCLR & USB_TRNIF_bm) return;
			if (ReceivedSETUP() == true){
				// SETUPパケット
				return;
			}
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("NAKIN %d\n", EP0State);
			#endif
			
			if (EP0State == EP0S_OUT_DATA){
				SetupOutStatus();
			}else if (EP0State == EP0S_IN_STATUS){
				SetStall();
			}
		}
		
		// OUTパケットの処理
		void ReceivedOUT(void){
			switch(EP0State){
			case EP0S_IN_STATUS:	// IN転送のSTATUS
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("IN Status\n");
				#endif
				EndOfRequest();
				Init();
				break;

			case EP0S_OUT_DATA:		// OUT転送のDATA
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("OUT Data\n");
				#endif
				if (SetupOutData() == false)
					SetupOutStatus();
				break;

			default:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("OUT (%d)\n", EP0State);
				#endif
				break;
			}
		}
		
		// INパケットの処理
		void ReceivedIN(void){
			switch(EP0State){
			case EP0S_IN_DATA:		// IN転送のDATA
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("IN Data\n");
				#endif
				if (SetupInData() == false)
					SetupInStatus();
				break;

			case EP0S_OUT_STATUS:	// OUT転送のSTATUS
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("OUT Status\n");
				#endif
				EndOfRequest();
				Init();
				break;
		
			default:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("IN (%d)\n", EP0State);
				#endif
				break;
			}
		}
		
		// リクエストを終了
		void EndOfRequest(void){
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("OutData(%04X,%d,%d)\n", EP0Setup.bRequest, EP0Setup.wIndex, EP0Out.Size);
			#endif
			
			unsigned char type = EP0Setup.bmRequestType;
			unsigned char req = EP0Setup.bRequest;
			
			if ((type == (USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_BASIC | USB_DRQ_TARGET_DEVICE)) && (req == USB_DRQ_RQ_SET_ADDRESS)){
				// SetAddressが来ていたら、アドレスをレジスタに設定
				unsigned char addr = m_Address;
				if (addr != 0){
					USB.ADDR = addr;
					m_Address = 0;
				}
			}else
			if ((type == (USB_DRQ_DIR_HOST_TO_DEVICE | USB_DRQ_TYPE_CLASS | USB_DRQ_TARGET_INTERFACE)) && (req == USB_DRQ_RQ_HID_SET_REPORT)){
				// Set Report
				USBIF::HIDSetReportRequest(EP0Setup.wValue, EP0Out.Size, (char*)EP0Out.FIFO);
			}
			
			EP0Setup.bRequest = 0;
		}

		// ストールを返す
		void SetStall(void){
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("Stall\n");
			#endif
			
			EP0State = EP0S_STALL;
			las(&USB_SRAM.OUT.CTRL, USB_EP_STALL_bm);
			las(&USB_SRAM.IN.CTRL, USB_EP_STALL_bm);
		}
		
		// IN転送のバッファへ書き込み
		void WriteInBuffer(const void *buf, unsigned short size, char flags){
			unsigned short reqsize = EP0Setup.wLength;	// ホストから要求されたサイズ
			
			if (USB_EP0_FIFOLENGTH < size) size = USB_EP0_FIFOLENGTH;
			
			EP0In.ZLP = false;
			if (size < reqsize){
				if ((size % USB_EP0_PKTLENGTH) == 0) EP0In.ZLP = true;
			}else{
				size = reqsize;
			}
			EP0In.Size = size;
			EP0In.Next = 0;
			EP0State = EP0S_IN_DATA;
			if (0 <= flags){
				if (0 < flags){
					// flags = 1のとき、データはフラッシュ上にある
					//CriticalSection{
						memcpy_P((void*)EP0In.FIFO, buf, size);
					//}
				}else{
					memcpy((void*)EP0In.FIFO, buf, size);
				}
			}else{
				// flags = -1のとき、すでにデータはメモリーに書き込まれている
			}
		}
		
		// OUT転送のSTATUSを返す用意をする
		void SetupOutStatus(void){
			USB_SRAM.IN.CNT = 0;
			lac(&USB_SRAM.IN.STATUS, USB_EP_BUSNACK0_bm);
			EP0State = EP0S_OUT_STATUS;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("Sending OutStatus\n");
			#endif
		}
		
		// IN転送のSTATUSを受け取る用意をする
		void SetupInStatus(void){
			USB_SRAM.OUT.CNT = 0;
			lac(&USB_SRAM.OUT.STATUS, USB_EP_BUSNACK0_bm);
			EP0State = EP0S_IN_STATUS;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("Waiting InStatus\n");
			#endif
		}
		
		// IN転送のDATAを返す用意をする
		bool SetupInData(void){
			unsigned short size = EP0In.Size, next = EP0In.Next, remaining;
			if (size <= 0){
				if (EP0In.ZLP == true){
					EP0In.ZLP = false;
					
					#if USB_OUTPUT_DEBUG_STRING
						xprintf("SetupInZLP\n");
					#endif
					
					USB_SRAM.IN.CNT = 0;
					lac(&USB_SRAM.IN.STATUS, USB_EP_BUSNACK0_bm);	// 送信を許可
				}
				return false;
			}
			
			remaining = size;
			if (USB_EP0_PKTLENGTH < size) size = USB_EP0_PKTLENGTH;
			memcpy((void*)EP0In.PktBuffer, (const void*)(EP0In.FIFO + next), size);
			USB_SRAM.IN.DATAPTR = (unsigned short)EP0In.PktBuffer;
			EP0In.Size = remaining - size;
			EP0In.Next = next + size;
			
			#if USB_OUTPUT_DEBUG_STRING
				xprintf("SetupInData(%d)\n", size);
			#endif
			
			USB_SRAM.IN.CNT = size;
			lac(&USB_SRAM.IN.STATUS, USB_EP_BUSNACK0_bm);	// 送信を許可
			return true;
		}
		
		// OUT転送のDATAを受け取る用意をする
		bool SetupOutData(void){
			unsigned short next = EP0Out.Size, size = USB_SRAM.OUT.CNT;
			if ((next + size) <= USB_EP0_FIFOLENGTH){
				memcpy((void*)(EP0Out.FIFO + next), (const void*)EP0Out.PktBuffer, size);
			}else if (next < USB_EP0_FIFOLENGTH){
				memcpy((void*)(EP0Out.FIFO + next), (const void*)EP0Out.PktBuffer, USB_EP0_FIFOLENGTH - size);
			}
			next += size;
			EP0Out.Size = next;
			
			lac(&USB_SRAM.OUT.STATUS, USB_EP_BUSNACK0_bm);	// 受信を許可
			return next < EP0Setup.wLength;
		}
		
		
		
		// ベーシックディスクリプタを返す
		static EP0_REPLY_e ReplyBasicDescriptor(void){
			unsigned char type = EP0Setup.wValue >> 8;
			unsigned char index = EP0Setup.wValue;
			switch(type){
			case USB_DESC_DEVICE:
				// デバイスディスクリプタを返す
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("GetDeviceDesc() ");
				#endif
				WriteInBuffer(&DeviceDescriptor, sizeof(DeviceDescriptor), 1);
				return EP0_REPLY_TRANSMIT;
		
			case USB_DESC_CONFIGURATION:
				// コンフィグレーションディスクリプタ他を返す
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("GetConfDesc(%d) ", index);
				#endif
				WriteInBuffer(&ConfigurationDescriptor, sizeof(ConfigurationDescriptor), 1);
				return EP0_REPLY_TRANSMIT;
		
			case USB_DESC_STRING:
				// ストリングディスクリプタを返す
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("GetStringDesc(%d) ", index);
				#endif
				if (index < 4){
					const char *buf;
					buf = StringDescriptors[index];
					WriteInBuffer(buf, buf[0], 1);
					return EP0_REPLY_TRANSMIT;
				}
			}
			return EP0_REPLY_STALL;	// 要求されたデスクリプタを持っていないのでストールを返す
		}

		// HIDクラスのディスクリプタを返す
		/*static EP0_REPLY_e ReplyHIDDescriptor(void){
			unsigned char type = EP0Setup.wValue >> 8;
			//unsigned char index = EP0Setup.wValue;
			switch(type){
			case USB_DESC_HID:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("GetHIDDesc() ");
				#endif
				WriteInBuffer(&ConfigurationDescriptor.HIDClass, sizeof(HIDClassDescriptor_t));
				return EP0_REPLY_TRANSMIT;
		
			case USB_DESC_HID_REPORT:
				#if USB_OUTPUT_DEBUG_STRING
					xprintf("GetHIDReportDesc(%d) ", index);
				#endif
				WriteInBuffer(HIDReportDescriptor, sizeof(HIDReportDescriptor));
				return EP0_REPLY_TRANSMIT;
			}
			return EP0_REPLY_STALL;	// 要求されたデスクリプタを持っていないのでストールを返す
		}*/



		
		
	}


}



