// メッセージ

#pragma once



#define SPLIT_GROUP(m)		((m) & 0xFF00)
#define SPLIT_MESSAGE(m)	((m) & 0xFF)



// メッセージグループ
enum MGRP_e{
	MGRP_GENERAL	= 1 << 8,	// 一般
	MGRP_FIRMWARE	= 2 << 8,	// ファームウェア
	MGRP_CONFIG		= 3 << 8,	// コンフィグレーション
	MGRP_MOTCOP		= 4 << 8,	// モーターコプロセッサ
	MGRP_FLASH		= 5 << 8,	// フラッシュメモリー
	MGRP_PLOT		= 6 << 8,	// プロット
	MGRP_SIGNAL		= 7 << 8,	// 信号観測
	
	
	MGRP_PDI		= 72 << 8,	// (隠)PDI
	
};

// 送信メッセージID
enum MTX_e{

	MTX_GENERAL_WRITE		= 1,	// データを転送する
	MTX_GENERAL_RUNPACKET	= 10,	// 動作設定を無線パケット形式で送信
	MTX_GENERAL_RUNSETTING	= 11,	// 動作設定を生で送る

	MTX_FIRMWARE_BEGIN		= 1,	// 転送を開始する
	MTX_FIRMWARE_END		= 2,	// 転送を終了する
	MTX_FIRMWARE_WRITE		= 3,	// 書き込む
	MTX_FIRMWARE_READ		= 4,	// 読み込む

	MTX_CONFIG_BEGIN		= 1,	// コンフィグを開始する
	MTX_CONFIG_END			= 2,	// コンフィグを終了する
	MTX_CONFIG_WRITE		= 3,	// 転送する

	MTX_MOTCOP_BEGIN		= 1,	// 転送を開始する
	MTX_MOTCOP_END			= 2,	// 転送を終了する
	MTX_MOTCOP_WRITE		= 3,	// 転送する

	MTX_FLASH_BEGIN			= 1,	// 書き込みを開始する
	MTX_FLASH_END			= 2,	// 書き込みを終了する
	MTX_FLASH_WRITE			= 3,	// 書き込む
	MTX_FLASH_READ			= 4,	// 読み込む
	MTX_FLASH_ERASE			= 5,	// 4KBセクター・64KBブロックを消去する

	MTX_PLOT_GET			= 1,	// プロットデータを要求する
	
	MTX_SIGNAL_START		= 1,	// 観測を開始
	MTX_SIGNAL_STOP			= 2,	// 観測を停止
	MTX_SIGNAL_GET			= 3,	// 観測データを送信を要求
	
	


	MTX_PDI_BEGIN			= 1,	// PDI書き込みを開始
	MTX_PDI_END				= 2,	// PDI書き込みを終了
	MTX_PDI_WRITE			= 3,	// 書き込む
	MTX_PDI_READ			= 4,	// 読み出す
	
	
};

// 受信メッセージID
enum MRX_e{



	MRX_FIRMWARE_COMPLETE	= 101,	// 操作の完了を通知する
	MRX_FIRMWARE_READ		= 102,	// 読み込んだデータを返す

	MRX_CONFIG_COMPLETE		= 101,	// 操作の完了を通知する

	MRX_MOTCOP_COMPLETE		= 101,	// 操作の完了を通知する

	MRX_FLASH_COMPLETE		= 101,	// 操作の完了を通知する
	MRX_FLASH_READ			= 102,	// 読み込んだデータを返す

	MRX_PLOT_OUTPUT			= 101,	// 出力値のプロットを返す
	MRX_PLOT_INPUT			= 102,	// 入力値のプロットを返す
	
	MRX_SIGNAL_STATUS		= 101,	// 観測の状態を通知する
	MRX_SIGNAL_CHANNEL		= 102,	// 返す観測データのチャンネルを通知する
	MRX_SIGNAL_DATA			= 103,	// 観測データを返す
	
	MRX_PDI_STATUS			= 101,	// 状態を通知する
	MRX_PDI_COMPLETE		= 102,	// 操作の完了を通知する
	MRX_PDI_READ			= 103,	// 読み出したデータを返す
	
};







