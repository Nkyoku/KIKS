// ファイルツリーの表示

#ifndef TERMINAL_FILE_H
#define TERMINAL_FILE_H

#include <QObject>
#include <QDialog>
#include <QTreeWidget>
#include <QProgressBar>
#include <QMenu>
#include <QString>
#include <QPoint>

#include <string>
#include <vector>
#include <map>




class TerminalFile : public QObject{
Q_OBJECT
	
	/* 型 */
private:
	// ディスク情報(仮宣言)
	struct Disk_t;

	// ファイル情報
	enum File_e{
		File_Letter,		// int		: ドライブレター(大文字)
		File_Directory,		// bool		: ディレクトリである
		File_Expanded,		// bool		: 展開されたことがある

	};
	
	// ドライブ情報
	enum Drive_e{
		Drive_Letter,		// int		: ドライブレター(大文字)
		Drive_UseSFN,		// bool		: 8:3ファイル名を使用する
		Drive_Usage,		// uint		: 使用量(バイト)
		Drive_Size,			// uint		: 容量(バイト)
		Drive_Expanded,		// bool		: 展開されたことがある



	};





	/* メンバー */
private:
	QProgressBar *m_UsageBar;
	QTreeWidget *m_Tree;
	QTreeWidgetItem *m_CurrentItem;		// カレントアイテム
	QTreeWidgetItem *m_SelectedItem;	// 選択中のアイテム
	QTreeWidgetItem *m_ClipboardItem;	// クリップボードにあるアイテム

	QMenu *m_FileMenu, *m_DriveMenu;
	QMenu *m_FileNewMenu, *m_DriveNewMenu;
	QAction *m_FileTransToAction, *m_FileTransFromAction, *m_FileUpdateAction, *m_FileCutAction, *m_FileCopyAction, *m_FilePasteAction, *m_FileDeleteAction, *m_FileRenameAction;
	QAction *m_DriveTransToAction, *m_DrivePasteAction, *m_DriveFormatAction;

	bool m_AllowDirRead, m_AllowDirWrite;	// ディレクトリ読み書きの許可
	bool m_AllowFileRead, m_AllowFileWrite;	// ファイル読み書きの許可

	bool m_CutOrCopy;					// false:切り取り true:コピー
	char m_SelectedDriveLetter;			// 選択中の項目が含まれるドライブレター(大文字)
	QString m_PreviousName;				// リネーム前の名前を保持する
	
	std::map<char, QTreeWidgetItem*> m_DiskMap;
	
	

	
	

public:
	// コンストラクタ
	TerminalFile(QTreeWidget *tree, QProgressBar *usage);
	
	// デストラクタ
	~TerminalFile();

	
	
	





private:
	// 使用量バーを更新
	void UpdateUsage(void);
	
	// 日時を文字列に変換
	const wchar_t* ConvertDate(unsigned int date);

	// 日時を取得
	unsigned int GetDate(void);

	// パスを作る
	const wchar_t* MakePath(QTreeWidgetItem *item, bool &result, QTreeWidgetItem *loop_check = nullptr);

	// ドライブレターを取得
	char GetDriveLetter(QTreeWidgetItem *item);

	// 適切なファイル名に直す
	bool CorrectionName(QTreeWidgetItem *parent, QTreeWidgetItem *item, QString &q_name, bool ask_overwrite = false);




private slots:
	// コンテキストメニューを開く
	void showContextMenu(const QPoint &point);

	// ツリーを更新
	void updateTree(bool force_update = true);

	// ファイル・ディレクトリの切り取り
	void cutFileOrDir(void);

	// ファイル・ディレクトリのコピー
	void copyFileOrDir(void);

	// ファイル・ディレクトリの貼り付け
	void pasteFileOrDir(void);

	// ファイル・ディレクトリの削除
	void deleteFileOrDir(void);

	// ファイル・ディレクトリのリネーム
	void renameFileOrDir(void);

	// ファイル・ディレクトリのフォーマット
	void formatDisk(void);

	// ディレクトリの作成
	void createDir(void);

	// デバイスへ転送
	void transfarTo(void);

	// デバイスから転送
	void transfarFrom(void);



	// アイテムが選択された
	void itemSelectionChanged(void);

	// アイテムが変更された
	void itemChanged(QTreeWidgetItem *item, int column);

	// アイテムが展開された
	void itemExpanded(QTreeWidgetItem *item);



public slots:
	// 有効にする
	void enable(bool enable, bool idle = false, bool dir_r = false, bool dir_w = false, bool file_r = false, bool file_w = false);

	// ツリーを初期化
	void initTree(const std::wstring &path = L"");

	// ドライブを追加
	void addDrive(char letter, const std::wstring &name, bool sfn, unsigned long long size);

	// ドライブの使用量が変化した
	void changeDriveStatus(char letter, unsigned long long usage);

	// カレントアイテムを移動する
	void moveToItem(const std::wstring &wpath);

	// ファイル・ディレクトリをカレントアイテムへ追加
	void addItem(const std::wstring &name, unsigned long long size, bool dir, unsigned int date);

	// カレントアイテムを上の階層へ
	void moveUp(void);

	// ファイルが更新された
	void changeFile(std::wstring *path, unsigned long long size);








	


signals:
	// ツリーを更新する
	void updateRequest(const std::wstring &path = L"");
	
	// ファイル・ディレクトリの移動・リネーム
	void moveRequest(const std::wstring &dst_path, const std::wstring &src_path);

	// ファイル・ディレクトリのコピー
	void copyRequest(const std::wstring &dst_path, const std::wstring &src_path);

	// ファイル・ディレクトリの削除
	void deleteRequest(const std::wstring &path);

	// ディレクトリの作成
	void mkdirRequest(const std::wstring &path);

	// ファイルをデバイスへ転送
	void transfarToDevice(std::wstring *dst_path, std::wstring *src_path);

	// ファイルをデバイスから転送
	void transfarFromDevice(std::wstring *dst_path, std::wstring *src_path);
	
	


};

#endif // TERMINAL_FILE_H
