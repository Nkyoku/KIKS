// BTLで送られるデータの構造体

#ifndef MESSAGE_STRUCT_H_
#define MESSAGE_STRUCT_H_

#ifdef _WIN32
#define PACK
#pragma pack(push, 1)
#endif



namespace BTT{
	
	// 起動モード
	enum BOOTMODE_e{
		BOOT_DFU = 1,		// DFUモードで起動
		BOOT_APP,			// APPモードで起動
		BOOT_SAFE_APP		// セーフAPPモードで起動
	};
	
	// DEVICE_REBOOT
	struct DEVICE_REBOOT_t{
		char BootMode;				// 起動モード
	};
	
	// DEVICE_INFO_RET
	static const int DEVICE_INFO_RET_NAME_LENGTH = 32;
	static const int DEVICE_INFO_RET_TIME_LENGTH = 16;
	struct DEVICE_INFO_RET_t{
		char DevName[32];			// デバイス名(ASCII)
		char MacName1[32];			// マシン名1(ASCII)
		char MacName2[32];			// マシン名2(ASCII)
		char FirmDate[16];			// ファームウェアの日付(ASCII)
		char FirmTime[16];			// ファームウェアの時刻(ASCII)
		unsigned char Generation;	// ジェネレーション
		unsigned char Revision;		// リビジョン(A→1)
		unsigned char MachineID;	// マシンID
		unsigned char PipeLinks;	// パイプの数
		char Capabilities[];		// 機能の列挙(ASCII)
	} PACK;
	
	// DEVICE_TIME_SET
	struct DEVICE_TIME_SET_t{
		unsigned long long Time;	// UNIX時間
	};




	/*** パイプ ***/

	// アクセス修飾子
	enum MODIFIERS_e{
		READABLE	= 1,	// 読み取り可能で開く
		WRITABLE	= 2,	// 書き込み可能で開く
		SEEKABLE	= 4,	// シーク可能で開く (パイプのみ)
		OPEN		= 8,	// ファイルが無かったら作成する。すでにファイルがあったら開く (ファイルのみ)
		CREATE		= 16,	// ファイルが無かったら作成する。すでにファイルがあったらサイズを0にして開く (ファイルのみ)
		
		
		RW			= READABLE | WRITABLE,
		RWS			= READABLE | WRITABLE | SEEKABLE,
		RS			= READABLE | SEEKABLE,
		WS			= WRITABLE | SEEKABLE
		
	};
	
	// PIPE_ENUM_RETで返すPIPE_INFO
	static const int PIPE_INFO_NAME_LENGTH = 16;
	struct PIPE_INFO_t{
		char PipeName[16];			// パイプ名(ASCII)
		unsigned long PipeSize;		// サイズ(0ならシーク不可)
		unsigned short WriteUnit;	// 書き込み単位(バイト数)
		unsigned short Modifiers;	// アクセス修飾子
	} PACK;
	
	// PIPE_OPEN
	static const int PIPE_OPEN_NAME_LENGTH = 16;
	struct PIPE_OPEN_t{
		char PipeName[16];			// パイプ名(ASCII)
		unsigned short Modifiers;	// アクセス修飾子
	} PACK;

	// PIPE_OPEN_RET
	struct PIPE_OPEN_RET_t{
		char Status;				// ステータス(0:失敗 1:成功)
	} PACK;

	// PIPE_READ
	struct PIPE_READ_t{
		unsigned long Pointer;		// シークポインタの確認
		unsigned long Length;		// 読み出すバイト数
	} PACK;

	// PIPE_READ_RET
	struct PIPE_READ_RET_t{
		unsigned long Pointer;		// シークポインタの確認
		char Data[0];				// データ
	} PACK;

	// PIPE_WRITE
	struct PIPE_WRITE_t{
		unsigned long Pointer;		// シークポインタの確認
		char Data[0];				// データ
	} PACK;

	// PIPE_WRITE_RET
	struct PIPE_WRITE_RET_t{
		unsigned long Pointer;		// シークポインタの確認
	} PACK;
	
	// PIPE_SEEK
	struct PIPE_SEEK_t{
		unsigned long Pointer;		// シークポインタの設定
	} PACK;

	// PIPE_SEEK_RET
	struct PIPE_SEEK_RET_t{
		char Status;				// ステータス(0:失敗 1:成功)
	} PACK;





	/*** ディレクトリ ***/

	/*// DIR_ENUM, DIR_ENUM_CLEAR, DIR_MOVE, DIR_REMOVE, DIR_CREATE
	struct DIR_ENUM_t{
		char Path[0];				// ディレクトリのパス(UTF-8)
									// 2つのパスが含まれる場合はコロンで区切られる
	} PACK;*/

	// DIR_ENUM_RET
	struct DIR_ENUM_RET_t{
		unsigned long long Usage;	// ファイルサイズ (ドライブ:ディスク使用量)
		unsigned long long Size;	// ファイルサイズ (ドライブ:ディスク容量)
		unsigned long Date;			// 更新日時
		char Letter;				// ゼロ (ドライブ:ドライブレター)
		char DirSFNFlag;			// ディレクトリか？ (ドライブ:SFNを使用しているか？)
		char Name[0];				// 名前(UTF-8) (ドライブ:ドライブレター+名前)
	} PACK;
	





	/*** ファイル ***/

	// FILE_OPEN
	struct FILE_OPEN_t{
		unsigned short Modifiers;	// アクセス修飾子
		char Name[0];				// ファイル名(UTF-8)
	} PACK;
	
	// FILE_READ
	struct FILE_READ_t{
		unsigned long long Pointer;	// シークポインタの確認
		unsigned long Length;		// 読み出すバイト数
	} PACK;

	// FILE_WRITE
	struct FILE_WRITE_t{
		unsigned long long Pointer;	// シークポインタの確認
		char Data[0];				// データ
	} PACK;

	// FILE_SEEK
	struct FILE_SEEK_t{
		unsigned long long Pointer;	// シークポインタ
	} PACK;

	// FILE_OPEN_RET, FILE_WRITE_RET, FILE_SEEK_RET
	struct FILE_ANY_RET_t{
		unsigned long long Pointer;	// シークポインタ
		unsigned long long Size;	// ファイルサイズ
		char Status;				// ステータス(0:失敗 1:成功)
	} PACK;

	// FILE_READ_RET
	struct FILE_READ_RET_t{
		unsigned long long Pointer;	// シークポインタ
		char Data[0];				// データ
	} PACK;

















}



#ifdef _WIN32
#pragma pack(pop)
#endif



#endif
