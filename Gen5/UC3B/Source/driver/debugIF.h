/**	@file
	@brief デバッグインターフェース・PDIライター
*/

#ifndef DEBUGIF_H_
#define DEBUGIF_H_

#include "../define.h"
#include "int.h"


namespace nsDebugIF{
	
	// デバッグインターフェースを初期化
	void Init(void);
	
	// 送信PDCA割り込み
	IH OnTxPDCA();
	
	// 書き込み
	void Write(char c);
	
	// 複数データを書き込み
	void Write(const char *s, int len);
	
	// 読み込みを始める
	int BeginRead(const char **s);
	
	// 読み込みを終える
	void EndRead(void);
	
	
	
	namespace PDI{
		static const int PAGE_SIZE	= 256;			// ページサイズ
		static const int FLASH_SIZE	= 36 * 1024;	// 内蔵フラッシュのサイズ
		static const int APP_SIZE	= 32 * 1024;	// APP領域のサイズ
		static const int DFU_SIZE	= 4 * 1024;		// DFU領域のサイズ
		static const int FLASH_PAGES= FLASH_SIZE / PAGE_SIZE;
		static const int APP_PAGES	= APP_SIZE / PAGE_SIZE;
		static const int DFU_PAGES	= DFU_SIZE / PAGE_SIZE;
		
		// PDIモードを開始
		void EnterPDIMode(void);

		// PDIモードを終了
		void ExitPDIMode(void);

		// 少し待つ
		void Delay(int cnt);

		// 自動クロックを動かす
		void RunCLK(void);
		
		// 自動クロックを止める
		void PauseCLK(void);
		
		// PDIで1バイト送る
		void TxFrame(char data);
		
		// PDIでBREAKを送る
		void TxBreak(void);
		
		// 方向を変えるための時間を待つ
		void ChangeDir(void);
		
		// PDIで1バイト受け取る
		bool RxFrame(char *data, int idle);

		// KEY命令を発行
		void KEY(void);

		// LDCS命令を発行
		bool LDCS(int addr, char *data);

		// STCS命令を発行
		void STCS(int addr, char data);

		// LDS命令を発行
		bool LDS(int addr, char *data);

		// STS命令を発行
		void STS(int addr, char data);

		// NVMへのアクセスを開始する
		bool EnterNVM(void);
		
		// NVMへのアクセスを終了する
		bool ExitNVM(void);
		
		// NVM_BUSYを待つ
		bool NVMWait(void);
		
		// NVMでページ書き込み
		bool NVMWritePage(int page, const void *data);
		
		// NVMでフラッシュ読み出し
		bool NVMReadFlash(int addr, void *data, int length);
		
		// NVMでチップイレース
		bool NVMChipErase(void);

		// NVMでヒューズビット書き込み
		bool NVMWriteFuse(int fuse, int byte);

		// NVMでヒューズビット読み込み
		bool NVMReadFuse(int fuse, int *byte);
	}
	
}


#endif
