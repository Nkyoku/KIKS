// USB バルク転送レイヤー

#pragma once

#include "btl_base.h"

#include <Windows.h>
#include "winusb/winusb.h"

#include <deque>
#include <algorithm>



class clBTLUSB : public iBTL{
	/* 定数 */
private:
	static const char PIPE_DEBUG_IN		= 0x81;		// デバックINパイプ
	static const char PIPE_DEBUG_OUT	= 0x02;		// デバッグOUTパイプ
	static const char PIPE_BULK_IN		= 0x83;		// バルクINパイプ
	static const char PIPE_BULK_OUT		= 0x04;		// バルクOUTパイプ

	static const unsigned int DEBUG_IN_PACKETSIZE	= 64;	// デバッグINパイプのパケットサイズ
	static const unsigned int DEBUG_OUT_PACKETSIZE	= 64;	// デバッグOUTパイプのパケットサイズ
	static const unsigned int BULK_IN_PACKETSIZE	= 64;	// バルクINパイプのパケットサイズ
	static const unsigned int BULK_OUT_PACKETSIZE	= 64;	// バルクOUTパイプのパケットサイズ
	static const unsigned int BULK_IN_PAYLOADSIZE	= BULK_IN_PACKETSIZE - HEADER_LENGTH;
	static const unsigned int BULK_OUT_PAYLOADSIZE	= BULK_OUT_PACKETSIZE - HEADER_LENGTH;
	static const unsigned int BULK_IN_MAX_DIVISION	= (MAX_PAYLOADSIZE + BULK_IN_PAYLOADSIZE - 1) / BULK_IN_PAYLOADSIZE;
	static const unsigned int BULK_OUT_MAX_DIVISION	= (MAX_PAYLOADSIZE + BULK_OUT_PAYLOADSIZE - 1) / BULK_OUT_PAYLOADSIZE;

	static const unsigned int TX_DEBUG_BUFSIZE	= 16384;		// デバッグ文字列の送信バッファサイズ
	static const unsigned int RX_DEBUG_BUFSIZE	= 16384;		// デバッグ文字列の受信バッファサイズ
	static const unsigned int TX_DATA_QUEUELEVEL	= 512;		// データ送信のキューレベル
	static const unsigned int RX_DATA_QUEUELEVEL	= 512;		// データ受信のキューレベル

	struct TXDATA_t{
		char Byte[BULK_OUT_PACKETSIZE];
	};
	
	struct RXDATA_t{
		char Byte[BULK_IN_PACKETSIZE];
	};




	/* メンバー変数 */
private:
	HANDLE hDevice;		// デバイスのハンドル
	WINUSB_INTERFACE_HANDLE hWinUSB;	// WinUSBでのハンドル
	HANDLE hThread;		// 送受信スレッドのハンドル
	HANDLE hEventEnd;	// 送受信スレッドに終了を要求するイベント

	CRITICAL_SECTION CS;	// クリティカルセクション

	/* デバッグIN/OUT */
	OVERLAPPED OverlappedDebugIn;	// デバッグIN/OUTのOVERLAPPED構造体
	OVERLAPPED OverlappedDebugOut;
	bool UsingEventDebugIn, UsingEventDebugOut;	// デバッグIN/OUTのイベントが使われているか(転送中か)
	HANDLE hEventDebugIn, hEventDebugOut;		// デバッグIN/OUTのイベント
	
	std::deque<char> DebugOutQueue;	// デバッグOUTのFIFO
	std::deque<char> DebugInQueue;	// デバッグINのFIFO
	char DebugOutBuffer[DEBUG_OUT_PACKETSIZE];	// デバッグOUTのWriteバッファ
	char DebugInBuffer[DEBUG_IN_PACKETSIZE];	// デバッグINのReadバッファ


	/* バルクIN/OUT */
	OVERLAPPED OverlappedBulkIn;	// バルクIN/OUTのOVERLAPPED構造体
	OVERLAPPED OverlappedBulkOut;
	bool UsingEventBulkIn, UsingEventBulkOut;	// バルクIN/OUTのイベントが使われているか(転送中か)
	HANDLE hEventBulkIn, hEventBulkOut;			// バルクIN/OUTのイベント
	
	std::deque<RXDATA_t> BulkInQueue;		// バルクINのキュー
	std::deque<TXDATA_t> BulkOutQueue;		// バルクOUTのキュー
	RXDATA_t BulkInBuffer;					// バルクINのバッファ
	TXDATA_t BulkOutBuffer;					// バルクOUTのバッファ

	volatile bool BulkInFrameLacking;		// バルクINのフレームが不足している



	


	

	/* メソッド */
public:
	// コンストラクタ
	clBTLUSB(HANDLE hdev, HANDLE husb);

public:
	// デストラクタ
	~clBTLUSB();

	// 接続したか
	bool IsConnected(void) override;

	// リンクが生きているか
	bool IsAlive(void) override;

	// PHY名を取得
	const wchar_t* GetPhyName(void) override{
		return L"USB";
	}

	// デバッグ文字列を送信する
	bool TxDebug(std::string &str) override;

	// デバッグ文字列を受信する
	bool RxDebug(void) override;
	bool RxDebug(std::string &str) override;

	// データを送信できるか調べる
	bool TxFlow(unsigned int len = 0) override;

	// データを送信
	bool Tx(const PACKET_t &packet) override;
	
	// データを受信できるか調べる
	bool RxFlow(void) override;

	// データを受信
	bool Rx(PACKET_t &packet) override;
	







private:
	// (内部)デバッグ文字列を送信する
	void IntTxDebug(void);

	// (内部)デバッグ文字列を受信する
	void IntRxDebug(void);

	// (内部)データを送信
	void IntTxData(void);

	// (内部)データを受信
	void IntRxData(bool &ignite);

	


private:

	// 送受信するスレッド
	static unsigned int __stdcall TransceiveThread(void *device);

	// ハンドルを解放する
	static void SafeClose(HANDLE &h){
		if (h != NULL){
			CloseHandle(h);
			h = NULL;
		}
	}

	
};
