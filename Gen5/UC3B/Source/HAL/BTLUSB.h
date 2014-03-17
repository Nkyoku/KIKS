/**	@file
	@brief USBデータ転送デバイスの仮想化
	       Bulk Transport Layer
*/

#ifndef BTLUSB_H_
#define BTLUSB_H_

#include "../define.h"



// USBデータ転送デバイスの仮想化クラス
class clBTLUSB{
private:
	/* 定数 */
public:
	static const unsigned int MAX_PAYLOADSIZE = 1080;
	
	static const unsigned int HEADER_LENGTH	= 4;

private:	
	static const unsigned int TX_QUEUELEVEL	= 64;
	static const unsigned int TX_PACKETSIZE	= 64;
	static const unsigned int TX_PAYLOADSIZE	= TX_PACKETSIZE - HEADER_LENGTH;
	static const unsigned int TX_MAX_DIVISION	= (MAX_PAYLOADSIZE + TX_PAYLOADSIZE - 1) / TX_PAYLOADSIZE;
	
	static const unsigned int RX_QUEUELEVEL	= 64;
	static const unsigned int RX_PACKETSIZE	= 64;
	static const unsigned int RX_PAYLOADSIZE	= RX_PACKETSIZE - HEADER_LENGTH;
	static const unsigned int RX_MAX_DIVISION	= (MAX_PAYLOADSIZE + RX_PAYLOADSIZE - 1) / RX_PAYLOADSIZE;
	
	
	
	/* 型 */
private:
	// 短いパケットの構造
	struct SPACKET_t{
		unsigned char Dest;		// あて先
		unsigned char Msg;		// メッセージID
		unsigned char Length;	// パケット内のデータ長
		unsigned char Frame;	// フレーム番号
		char Data[0];			// データ
	} PACK;
	
public:
	// パケットの構造
	struct PACKET_t{
		unsigned char Dest;
		unsigned char Msg;
		unsigned short Length;
		char Data[MAX_PAYLOADSIZE];
	} PACK;
	
	
	
	/* メンバー変数 */
private:
	
	// 送信リングバッファ
	volatile struct Tx_t{
		char Buf[TX_QUEUELEVEL][TX_PACKETSIZE];
		unsigned int Next;
		unsigned int Size;
	} m_Tx;
	
	// 受信リングバッファ
	volatile struct Rx_t{
		char Buf[RX_QUEUELEVEL][RX_PACKETSIZE];
		unsigned int Next;
		unsigned int Size;
		bool FrameLacking;
	} m_Rx;
	
	
	
public:
	// リセット
	void Reset(void);
	
	// デバイスから送信時に呼ばれる(ISR内)
	bool CallbackTx(char *fifo, int *len);
	
	// デバイスから受信時に呼ばれる(ISR内)
	bool CallbackRx(const char *fifo, int len);
	
	// 送信できるか調べる
	bool TxFlow(unsigned int len);
	
	// 送信
	bool Tx(const PACKET_t &packet);
	
	// 受信できるか調べる
	bool RxFlow(void);
	
	// 受信
	bool Rx(PACKET_t &packet);
	
	
	
	
	
	
private:
	// パケットの分割数を計算
	inline unsigned int GetDividedPackets(unsigned int len, unsigned int block_size){
		if (len == 0) len++;
		return ((len + block_size - 1) / block_size);
	}
	
	// インクリメントして折り返す
	inline int IncAndWrap(int value, int limit){
		value -= limit - 1;
		if (ISPOWEROF2(limit)){
			return value & (limit - 1);
		}else{
			if (value < 0){
				value += limit;
			}
			return value;
		}
	}
	
	// 負方向で折り返す
	inline int LowerWrap(int value, int limit){
		if (ISPOWEROF2(limit)){
			return value & (limit - 1);
		}else{
			if (value < 0){
				value += limit;
			}
			return value;
		}
	}
	
	
	
	
	
};



extern clBTLUSB btlUSB;	// USB BTL 



#endif
