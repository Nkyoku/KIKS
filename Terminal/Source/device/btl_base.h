// バルク転送レイヤー インターフェースクラス

#pragma once

#include <Windows.h>
#include <string>



class iBTL abstract{
	/* 定数 */
public:
	static const unsigned int MAX_PAYLOADSIZE = 1080;	// 一度の転送で送れる最大バイト数

protected:
	static const unsigned int HEADER_LENGTH	= 4;

#pragma pack(push, 1)
	// 短いパケットの構造
	struct SPACKET_t{
		unsigned char Dest;		// あて先
		unsigned char Msg;		// メッセージID
		unsigned char Length;	// パケット内のデータ長
		unsigned char Frame;	// フレーム番号
		char Data[0];			// データ
	};

	// 長いパケットの構造
	struct LPACKET_t{
		unsigned char Dest;		// あて先
		unsigned char Msg;		// メッセージID
		unsigned short Length;	// パケット内のデータ長
		char Data[0];			// データ
	};
#pragma pack(pop)
	
public:
	// パケットの構造
	struct PACKET_t{
		unsigned int Dest;
		unsigned int Msg;
		unsigned int Length;
		char Data[MAX_PAYLOADSIZE];
	};






	/* メンバー変数 */
private:
	

protected:
	HANDLE hRxEvent;	// 受信時に有効にするイベント




	/* メソッド */
public:
	// コンストラクタ
	iBTL(void) : hRxEvent(NULL){}

	// デストラクタ
	virtual ~iBTL(){};

	// 受信イベントを設定
	void SetRxEvent(HANDLE hevent){
		hRxEvent = hevent;
	}

	// 接続したか
	virtual bool IsConnected(void) = 0;

	// リンクが生きているか
	virtual bool IsAlive(void) = 0;

	// PHY名を取得
	virtual const wchar_t* GetPhyName(void) = 0;

	// デバッグ文字列を送信する
	virtual bool TxDebug(std::string &str) = 0;

	// デバッグ文字列を受信する
	virtual bool RxDebug(void) = 0;
	virtual bool RxDebug(std::string &str) = 0;

	// データを送信できるか調べる
	virtual bool TxFlow(unsigned int len = 0) = 0;

	// データを送信
	virtual bool Tx(const PACKET_t &packet) = 0;
	
	// データを受信できるか調べる
	virtual bool RxFlow(void) = 0;

	// データを受信
	virtual bool Rx(PACKET_t &packet) = 0;



protected:
	// パケットの分割数を計算
	inline unsigned int GetDividedPackets(unsigned int len, unsigned int block_size){
		if (len == 0) len++;
		return ((len + block_size - 1) / block_size);
	}

};
