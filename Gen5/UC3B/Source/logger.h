/**	@file
	@brief ロボットの入出力情報のロギング
*/

#ifndef LOGGER_H_
#define LOGGER_H_

#include "../define.h"

#include "../HAL/Pipe.h"



namespace Logger{
	
	/* システムで使用済みのID */
	enum SYSID_e{
		ID_ERROR= 0,			// 意味は無い
		ID_DELTATIME = 1,		// ms単位の相対時間
		ID_COPTIME = 2,			// ms単位のコプロセッサの絶対時間
		ID_DROP = 3,			// データの欠落の可能性を示す
		
		_ID_USER_ = 32,			// 以降、ユーザーが使用可能なID
		_ID_BYTE_MAX_ = 32,		// IDの最大数(1バイト型)
		_ID_MAX_ = 1024,		// IDの最大数(2,4バイト型)
	};
	enum USERID_e{
		ID_BAT_VOLATGE		= 100,	// バッテリー電圧
		ID_GATE_VOLATGE		= 101,	// ゲート駆動電圧(12V系)
		ID_CAP_VOLTAGE		= 102,	// キャパシタ電圧
		ID_TEMPERATURE		= 110,	// メイン基板温度
		
		ID_BALL_DETECT		= 200,	// ボール検知
		ID_MOTOR1_SENSOR	= 210,	// モーター1のセンサー
		ID_MOTOR2_SENSOR	= 211,	// モーター2のセンサー
		ID_MOTOR3_SENSOR	= 212,	// モーター3のセンサー
		ID_MOTOR4_SENSOR	= 213,	// モーター4のセンサー
		ID_MOTOR5_SENSOR	= 214,	// モーター5のセンサー
		ID_MOTOR1_DUTY		= 220,	// モーター1のデューティ設定
		ID_MOTOR2_DUTY		= 221,	// モーター2のデューティ設定
		ID_MOTOR3_DUTY		= 222,	// モーター3のデューティ設定
		ID_MOTOR4_DUTY		= 223,	// モーター4のデューティ設定
		ID_MOTOR5_DUTY		= 224,	// モーター5のデューティ設定
		ID_MOTOR1_SPEED		= 230,	// モーター1の回転速度
		ID_MOTOR2_SPEED		= 231,	// モーター2の回転速度
		ID_MOTOR3_SPEED		= 232,	// モーター3の回転速度
		ID_MOTOR4_SPEED		= 233,	// モーター4の回転速度
		
		
		
	};
	
	
	
	
	
	
	/* パイプ関連 */
	
	// パイプ情報
	extern const BTT::PIPE_INFO_t Info;
	
	// 開く
	bool Open(void);
	
	// 閉じる
	void Close(void);
	
	// 読み込む
	bool Read(void *data, unsigned int len, unsigned int &read);
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written);
	
	
	
	/* 一般 */
	// クリティカルセクションは関数外で適宜入れること
	
	extern volatile bool m_Opened;
	extern volatile bool m_Dropped;
	extern char m_SendList[];
	
	// 開かれているか
	static inline bool IsOpened(void){
		return m_Opened;
	}
	
	// データをドロップしているおそれがある
	static inline void DataDropping(void){
		m_Dropped = true;
	}
	
	// IDをチェック
	//bool CheckID(unsigned int addr);
	static inline bool CheckID(unsigned int id){
		if (m_Opened == false) return false;
		if (_ID_MAX_ <= id) return false;
		return m_SendList[id / 8] & (1 << (id % 8));
	}
	
	// データを追加
	// 引数にaddrと書いてあるがIDのこと
	bool AddDataByte(unsigned int addr, unsigned char byte);
	bool AddDataHalf(unsigned int addr, unsigned short half);
	bool AddDataWord(unsigned int addr, unsigned long word);
	
	// 時刻を追加
	void AddTime(unsigned int time);
	
	// 生データを追加
	// この関数はパイプが開かれているかチェックしない
	bool AddDataRaw(const unsigned short *data, unsigned int length);
	
	
	
	// データを逆変換
	unsigned int ParseData(const unsigned short *data, unsigned int length);
	
	
	
}



#endif
