// メッセージ

#ifndef MESSAGE_ENUM_H_
#define MESSAGE_ENUM_H_



// あて先
namespace DTR{
	enum DTR_e{
		DEVICE		= 0x01,
		DIR			= 0x10,
		FILE		= 0x11,
		PIPE0		= 0x20,
		
	};
}



// 送信メッセージID
namespace MTX{
	enum MTX_e{
		DEVICE_ALIVE		= 0x00,	// リンクが生きていることを通知する
		DEVICE_REBOOT,				// 再起動
		DEVICE_INFO_GET,			// デバイス情報を取得する
		DEVICE_TIME_SET,			// UNIX時間を設定
		
		PIPE_ENUM			= 0x10,	// パイプを列挙
		PIPE_OPEN,					// パイプを開く
		PIPE_CLOSE,					// パイプを閉じる
		PIPE_READ,					// パイプから読み込む
		PIPE_WRITE,					// パイプに書き込む
		PIPE_SEEK,					// パイプをシーク
		
		DIR_ENUM			= 0x20,	// ディレクトリ内を列挙
		DIR_MOVE,					// ディレクトリ・ファイルを移動
		DIR_COPY,					// ディレクトリ・ファイルをコピー(未実装)
		DIR_REMOVE,					// ディレクトリ・ファイルを削除
		DIR_CREATE,					// ディレクトリを作成

		FILE_OPEN			= 0x30,	// ファイルを開く
		FILE_CLOSE,					// ファイルを閉じる
		FILE_READ,					// ファイルから読み込む
		FILE_WRITE,					// ファイルに書き込む
		FILE_SEEK,					// ファイルをシーク


	};
}



// 受信メッセージID
namespace MRX{
	enum MRX_e{
		DEVICE_ALIVE		= 0x00,	// リンクが生きていることを通知する
		DEVICE_INFO_RET		= 0x01,	// デバイス情報を返す
		
		PIPE_ENUM_CLEAR		= 0x10,	// パイプの一覧をクリアする
		PIPE_ENUM_RET,				// パイプの一覧を返す
		PIPE_OPEN_RET,				// パイプを開いた結果を返す
		PIPE_READ_RET,				// パイプを読み込んだ結果を返す
		PIPE_READ_ERROR,			// パイプを読み込んでエラーが起きた
		PIPE_WRITE_RET,				// パイプに書き込んだ結果を返す
		PIPE_SEEK_RET,				// パイプをシークした結果を返す

		DIR_ENUM_CLEAR		= 0x20,	// ディレクトリの内容をクリアする
		DIR_ENUM_RET,				// ディレクトリの内容を返す
		DIR_ANY_ERROR,				// ディレクトリ・ファイルの操作でエラーが起きた
		
		FILE_OPEN_RET		= 0x30,	// ファイルを開いた結果を返す
		FILE_READ_RET,				// ファイルを読み込んだ結果を返す
		FILE_READ_ERROR,			// ファイルを読み込んでエラーが起きた
		FILE_WRITE_RET,				// ファイルに書き込んだ結果を返す
		FILE_SEEK_RET,				// ファイルをシークした結果を返す
		
		
		
		

	};
}





#endif
