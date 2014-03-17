/**	@file
	@brief USBの制御
*/

#include "usb.h"
#include "usb_desc.h"
#include "gpio.h"

#include "../HAL/BTLUSB.h"

#include "xprintf.h"

#include "FreeRTOS.h"
#include "task.h"
#include "semphr.h"

#include <string.h>







/*
	EP0	-> コントロール転送
	シェル入出力
		EP1	-> インタラプトIN(ホスト←デバイス)
		EP2	-> バルクOUT(ホスト→デバイス)
	大容量データ転送
		EP3 -> バルクIN
		EP4 -> バルクOUT
*/

namespace USB{
	
	const static int  USB_EP0_FIFOSIZE	= 64;
	const static int  USB_EP0_BUFSIZE	= 256;
	
	
	
	// ステートマシン
	enum STATE_e{
		US_DETACHED = 0,	// はずされている
		US_DEFAULT,			// リセット済み
		US_ADDRESS,			// アドレス付与済み
		US_CONFIGURED		// コンフィグレーション済み
	};
	

	// 転送の状態
	enum EP0S_STATE_e{
		EP0S_IDLE = 0,	// SETUPパケット・転送待ち
		EP0S_STALL,		// ストール中
		EP0S_WRITE,		// ホストからデバイスへの転送
		EP0S_READ		// デバイスからホストへの転送
	};

	// EP0の情報
	struct EP0_t{
		EP0S_STATE_e state;
		char buf[USB_EP0_BUFSIZE];
		int offset;
		int size;
		bool zlp;
	};

	// EP0内でのSETUPパケットの扱い
	enum EP0_REPLY_e{
		EP0_REPLY_NO_DATA,	// データなし
		EP0_REPLY_RECEIVE,	// ホストからデータを受信する
		EP0_REPLY_TRANSMIT,	// ホストへデータを送信する
		EP0_REPLY_STALL		// 未対応のリクエスト
	};

	volatile STATE_e State;
	volatile bool Suspended;
	volatile EP0_t EP0;
	
	

	/*** USB一般 ***/

	// 初期化
	void Init(void){
		// レジスタ設定
		IO_USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK;
		IO_USBB.udcon	= AVR32_USBB_UDCON_DETACH_MASK;	// プルアップ抵抗を切り離し
	
		IO_USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK | AVR32_USBB_USBCON_OTGPADE_MASK
					| AVR32_USBB_USBCON_USBE_MASK;
	
		IO_USBB.udinteclr = 0xFFFFFFFF;
		Int::Register(IRQ_USBB, (void*)OnUSBB, IL_HIGH);
	
		IO_USBB.udinteset	= AVR32_USBB_UDINTESET_SUSPES_MASK | AVR32_USBB_UDINTESET_EORSTES_MASK
							| AVR32_USBB_UDINTESET_EP0INTES_MASK
							| AVR32_USBB_UDINTESET_EP1INTES_MASK | AVR32_USBB_UDINTESET_EP2INTES_MASK
							| AVR32_USBB_UDINTESET_EP3INTES_MASK | AVR32_USBB_UDINTESET_EP4INTES_MASK;	
		IO_USBB.udintclr = AVR32_USBB_UDINTCLR_SUSPC_MASK;
	}
	
	// USBが接続されているか
	bool IsConnected(void){
		return State == US_CONFIGURED;
	}
	
