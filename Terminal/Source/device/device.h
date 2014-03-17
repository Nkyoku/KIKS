// デバイスを管理するインターフェース

#pragma once

#include "btl_base.h"

#include <Windows.h>
#include <vector>
#include <string>
#include <map>

#include "message_enum.h"
#include "message_struct.h"



// デバイス情報
struct DEVINFO_t{
	bool Update;			// 情報が更新された
	bool Inquiry;			// 情報が取得された
	std::wstring DevName;	// デバイス名
	std::wstring MacName1;	// マシン名1
	std::wstring MacName2;	// マシン名2
	std::wstring Date;		// ファームウェアの日付
	int Generation;			// ジェネレーション
	int Revision;			// リビジョン(A→1)
	std::wstring Phy;		// 接続名
	int MachineID;			// マシンID
	int PipeLinks;			// パイプの数

	// 初期化する
	void clear(void){
		Update		= true;
		Inquiry		= false;
		DevName.clear();
		MacName1.clear();
		MacName2.clear();
		Generation	= 0;
		Revision	= 0;
		Phy.clear();
		MachineID	= -1;
		PipeLinks	= 0;
	}
};



// デバイスを管理するインターフェース
class iDevice abstract{

	/* 定数 */
protected:
	static const GUID USB_GUID;				// USBのインターフェースGUID
	


	/* 型 */
public:
	

	

	/* データ受信関連 */
protected:
	iBTL *m_BTL;		// デバイス BTL

	// データを受信するコールバック関数
	typedef void (*RxDataCallback_t)(void *inst, const iBTL::PACKET_t &packet);
	struct RXDATAREG_t{
		void *Instance;
		RxDataCallback_t Callback;
	};
	std::map<int, RXDATAREG_t> m_RxDataCallbacks;

	DEVINFO_t m_DeviceInfo;	// デバイス情報

	std::wstring m_CapabilityList;				// デバイスの持つ機能を格納した文字列
	std::vector<const wchar_t*> m_Capabilities;	// デバイスの持つ機能





	



	/* メンバー */
protected:
	// コンストラクタ
	iDevice(iBTL *btl);

public:
	// デストラクタ
	virtual ~iDevice();

	// デバイスを検索する
	static iDevice* Search(const std::wstring &phy);

private:
	// USBでデバイスを検索
	static iDevice* SearchViaUSB(void);



public:
	// 受信イベントを設定
	void SetRxEvent(HANDLE hevent){
		m_BTL->SetRxEvent(hevent);
	}
	
	// 接続したか
	bool IsConnected(void){
		return m_BTL->IsConnected();
	}

	// リンクが生きているか
	bool IsAlive(void){
		return m_BTL->IsAlive();
	}

	// デバイス情報が更新されたか
	bool IsUpdated(void){
		bool update = m_DeviceInfo.Update;
		m_DeviceInfo.Update = false;
		return update;
	}

	// デバッグ文字列を送信する
	bool TxDebug(std::string &str){
		return m_BTL->TxDebug(str);
	}

	// デバッグ文字列を受信する
	bool RxDebug(void){
		return m_BTL->RxDebug();
	}
	bool RxDebug(std::string &str){
		return m_BTL->RxDebug(str);
	}

	// データを送信
	bool TxData(const iBTL::PACKET_t &packet){
		return m_BTL->Tx(packet);
	}

	// すべてのデータを受信
	void RxDataAll(void);

	// データを受信するコールバック関数を登録
	void RxDataRegister(unsigned int dest, void *inst, RxDataCallback_t func);

	

public:
	// デバイス情報を取得
	virtual void GetDeviceInfo(DEVINFO_t &devinfo){
		devinfo = m_DeviceInfo;
	}

	// デバイスの対応機能を調べる
	bool GetCapability(const wchar_t *cap);




	

public:
	// プロセッサのプログラムを読み込む
	virtual bool LoadProcessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path) = 0;

	// コプロセッサのプログラムを読み込む
	virtual bool LoadCoprocessorFirmware(std::vector<char> &dst_vector, const wchar_t *src_path) = 0;

	// ビットストリームを読み込む


	
	// ログ情報を持つファイル名を取得
	virtual bool GetLogInfo(std::wstring &dst_name) = 0;






private:
	// DTR_DEVICEのコールバック
	static void CallbackDevice(void *inst, const iBTL::PACKET_t &packet);







protected:
	// ハンドルを解放する
	static void SafeClose(HANDLE &h){
		if (h != NULL){
			CloseHandle(h);
			h = NULL;
		}
	}











};
