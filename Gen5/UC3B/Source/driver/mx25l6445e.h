/**	@file
	@brief SPIフラッシュ MX25L6445Eの制御
*/

#ifndef MX25L6445E_H_
#define MX25L6445E_H_



namespace SPIFlash{
	
	const static bool READ_ONLY		= false;
	
	const static int FLASH_SIZE		= 8 * 1024 * 1024;
	const static int SECTOR_SIZE	= 4096;
	const static int PAGE_SIZE		= 256;
	
	extern volatile bool Implement;
	
	
	
	// 初期化
 	void Init(void);
	
	
	
	/* 内部 */
	
	// 占有権を取得する
	bool IntOpen(void);

	// 占有権を返す
	void IntClose(void);
	
	// 短いコマンドを発行(書き込み系)
	bool IntCommandWrite(int command, const void *data = 0, int length = 0);
	
	// 短いコマンドを発行(読み込み系)
	bool IntCommandRead(int command, void *data, int length);
	
	// ステータスを確認
	int IntReadStatus(void);
	
	// 書き込み・消去の完了を待つ
	bool IntWait(void);
	
	// 消去コマンドを発行
	bool IntErase(int header);
	
	
	/* 外部 */
	
	// 実装されているか
	static inline bool IsImplemented(void){
		return Implement;
	}
	
	// 書き込み・消去の処理中か確認
	bool IsProcessing(void);
	
	// 書き込み・消去の完了を待つ
	bool Wait(void);
	
	// データを書き込む
	bool Write(int address, const void *data, int length);
	
	// データを読み込む
	bool Read(int address, void *data, int length);
	
	
	
	// セクターを消去する
	static inline bool SectorErase(unsigned int sector){
		if (READ_ONLY == true){
			return true;
		}else{
			return IntErase(0x20000000 | ((SECTOR_SIZE * sector) & 0x00FFFFFF));	// 0x20 Sector Erase
		}
	}
	
	// セクターに書き込む
	bool SectorWrite(unsigned int sector, const void *data);
	
	
	
	
}

#endif
