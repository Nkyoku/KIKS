/**	@file
	@brief USBメインタスク
*/

#ifndef USB_TASK_H_
#define USB_TASK_H_

#include "define.h"



// リトルエンディアンに変換
#define LE16(v) (unsigned short)__builtin_bswap_16(v)
#define LE32(v) (unsigned long)__builtin_bswap_32(v)
#define LE64(v) ((unsigned long long)__builtin_bswap_32(v) << 32)

// ビッグエンディアンに変換
#define BE16(v) (unsigned short)__builtin_bswap_16(v)
#define BE32(v) (unsigned long)__builtin_bswap_32(v)
#define BE64(v) (unsigned long)__builtin_bswap_32((unsigned long long)(v) >> 32)




namespace USBTask{
	
	
	enum TASK_FLAG_e{
		TASK_FLAG_ALIVE = 1,	// タスクは生きている
		TASK_FLAG_KILLREQ = 2,	// タスクに終了を要求
	};
	extern volatile int m_TaskFlag;
	
	
	
	// USBタスクの終了を要求
	static inline void RequestExit(void){
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KILLREQ);
	}
	
	// USBタスクが起動しているか
	static inline bool IsAlive(void){
		return m_TaskFlag & TASK_FLAG_ALIVE;
	}
	
	
	
	// タスク
	void Task(void *param);
	
	// メッセージを送信
	bool Transmit(void);
	
	
	
	// デバイス関連のメッセージを処理
	void ProcDevice(void);
	
	// パイプ関連のメッセージを処理
	void ProcPipe(unsigned int link_index);
	
	// ディレクトリ関連のメッセージを処理
	void ProcDir(void);
	
	// ファイル関連のメッセージを処理
	void ProcFile(unsigned int link_index);
	
	
	
	// パイプをリセット
	void ResetPipes(void);
	
	// ファイルをすべて閉じる
	void CloseFiles(void);
	
	// ドライブ情報を送信
	void SendDriveInfo(int letter);
	
	
	
	
	
	
}


#endif