	// USBリセット
	static void OnReset(void){
		// リセット
		IO_USBB.udintclr = AVR32_USBB_UDINTCLR_EORSTC_MASK;
		
		State = US_DEFAULT;
		
		// エンドポイントの初期化
		IO_USBB.uerst	= AVR32_USBB_UERST_EPRST0_MASK
						| AVR32_USBB_UERST_EPRST1_MASK | AVR32_USBB_UERST_EPRST2_MASK
						| AVR32_USBB_UERST_EPRST3_MASK | AVR32_USBB_UERST_EPRST4_MASK;
		IO_USBB.uerst	= AVR32_USBB_UERST_EPEN0_MASK
						| AVR32_USBB_UERST_EPEN1_MASK | AVR32_USBB_UERST_EPEN2_MASK
						| AVR32_USBB_UERST_EPEN3_MASK | AVR32_USBB_UERST_EPEN4_MASK;
		
		IO_USBB.uecfg0	= (AVR32_USBB_UECFG0_EPTYPE_CONTROL << AVR32_USBB_UECFG0_EPTYPE)
					| AVR32_USBB_UECFG0_EPDIR_MASK
					| (AVR32_USBB_UECFG0_EPSIZE_64 << AVR32_USBB_UECFG0_EPSIZE)
					| AVR32_USBB_UECFG0_ALLOC_MASK;
		IO_USBB.uecon0set	= AVR32_USBB_UECON0_RXSTPE_MASK
							| AVR32_USBB_UECON0_STALLEDE_MASK;
		
		IO_USBB.uecfg1 = (AVR32_USBB_UECFG1_EPTYPE_BULK << AVR32_USBB_UECFG1_EPTYPE)
					| AVR32_USBB_UECFG1_EPDIR_MASK
					| (AVR32_USBB_UECFG1_EPSIZE_64 << AVR32_USBB_UECFG1_EPSIZE) | (AVR32_USBB_UECFG1_EPBK_DOUBLE << AVR32_USBB_UECFG1_EPBK)
					| AVR32_USBB_UECFG1_ALLOC_MASK;
		IO_USBB.uecon1set = AVR32_USBB_UECON1_TXINE_MASK;
		
		IO_USBB.uecfg2 = (AVR32_USBB_UECFG2_EPTYPE_BULK << AVR32_USBB_UECFG2_EPTYPE)
					| (AVR32_USBB_UECFG2_EPSIZE_64 << AVR32_USBB_UECFG2_EPSIZE) | (AVR32_USBB_UECFG2_EPBK_DOUBLE << AVR32_USBB_UECFG2_EPBK)
					| AVR32_USBB_UECFG2_ALLOC_MASK;
		IO_USBB.uecon2set = AVR32_USBB_UECON2_RXOUTE_MASK;
		
		IO_USBB.uecfg3 = (AVR32_USBB_UECFG3_EPTYPE_BULK << AVR32_USBB_UECFG3_EPTYPE)
					| AVR32_USBB_UECFG3_EPDIR_MASK
					| (AVR32_USBB_UECFG3_EPSIZE_64 << AVR32_USBB_UECFG3_EPSIZE) | (AVR32_USBB_UECFG3_EPBK_DOUBLE << AVR32_USBB_UECFG3_EPBK)
					| AVR32_USBB_UECFG3_ALLOC_MASK;
		
		IO_USBB.uecfg4 = (AVR32_USBB_UECFG4_EPTYPE_BULK << AVR32_USBB_UECFG4_EPTYPE)
					| (AVR32_USBB_UECFG4_EPSIZE_64 << AVR32_USBB_UECFG4_EPSIZE) | (AVR32_USBB_UECFG4_EPBK_DOUBLE << AVR32_USBB_UECFG4_EPBK)
					| AVR32_USBB_UECFG4_ALLOC_MASK;
		IO_USBB.uecon4set = AVR32_USBB_UECON4_RXOUTE_MASK;
		
		EP0.state = EP0S_IDLE;
		
		xprintf("Reset\n");
	}

	// USB割り込み
	IH OnUSBB(){
		int irq = IO_USBB.udint;
	
		if (Suspended == false){
			// ウェークアップ中
			
			static const int shift = 31 - AVR32_USBB_UDINT_EP4INT;
			int bit, tmp;
			// 立っているフラグを調べる
			__asm__ __volatile__(
				"lsl %[tmp], %[irq], %[shift]	\n"
				"clz %[bit], %[tmp]				\n"
				: [bit]"=r"(bit), [tmp]"=r"(tmp)
				: [irq]"r"(irq), [shift]"i"(shift)
				);
			if (bit <= 4){
				typedef void (*EPFUNC_t)(void);
				static const EPFUNC_t func[5] = {
					Data::OnEP4, Data::OnEP3, Debug::OnEP2, Debug::OnEP1, OnEP0
				};
				// それぞれのエンドポイントを受け持つ関数を呼び出す
				func[bit]();
			}else{
				if (irq & AVR32_USBB_UDINT_SUSP_MASK){
					// サスペンド
					IO_USBB.udintclr = AVR32_USBB_UDINTCLR_SUSPC_MASK;
					IO_USBB.udinteset = AVR32_USBB_UDINTESET_WAKEUPES_MASK;
			
					Suspended = true;
				
					xprintf("Suspend\n");
				}
			}
		}else{
			// サスペンド中
		
			if (irq & AVR32_USBB_UDINT_WAKEUP_MASK){
				// ウェークアップ
				IO_USBB.udintclr = AVR32_USBB_UDINTCLR_WAKEUPC_MASK;
				IO_USBB.udinteclr = AVR32_USBB_UDINTECLR_WAKEUPEC_MASK;
			
				Suspended = false;
			
				xprintf("Wakeup\n");
			}
		}
	
		if (irq & AVR32_USBB_UDINT_EORST_MASK){
			OnReset();
		}
	}



	// FIFOから読み込み
	static void ReadFIFO(int ep, int offset, void *buf_, int size){
		char *fifo = GetUSBFIFO(ep) + offset;
		char *buf = (char*)buf_;
		while(0 < size){		// memcpyしてはいけない
			*buf++ = *fifo++;
			size--;
		}
	}

	// FIFOに書き込み
	static void WriteFIFO(int ep, int offset, const void *buf_, int size){
		char *fifo = GetUSBFIFO(ep) + offset;
		const char *buf = (const char*)buf_;
		while(0 < size){		// memcpyしてはいけない
			*fifo++ = *buf++;
			size--;
		}
	}



	/*** エンドポイント0 ***/

	// EP0のバッファに書き込み
	void EP0_WriteBuffer(const char *buf, int size, int reqsize){
		volatile char *dst = EP0.buf;
		if (USB_EP0_BUFSIZE < reqsize) reqsize = USB_EP0_BUFSIZE;
		if (USB_EP0_BUFSIZE < size) size = USB_EP0_BUFSIZE;
	
		EP0.zlp = false;
		if (size < reqsize){
			if ((size % USB_EP0_FIFOSIZE) == 0) EP0.zlp = true;
		}else{
			size = reqsize;
		}		
		EP0.size = size;
		EP0.offset = 0;
		EP0.state = EP0S_READ;
	
		memcpy((void*)dst, buf, size);
	
		EnableTXINI(0);
		EnableRXOUTI(0);
		EnableNAKOUTI(0);
	
		AckNAKOUTI(0);
		AckRXOUTI(0);
	}
	void EP0_WriteBuffer(int size, int reqsize){
		if (USB_EP0_BUFSIZE < reqsize) reqsize = USB_EP0_BUFSIZE;
		if (USB_EP0_BUFSIZE < size) size = USB_EP0_BUFSIZE;
	
		EP0.zlp = false;
		if (size < reqsize){
			if ((size % USB_EP0_FIFOSIZE) == 0) EP0.zlp = true;
		}else{
			size = reqsize;
		}		
		EP0.size = size;
		EP0.offset = 0;
		EP0.state = EP0S_READ;
	
		EnableTXINI(0);
		EnableRXOUTI(0);
		EnableNAKOUTI(0);
	
		AckNAKOUTI(0);
		AckRXOUTI(0);
	}
	void* EP0_GetBuffer(void){
		return (void*)EP0.buf;
	}

	// EP0の転送を中止
	static void EP0_DestroyBuffer(void){
		EP0.size = 0;
		EP0.zlp = false;
	}

	// ゼロレングスパケット(ZLP)を返す
	void EP0_ReturnZeroLengthPacket(void){
		AckTXINI(0);	// Reply IN
		EnableTXINI(0);
		EP0.state = EP0S_WRITE;
	}

	// STALLを返す
	void EP0_SetSTALL(void){
		EP0.state = EP0S_STALL;
		DisableRXOUTI(0);
		DisableTXINI(0);
		DisableNAKINI(0);
		DisableNAKOUTI(0);
		ReturnSTALL(0);
	}

	// アイドルステートに遷移 
	static void EP0_SetIDLE(void){
		EP0.state = EP0S_IDLE;
		DisableRXOUTI(0);
		DisableTXINI(0);
		DisableNAKINI(0);
		DisableNAKOUTI(0);
	}

	// EP0のFIFOを更新
	bool EP0_UpdateFIFO(void){
		int size = EP0.size;
		int org_size;
		int offset = EP0.offset;
		bool result;
	
		if (size <= 0){
			if (EP0.zlp == true){
				EP0.zlp = false;
				AckTXINI(0);	// ZLPを返す
			}
			return false;
		}
		org_size = size;
		if (USB_EP0_FIFOSIZE < size) size = USB_EP0_FIFOSIZE;
		EP0.offset = offset + size;
		EP0.size = org_size - size;
	
		result = (EP0.size != 0) || (EP0.zlp != false);
	
		WriteFIFO(0, 0, (void*)(EP0.buf + offset), size);
	
		AckTXINI(0);	// Reply IN
	
		return result;
	}



	/*** エンドポイント0 リクエスト ***/

	// ベーシックディスクリプタを返す
	static EP0_REPLY_e EP0_ReplyBasicDescriptor(int wValue, int wLength){
		int type = (wValue >> 8) & 0xFF;
		int index = wValue & 0xFF;
		switch(type){
		case USB_DESC_DEVICE:
			// デバイスディスクリプタを返す
			//xprintf("GetDeviceDesc() ");
			EP0_WriteBuffer((char*)&DeviceDescriptor, sizeof(DeviceDescriptor), wLength);
			return EP0_REPLY_TRANSMIT;
		
		case USB_DESC_CONFIGURATION:
			// コンフィグレーションディスクリプタ他を返す
			//xprintf("GetConfDesc(%d) ", index);
			EP0_WriteBuffer((char*)&ConfigurationDescriptor, sizeof(ConfigurationDescriptor), wLength);
			return EP0_REPLY_TRANSMIT;
		
		case USB_DESC_STRING:
			// ストリングディスクリプタを返す
			//xprintf("GetStringDesc(%d) ", index);
			{
				const char *buf;
				if (index == 0)			buf = StringDescriptor0;	// LANGID
				else if (index == 1)	buf = StringDescriptor1;	// Manufacturer
				else if (index == 2)	buf = StringDescriptor2;	// Product
				else if (index == 3){	// シリアル番号
					/*
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
					return EP0_REPLY_TRANSMIT;*/
					buf = StringDescriptor3;
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
	static void EP0_SetAddress(int wValue){
		int address = wValue & 0x7F;
		IO_USBB.udcon = (IO_USBB.udcon & ~AVR32_USBB_UDCON_UADD_MASK) | (address << AVR32_USBB_UDCON_UADD);
		//xprintf("SetAddress(%d) ", address);
	}

	// コンフィグレーションをセット
	static void EP0_SetConfiguration(int wValue){
		//xprintf("SetConf(%d) ", wValue);
		if (wValue == 1)
			State = US_CONFIGURED;
		else
			State = US_ADDRESS;
	}

	// エンドポイント0の割り込み
	void OnEP0(void){
		int status = IO_USBB.uesta0;
		int mask = IO_USBB.uecon0;
	
		if (status & AVR32_USBB_UESTA0_RXSTPI_MASK){
			// SETUP
			EP0_REPLY_e reply = EP0_REPLY_STALL;
		
			USB_DeviceRequest_t req;
			ReadFIFO(0, 0, &req, 8);
			AckRXSTPI(0);
		
			int req_request_type, req_request;
			int req_value, req_index, req_length;
			req_request_type= req.bmRequestType;
			req_request		= req.bRequest;
			req_value	= __builtin_bswap_16(req.wValue);
			req_index	= __builtin_bswap_16(req.wIndex);
			req_length	= __builtin_bswap_16(req.wLength);
		
			/*xprintf("STP[%02X %02X %04X %04X %04X] ",
				req_request_type,
				req_request,
				req_value,
				req_index,
				req_length);
			//*/
		
			int type = req_request_type & 0x60;
			int target = req_request_type & 0x1F;
			switch(type){
			case USB_DRQ_TYPE_BASIC:
				// 標準リクエスト
				switch(target){
				case USB_DRQ_TARGET_DEVICE:
					// デバイス
					switch(req_request){
					case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
						reply = EP0_REPLY_NO_DATA;
						break;
					
					case USB_DRQ_RQ_SET_ADDRESS:		// Set Address
						EP0_SetAddress(req_value);
						reply = EP0_REPLY_NO_DATA;
						break;
					
					case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
						reply = EP0_ReplyBasicDescriptor(req_value, req_length);
						break;
					
					case USB_DRQ_RQ_SET_CONFIGURATION:	// Set Configration
						EP0_SetConfiguration(req_value);
						reply = EP0_REPLY_NO_DATA;
						break;
					}
					break;
				
				case USB_DRQ_TARGET_ENDPOINT:
					// エンドポイント
					switch(req_request){
					case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
						{
							int ep = req_index & 0xF;
							if ((0 <= ep) && (ep <= 7)){
								// 次のデータパケットをDATA0にする
								//xprintf("ClearFeature(%d) ", ep);
								*(&IO_USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_RSTDTS_MASK;
							}
						}
						reply = EP0_REPLY_NO_DATA;
						break;
					}
					break;
				}
				break;
			}
			
			// 返事をする
			switch(reply){
			case EP0_REPLY_TRANSMIT:
				EP0_UpdateFIFO();
				break;
			
			case EP0_REPLY_NO_DATA:
				EP0_ReturnZeroLengthPacket();
				break;
			
			//case EP0_REPLY_STALL:
			default:
				EP0_SetSTALL();
				//xprintf("Stall");
				break;
			}
			//xprintf("\n");
			return;
		}
		if ((mask & AVR32_USBB_UECON0_NAKOUTE_MASK) && (status & AVR32_USBB_UESTA0_NAKOUTI_MASK)){
			// OUTパケットがNAKされた (IN転送のSTATUS)
			AckNAKOUTI(0);
			if (EP0.state == EP0S_READ){
				DisableNAKOUTI(0);
				EP0_DestroyBuffer();
				status = IO_USBB.uesta0;
			}
		}
		if ((mask & AVR32_USBB_UECON0_TXINE_MASK) && (status & AVR32_USBB_UESTA0_TXINI_MASK)){
			// INパケット (デバイスからホスト)
			if (EP0.state == EP0S_READ){
				bool result = EP0_UpdateFIFO();
				if (result == false){
					DisableTXINI(0);
				}
			}
			if (EP0.state == EP0S_WRITE){
				EP0_SetIDLE();
			
				if (State == US_DEFAULT){
					int address = (IO_USBB.udcon & AVR32_USBB_UDCON_UADD_MASK) >> AVR32_USBB_UDCON_UADD;
					if (address != 0){
						IO_USBB.udcon |= AVR32_USBB_UDCON_ADDEN_MASK;
						State = US_ADDRESS;
					}
				}
			}
		}
		if ((mask & AVR32_USBB_UECON0_RXOUTE_MASK) && (status & AVR32_USBB_UESTA0_RXOUTI_MASK)){
			// OUTパケット (ホストからデバイス)
			if (EP0.state == EP0S_WRITE){
				AckRXOUTI(0);
			}
			if (EP0.state == EP0S_READ){
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
	
	
	
	
	
	
	/*** デバッグインターフェース ***/
	namespace Debug{
		
		const static int TX_PACKETSIZE	= 64;
		const static int TX_BUFSIZE		= 256;
		
		const static int RX_PACKETSIZE	= 64;
		const static int RX_BUFSIZE		= 256;
		
		// 送信リングバッファ
		struct Tx_t{
			char Buf[TX_BUFSIZE];	// バッファ
			int Next;				// 次にデータを追加する先
			int Size;				// データの数
		};
		
		// 受信リングバッファ
		struct Rx_t{
			char Buf[RX_BUFSIZE];
			int Next;
			int Size;
		};
		
		Tx_t Tx;
		Rx_t Rx;
		int Rx_Lock = -1;
		
		
		
		// エンドポイント1(バルクIN)の割り込み
		void OnEP1(void){
			// INパケット (デバイスからホスト)
			
			if (Tx.Size == 0){
				//AckTXINI(1);
				//ClearFIFOCON(1);
				DisableTXINI(1);
				return;
			}
			
			AckTXINI(1);
			
			int offset, txlen;
			offset = Tx.Next - Tx.Size;
			txlen = Tx.Size;
			if (TX_PACKETSIZE < txlen) txlen = TX_PACKETSIZE;
			
			if (offset < 0){
				if (txlen < -offset){
					// 1回でコピー
					offset += TX_BUFSIZE;
					WriteFIFO(1, 0, Tx.Buf + offset, txlen);
				}else{
					// バッファの端なので、2回に分けてコピー
					WriteFIFO(1, 0, Tx.Buf + TX_BUFSIZE + offset, -offset);
					WriteFIFO(1, -offset, Tx.Buf, txlen + offset);
				}
			}else{
				// 1回でコピー
				WriteFIFO(1, 0, Tx.Buf + offset, txlen);
			}
			Tx.Size -= txlen;
			
			ClearFIFOCON(1);
		}
	
		// エンドポイント2(バルクOUT)の割り込み
		void OnEP2(void){
			// OUTパケット (ホストからデバイス)
			
			//// ロックされた領域に被るか・バッファに収まるかを確認する ////
			
			// 制限領域を求める
			int rest, rest1, rest2;
			rest1 = Rx_Lock;
			if (rest1 < 0)
				rest1 = RX_BUFSIZE * 2;	// バッファはロックされていない
			else if (rest1 < Rx.Next)
				rest1 += RX_BUFSIZE;	// 折り返す
			rest2 = Rx.Next + RX_BUFSIZE - Rx.Size;
			rest = (rest1 < rest2) ? rest1 : rest2;
			
			if (rest < (Rx.Next + RX_PACKETSIZE)){
				// バッファが足りなそう
				DisableRXOUTI(2);
				return;
			}
			
			// パケットに応答
			AckRXOUTI(2);
			
			// データをコピー
			int byte = IO_USBB.UESTA2.byct;
			
			/*char buf[64];
			ReadFIFO(2, 0, buf, byte);
			xprintf("rx(%d)[", byte);
			put_dump(buf, 0, byte, DW_CHAR);
			xputs("]\n");*/
			
			Rx.Size += byte;
			if (RX_BUFSIZE <= (Rx.Next + byte)){
				// バッファの端なので、2回に分けてコピー
				int div = RX_BUFSIZE - Rx.Next;
				ReadFIFO(2, 0, Rx.Buf + Rx.Next, div);
				byte -= div;
				ReadFIFO(2, div, Rx.Buf, byte);
				Rx.Next = byte;
			}else{
				// 1回でコピー
				ReadFIFO(2, 0, Rx.Buf + Rx.Next, byte);
				Rx.Next += byte;
			}
			ClearFIFOCON(2);
		}
		
		
		
		// 書き込み
		void Write(char c){
			if (TX_BUFSIZE <= Tx.Size) return;	// クリティカルセクションは時間がかかるため、最初に一度チェックする
		
			portENTER_CRITICAL();
			if (TX_BUFSIZE <= Tx.Size){	// 二重にチェック
				portEXIT_CRITICAL();
				return;
			}		
		
			Tx.Buf[Tx.Next] = c;
			Tx.Size++;
			Tx.Next++;
			if (TX_BUFSIZE <= Tx.Next){
				Tx.Next = 0;
			}
			
			EnableTXINI(1);	
		
			portEXIT_CRITICAL();
		}
	
		// 読み込みを始める
		int BeginRead(const char **s){
			if (Rx.Size == 0){
				*s = NULL;
				return 0;
			}
		
			portENTER_CRITICAL();
		
			int rxlen;
			int offset;
		
			offset = Rx.Next - Rx.Size;
			if (offset < 0){
				offset += RX_BUFSIZE;
				rxlen = RX_BUFSIZE - offset;
				*s = Rx.Buf + offset;
			}else{
				rxlen = Rx.Size;
				*s = Rx.Buf + offset;
			}
			Rx_Lock = offset;
			Rx.Size -= rxlen;
		
			portEXIT_CRITICAL();
		
			return rxlen;
		}
	
		// 読み込みを終える
		void EndRead(void){
			portENTER_CRITICAL();
		
			Rx_Lock = -1;
			EnableRXOUTI(2);
		
			portEXIT_CRITICAL();
		}
	}
	
	
	
	
	
	
	/*** 大容量データ転送 ***/
	namespace Data{
		// エンドポイント3の割り込み
		void OnEP3(void){
			// INパケット (デバイスからホスト)
			if (btlUSB.CallbackTx(NULL, NULL) == true){
				AckTXINI(3);
				btlUSB.CallbackTx(GetUSBFIFO(3), NULL);
				ClearFIFOCON(3);
			}else{
				// 送るデータがない
				DisableTXINI(3);
			}
		}

		// エンドポイント4の割り込み
		void OnEP4(void){
			// OUTパケット (ホストからデバイス)
			if (btlUSB.CallbackRx(NULL, 0) == true){
				AckRXOUTI(4);
				btlUSB.CallbackRx(GetUSBFIFO(4), IO_USBB.UESTA4.byct);
				ClearFIFOCON(4);
			}else{
				// バッファが足りない
				DisableRXOUTI(4);
			}
		}
	}
	
	
	
	
	
	
	
	
	
}



