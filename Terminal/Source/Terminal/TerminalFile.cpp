// ファイルツリーの表示

#include "TerminalFile.h"
#include "trace.h"
#include "convqstr.h"

#include <Windows.h>
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <algorithm>

#include <QList>
#include <QStringList>
#include <QMessageBox>
#include <QFileDialog>
#include <QInputDialog>
#include <QFileIconProvider>
#include <QCursor>
#include <QVariant>






// コンストラクタ
TerminalFile::TerminalFile(QTreeWidget *tree, QProgressBar *usage) :
	m_Tree(tree), m_UsageBar(usage), m_CurrentItem(nullptr), m_SelectedItem(nullptr), m_ClipboardItem(nullptr),
	m_AllowDirRead(false), m_AllowDirWrite(false), m_AllowFileRead(false), m_AllowFileWrite(false)
{
	// 初期化
	initTree();

	

	// シグナルを接続
	connect(m_Tree, SIGNAL(customContextMenuRequested(const QPoint &)), this, SLOT(showContextMenu(const QPoint &)));
	connect(m_Tree, SIGNAL(itemSelectionChanged()), this, SLOT(itemSelectionChanged()));
	connect(m_Tree, SIGNAL(itemChanged(QTreeWidgetItem *, int)), this, SLOT(itemChanged(QTreeWidgetItem *, int)));
	connect(m_Tree, SIGNAL(itemExpanded(QTreeWidgetItem*)), this, SLOT(itemExpanded(QTreeWidgetItem*)));
	//connect(m_Tree, SIGNAL(itemActivated(QTreeWidgetItem*, int)), this, SLOT(itemActivated(QTreeWidgetItem*, int)));


	// ファイルメニューの作成
	QFileIconProvider icon_provider;
	m_FileMenu = new QMenu(m_Tree);
	m_FileUpdateAction = m_FileMenu->addAction(WCharToQString(L"更新(&R)"), this, SLOT(updateTree()));
	m_FileMenu->addSeparator();
	m_FileTransToAction = m_FileMenu->addAction(WCharToQString(L"デバイスへ転送"), this, SLOT(transfarTo()));
	m_FileTransFromAction = m_FileMenu->addAction(WCharToQString(L"デバイスから転送"), this, SLOT(transfarFrom()));
	m_FileMenu->addSeparator();
	m_FileCutAction = m_FileMenu->addAction(WCharToQString(L"切り取り(&T)"), this, SLOT(cutFileOrDir()));
	m_FileCopyAction = m_FileMenu->addAction(WCharToQString(L"コピー(&C)"), this, SLOT(copyFileOrDir()));
	m_FilePasteAction = m_FileMenu->addAction(WCharToQString(L"貼り付け(&P)"), this, SLOT(pasteFileOrDir()));
	m_FileMenu->addSeparator();
	m_FileDeleteAction = m_FileMenu->addAction(WCharToQString(L"削除(&D)"), this, SLOT(deleteFileOrDir()));
	m_FileRenameAction = m_FileMenu->addAction(WCharToQString(L"名前の変更(&M)"), this, SLOT(renameFileOrDir()));
	m_FileMenu->addSeparator();
	m_FileNewMenu = m_FileMenu->addMenu(WCharToQString(L"新規作成(&X)"));
	m_FileNewMenu->addAction(icon_provider.icon(QFileIconProvider::Folder), WCharToQString(L"ディレクトリ(&D)"), this, SLOT(createDir()));

	// ドライブメニューの表示
	m_DriveMenu = new QMenu(m_Tree);
	m_DriveMenu->addAction(WCharToQString(L"更新(&R)"), this, SLOT(updateTree()));
	m_DriveMenu->addSeparator();
	m_DriveTransToAction = m_DriveMenu->addAction(WCharToQString(L"デバイスへ転送"), this, SLOT(transfarTo()));
	m_DriveMenu->addSeparator();
	m_DrivePasteAction = m_DriveMenu->addAction(WCharToQString(L"貼り付け(&P)"), this, SLOT(pasteFileOrDir()));
	m_DriveMenu->addSeparator();
	m_DriveFormatAction = m_DriveMenu->addAction(WCharToQString(L"フォーマット(&A)"), this, SLOT(formatDisk()));
	m_DriveMenu->addSeparator();
	m_DriveNewMenu = m_DriveMenu->addMenu(WCharToQString(L"新規作成(&X)"));
	m_DriveNewMenu->addAction(icon_provider.icon(QFileIconProvider::Folder), WCharToQString(L"ディレクトリ(&D)"), this, SLOT(createDir()));
	
	m_DriveFormatAction->setEnabled(false);




	
	/*
	addDrive('0', L"SPIFlash0", true, 8 * 1024 * 1024);
	addItem(L"bin", 0, true, 0);
	addItem(L"text1.txt", 1000, false, 0);
	moveUp();
	addItem(L"text2.txt", 10000, false, 0);
	moveUp();
	moveUp();
	addItem(L"dev", 0, true, 0);
	addItem(L"text3.txt", 1000, false, 0);
	moveUp();
	addItem(L"text4.txt", 1000, false, 0);
	moveUp();
	addItem(L"text5.txt", 1000, false, 0);
	
	addDrive('1', L"SPIFlash1", false, 128 * 1024 * 1024);
	addItem(L"etc", 0, true, 0);
	addItem(L"binary1.bin", 1000, false, 0);
	moveUp();
	moveUp();
	addItem(L"log", 0, true, 0);
	addItem(L"hogehoge", 0, true, 0);
	addItem(L"hoge_log1.log", 1000, false, 0);
	moveUp();
	addItem(L"hoge_log2.log", 3000, false, 0);
	moveUp();
	moveUp();
	addItem(L"log1.log", 1000, false, 0);
	moveUp();
	addItem(L"log2.log", 1000, false, 0);
	moveUp();
	addItem(L"log3.log", 1000, false, 0);
	
	changeDriveStatus(L'1', 9 * 1024 * 1024);
	changeDriveStatus(L'0', 2 * 1024 * 1024);
	changeDriveStatus(L'A', 1 * 1024 * 1024);

	moveToItem(L"0:/dev/");
	addItem(L"folder0", 0, true, 0);
	addItem(L"file0.emp", 0, false, 3137147141);
	moveUp();
	moveUp();
	addItem(L"folder22", 0, true, 0);

	initTree(L"1:/");//*/



}

// デストラクタ
TerminalFile::~TerminalFile(){

}

// 使用量バーを更新
void TerminalFile::UpdateUsage(void){
	if (m_SelectedDriveLetter != '\0'){
		QTreeWidgetItem *item = nullptr;
		item = m_DiskMap[m_SelectedDriveLetter];
		if (item != nullptr){
			unsigned long long size_in_b, usage_in_b;
			unsigned int size_view, usage_view;
			size_in_b = item->data(Drive_Size, Qt::UserRole).toULongLong();
			usage_in_b = item->data(Drive_Usage, Qt::UserRole).toULongLong();
			if (104857600 <= size_in_b){
				// MB表示
				size_view = (size_in_b + 1048575) / 1048576;
				usage_view = (usage_in_b + 1048575) / 1048576;
				m_UsageBar->setFormat("%vMB/%mMB Used");
			}else{
				// KB表示
				size_view = (size_in_b + 1023) / 1024;
				usage_view = (usage_in_b + 1023) / 1024;
				m_UsageBar->setFormat("%vKB/%mKB Used");
			}
			m_UsageBar->setTextVisible(true);
			m_UsageBar->setMaximum(size_view);
			m_UsageBar->setValue(usage_view);
			return;
		}
	}

	// 選択なし
	m_UsageBar->setTextVisible(false);
	m_UsageBar->setMaximum(0);
	m_UsageBar->setValue(-1);
	m_UsageBar->setMaximum(1);	// 何故かこの操作で表示が消せる。おそらくQtのバグ
}

// 日時を文字列に変換
const wchar_t* TerminalFile::ConvertDate(unsigned int date){
	static wchar_t output[32];
	_snwprintf_s(output, 32, L"%d/%02d/%02d %02d:%02d",
		((date >> 25) & 0x7F) + 1980,
		(date >> 21) & 0xF,
		(date >> 16) & 0x1F,
		(date >> 11) & 0x1F,
		(date >> 5) & 0x3F/*,
		(date << 1) & 0x3F*/);
	return output;
}

// 日時を取得
unsigned int TerminalFile::GetDate(void){
	SYSTEMTIME systime;
	GetSystemTime(&systime);
	return	  ((systime.wYear - 1980) << 25)
			| ((systime.wMonth & 0xF) << 21)
			| ((systime.wDay & 0x1F) << 16)
			| ((systime.wHour & 0x1F) << 11)
			| ((systime.wMinute & 0x3F) << 5)
			| ((systime.wSecond & 0x3F) >> 1);
}

// パスを作る
const wchar_t* TerminalFile::MakePath(QTreeWidgetItem *item, bool &result, QTreeWidgetItem *loop_check){
	static std::wstring output;
	static std::vector<QTreeWidgetItem*> item_list;
	
	result = false;
	
	item_list.clear();
	while((item != nullptr) && (item != loop_check)){
		item_list.push_back(item);
		item = item->parent();
		if (item == nullptr){
			result = true;
		}
	}
	if (result == false) return L"";

	// ツリーをルートから辿ってパスを作る
	int start = item_list.size() - 1;
	output.assign(L" :");
	output[0] = item_list[start]->data(Drive_Letter, Qt::UserRole).toInt();
	for(int cnt = start - 1; 0 <= cnt; cnt--){
		output.append(L"\\");
		output.append(QStringToWString(item_list[cnt]->text(0)));
	}

	return output.c_str();
}

// ドライブレターを取得
char TerminalFile::GetDriveLetter(QTreeWidgetItem *item){
	if (item->parent() == nullptr){
		return item->data(Drive_Letter, Qt::UserRole).toInt();
	}else{
		return item->data(File_Letter, Qt::UserRole).toInt();
	}
}



// コンテキストメニューを開く
void TerminalFile::showContextMenu(const QPoint &point){
	QTreeWidgetItem *item = m_Tree->itemAt(point);
	m_SelectedItem = item;
	if (item == nullptr) return;

	if (item->parent() == nullptr){
		// ドライブ
		m_DriveTransToAction->setVisible(m_AllowFileWrite);
		m_DrivePasteAction->setVisible(m_AllowDirWrite & (m_ClipboardItem != nullptr));
		m_DriveFormatAction->setVisible(m_AllowDirWrite);
		m_DriveNewMenu->menuAction()->setVisible(m_AllowDirWrite);

		m_DriveMenu->exec(QCursor::pos());
	}else{
		// ファイル・ディレクトリ
		bool dir = item->data(File_Directory, Qt::UserRole).toBool();
		bool haschild = item->childCount() != 0;
		m_FileUpdateAction->setVisible(dir);
		m_FileTransToAction->setVisible(m_AllowFileWrite);
		m_FileTransFromAction->setVisible(!dir & m_AllowFileRead);
		m_FileCutAction->setVisible(m_AllowDirWrite);
		m_FileCopyAction->setVisible(false);	// コピーは未実装
		m_FilePasteAction->setVisible(m_AllowDirWrite & (m_ClipboardItem != nullptr));
		m_FileDeleteAction->setVisible(m_AllowDirWrite);
		m_FileDeleteAction->setDisabled(haschild);
		m_FileRenameAction->setVisible(m_AllowDirWrite);
		m_FileNewMenu->menuAction()->setVisible(m_AllowDirWrite);

		m_FileMenu->exec(QCursor::pos());
	}
}

// ツリーを更新
void TerminalFile::updateTree(bool force_update){
	if (m_AllowDirRead == false) return;

	QTreeWidgetItem *item = m_SelectedItem;
	if (item == nullptr) return;
	if (item->parent() == nullptr){
		// ドライブ
		if ((force_update == true) || (item->data(Drive_Expanded, Qt::UserRole).toBool() == false)){
			item->setData(Drive_Expanded, Qt::UserRole, QVariant(true));
			item->setChildIndicatorPolicy(QTreeWidgetItem::DontShowIndicatorWhenChildless);
			bool result;
			std::wstring path(MakePath(item, result));
			if (result == true){
				Trace(L"updateRequest '%s'", path.c_str());
				emit updateRequest(path);
			}
		}
	}else{
		if (item->data(File_Directory, Qt::UserRole).toBool() == true){
			// ディレクトリ
			if ((force_update == true) || (item->data(File_Expanded, Qt::UserRole).toBool() == false)){
				item->setData(File_Expanded, Qt::UserRole, QVariant(true));
				item->setChildIndicatorPolicy(QTreeWidgetItem::DontShowIndicatorWhenChildless);
				bool result;
				std::wstring path(MakePath(item, result));
				if (result == true){
					Trace(L"updateRequest '%s'", path.c_str());
					emit updateRequest(path);
				}
			}
		}
	}
}

// ファイル・ディレクトリの切り取り
void TerminalFile::cutFileOrDir(void){
	//Trace(L"Cut");
	m_CutOrCopy = false;
	m_ClipboardItem = m_SelectedItem;
}

// ファイル・ディレクトリのコピー
void TerminalFile::copyFileOrDir(void){
	//Trace(L"Copy");
	m_CutOrCopy = true;
	m_ClipboardItem = m_SelectedItem;
}

// ファイル・ディレクトリの貼り付け
void TerminalFile::pasteFileOrDir(void){
	if (m_AllowDirWrite == false) return;

	//Trace(L"Paste");
	bool result;
	std::wstring src_path, dst_path;

	// 貼り付け元のパスを作る
	src_path.assign(MakePath(m_ClipboardItem, result));
	if (result == false){
		QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"貼り付けできません。"));
	}else{
		// 貼り付け先がファイルだったら、親のディレクトリを対象にする
		QTreeWidgetItem *dst_item = m_SelectedItem;
		if (dst_item->parent() != nullptr){
			if (dst_item->data(File_Directory, Qt::UserRole).toBool() == false){
				dst_item = dst_item->parent();
			}
		}
		
		// ドライブレターを比較
		if (GetDriveLetter(m_ClipboardItem) != GetDriveLetter(dst_item)){
			QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"異なるドライブには移動できません。"));
		}else{
			// 名前が重複していないかチェック
			QString q_src_name = m_ClipboardItem->text(0);
			int child_count = dst_item->childCount();
			for(int cnt = 0; cnt < child_count; cnt++){
				if (QString::compare(q_src_name, dst_item->child(cnt)->text(0), Qt::CaseInsensitive) == 0){
					result = false;
					break;
				}
			}
			if (result == false){
				QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"貼り付け先に同名のファイルが存在します。"));
			}else{
				// 貼り付け先のパスを作る
				dst_path.assign(MakePath(dst_item, result, m_ClipboardItem));
				if (result == false){
					QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"貼り付けできません。"));
				}else{
					// dst_pathにsrc_pathのファイル・ディレクトリ名を付加
					dst_path.append(L"\\");
					dst_path.append(QStringToWString(m_ClipboardItem->text(0)));
	
					// リクエストを送信
					if (m_CutOrCopy == false){
						Trace(L"moveRequest '%s' <- '%s'", dst_path.c_str(), src_path.c_str());
						emit moveRequest(dst_path, src_path);
	
						// アイテムを移動
						int index = m_ClipboardItem->parent()->indexOfChild(m_ClipboardItem);
						m_ClipboardItem->parent()->takeChild(index);
						dst_item->addChild(m_ClipboardItem);
					}else{
						// コピーは未実装
						Trace(L"copyRequest '%s' <- '%s'", dst_path.c_str(), src_path.c_str());
						//emit copyRequest(dst_path, src_path);
					}
				}
			}
		}
	}
	
	m_ClipboardItem = nullptr;
}

// ファイル・ディレクトリの削除
void TerminalFile::deleteFileOrDir(void){
	if (m_AllowDirWrite == false) return;

	//Trace(L"Delete");
	bool result;
	std::wstring path;
	path.assign(MakePath(m_SelectedItem, result));
	if (result == false) return;

	Trace(L"deleteRequest '%s'", path.c_str());
	emit deleteRequest(path);

	// アイテムを削除
	int index = m_SelectedItem->parent()->indexOfChild(m_SelectedItem);
	m_SelectedItem->parent()->takeChild(index);
	delete m_SelectedItem;

	m_CurrentItem = nullptr;
}

// ファイル・ディレクトリのリネーム
void TerminalFile::renameFileOrDir(void){
	//Trace(L"Rename");
	if (m_SelectedItem == nullptr) return;
	if (~m_SelectedItem->flags() & Qt::ItemIsEditable) return;
	m_PreviousName = m_SelectedItem->text(0);
	m_Tree->editItem(m_SelectedItem, 0);
}

// ファイル・ディレクトリのフォーマット
void TerminalFile::formatDisk(void){
	Trace(L"Format");
}

// ディレクトリの作成
void TerminalFile::createDir(void){
	if (m_AllowDirWrite == false) return;

	QTreeWidgetItem *parent = m_SelectedItem;
	
	if (parent == nullptr) return;

	if (parent->parent() != nullptr){
		if (parent->data(File_Directory, Qt::UserRole).toBool() == false){
			parent = parent->parent();
		}
	}
	
	bool result;
	QString q_name = QInputDialog::getText(m_Tree, tr("File"), WCharToQString(L"作成するディレクトリ名を入力してください。"), QLineEdit::Normal, tr("NEW_DIR"), &result);
    if ((result == true) && !q_name.isEmpty()){
		// 名前を訂正
		if (CorrectionName(parent, nullptr, q_name) == true){
			bool result;
			std::wstring path(MakePath(parent, result));
			if (result == true){
				std::wstring name = QStringToWString(q_name);
				path.append(L"\\");
				path.append(name);

				// MKDIRリクエストを送る
				Trace(L"mkdirRequest '%s'", path.c_str());
				emit mkdirRequest(path);

				// ディレクトリを作成
				QTreeWidgetItem *back = m_CurrentItem;
				m_CurrentItem = parent;
				addItem(name, 0, true, GetDate());
				m_CurrentItem = back;
			}
		}
	}
}

// デバイスへ転送
void TerminalFile::transfarTo(void){
	if (m_AllowDirWrite == false) return;

	// 転送先がファイルだったら、親のディレクトリを対象にする
	QTreeWidgetItem *dst_item = m_SelectedItem;
	if (dst_item->parent() != nullptr){
		if (dst_item->data(File_Directory, Qt::UserRole).toBool() == false){
			dst_item = dst_item->parent();
		}
	}

	// 転送先のパスを作る
	bool result;
	std::wstring src_path, dst_path;
	dst_path.assign(MakePath(dst_item, result));
	if (result == true){
		// ダイアログを開く
		QString title = CharToQString("転送するファイルを選択してください。");
		QString select = QFileDialog::getOpenFileName(m_Tree, title, QDir::currentPath());
		if (select.isEmpty() == false){
			// 転送先のパスにファイル名を加える
			src_path = QStringToWString(select);
			wchar_t file_name[MAX_PATH], file_ext[MAX_PATH], file_name_ext[MAX_PATH];
			if (_wsplitpath_s(src_path.c_str(), nullptr, 0, nullptr, 0, file_name, MAX_PATH, file_ext, MAX_PATH) == 0){
				if (_wmakepath_s(file_name_ext, MAX_PATH, nullptr, nullptr, file_name, file_ext) == 0){
					// 転送先のファイル名を指定
					QString q_dst_name = WCharToQString(file_name_ext);
					q_dst_name = QInputDialog::getText(m_Tree, tr("File"), WCharToQString(L"転送先のファイル名を入力してください。"), QLineEdit::Normal, q_dst_name, &result);
					if ((result == true) && !q_dst_name.isEmpty()){
						if (CorrectionName(dst_item, nullptr, q_dst_name, true) == true){
							dst_path.append(L"\\");
							dst_path.append(QStringToWString(q_dst_name));

							// 送信
							std::wstring *p_dst_path = new std::wstring(dst_path);
							std::wstring *p_src_path = new std::wstring(src_path);
							emit transfarToDevice(p_dst_path, p_src_path);
							// p_dst_pathとp_src_pathの始末は送信先がやる
						}
					}
				}
			}
		}
	}
}

// デバイスから転送
void TerminalFile::transfarFrom(void){
	if (m_AllowDirRead == false) return;

	QTreeWidgetItem *src_item = m_SelectedItem;
	if (src_item->parent() == nullptr) return;
	if (src_item->data(File_Directory, Qt::UserRole).toBool() == true) return;

	// 転送元のパスを作る
	bool result;
	std::wstring src_path, dst_path;
	src_path.assign(MakePath(src_item, result));
	if (result == true){
		// ダイアログを開く
		QString title = CharToQString("保存するファイルを指定してください。");
		QString select = QFileDialog::getSaveFileName(m_Tree, title, QDir::currentPath());
		if (select.isEmpty() == false){
			dst_path = QStringToWString(select);

			// 送信
			std::wstring *p_dst_path = new std::wstring(dst_path);
			std::wstring *p_src_path = new std::wstring(src_path);
			emit transfarFromDevice(p_dst_path, p_src_path);
			// p_dst_pathとp_src_pathの始末は送信先がやる
		}
	}
}





// 有効にする
void TerminalFile::enable(bool enable, bool idle, bool dir_r, bool dir_w, bool file_r, bool file_w){
	m_Tree->setEnabled(enable & idle);
	m_UsageBar->setEnabled(enable);
	
	m_AllowDirRead = dir_r;
	m_AllowDirWrite = dir_r & dir_w;
	m_AllowFileRead = file_r;
	m_AllowFileWrite = file_r & file_w;
}

// ツリーを初期化
void TerminalFile::initTree(const std::wstring &path){
	if (path.empty() == true){
		// ツリーすべてを初期化
		m_CurrentItem = nullptr;
		m_SelectedItem = nullptr;
		m_ClipboardItem = nullptr;
		m_DiskMap.clear();
		m_Tree->clear();
		m_Tree->setColumnCount(4);
		m_Tree->setHeaderLabels(WCharToQString(L"ツリー;サイズ;タイプ;更新日時").split(';'));
		m_Tree->setColumnWidth(0, 150);
		m_Tree->setColumnWidth(1, 75);
		m_Tree->setColumnWidth(2, 75);
		m_Tree->sortByColumn(0, Qt::AscendingOrder);

		m_SelectedDriveLetter = '\0';
		UpdateUsage();
	}else{
		// 指定されたディレクトリより下を初期化し
		// カレントディレクトリを移す
		moveToItem(path);
		if (m_CurrentItem != nullptr){
			// 子アイテムをすべて削除
			QList<QTreeWidgetItem*> list;
			list = m_CurrentItem->takeChildren();
			for(int cnt = list.count() - 1; 0 <= cnt; cnt--){
				delete list[cnt];
			}
		}
	}
}

// ドライブを追加
void TerminalFile::addDrive(char letter, const std::wstring &name, bool sfn, unsigned long long size){
	QFileIconProvider icon_provider;

	letter = toupper(letter);
	if (m_DiskMap[letter] == nullptr){
		// アイテムの生成
		wchar_t buf[1024];
		_snwprintf_s(buf, 1024, L"%s(%c:);;<DRIVE>;", name.c_str(), letter);
		QTreeWidgetItem *item = new QTreeWidgetItem((QTreeWidget *)NULL, WCharToQString(buf).split(';'));
		item->setIcon(0, icon_provider.icon(QFileIconProvider::Drive));
		item->setTextAlignment(1, Qt::AlignRight | Qt::AlignVCenter);
		item->setTextColor(1, Qt::darkGray);
		item->setTextColor(2, Qt::darkGray);
		item->setTextColor(3, Qt::darkGray);

		// マップに登録
		m_DiskMap[letter] = item;

		// オブジェクトにデータを格納
		item->setData(Drive_Letter, Qt::UserRole, QVariant(letter));
		item->setData(Drive_UseSFN, Qt::UserRole, QVariant(sfn));
		item->setData(Drive_Usage, Qt::UserRole, QVariant(0ULL));
		item->setData(Drive_Size, Qt::UserRole, QVariant(size));

		// カレントアイテムに設定
		m_CurrentItem = item;

		// ツリーに追加
		m_Tree->addTopLevelItem(item);
		item->setChildIndicatorPolicy(QTreeWidgetItem::ShowIndicator);
		item->setExpanded(true);
	}else{
		// アイテムの更新
		QTreeWidgetItem *item = m_DiskMap[letter];

		// オブジェクトにデータを格納
		item->setData(Drive_Usage, Qt::UserRole, QVariant(0ULL));
		item->setData(Drive_Size, Qt::UserRole, QVariant(size));
	}
}

// ドライブの使用量が変化した
void TerminalFile::changeDriveStatus(char letter, unsigned long long usage){
	QTreeWidgetItem *item = m_DiskMap[toupper(letter)];
	if (item != nullptr){
		item->setData(Drive_Usage, Qt::UserRole, QVariant(usage));
		if (m_SelectedDriveLetter == letter){
			UpdateUsage();
		}
	}
}

// カレントアイテムを移動する
void TerminalFile::moveToItem(const std::wstring &wpath){
	m_CurrentItem = nullptr;

	if (0x0100 <= wpath[0]) return;

	// 与えられたパスを大文字に変換し'/'と'\'で分割する
	QString path = WStringToQString(wpath).toUpper();
	QStringList split = path.split(QRegExp("\\\\|/"));
	
	int list_size = split.size();
	for(int cnt = 0; cnt < list_size; cnt++){
		if (split[cnt].size() == 0) break;
		if (cnt == 0){
			// ドライブ
			m_CurrentItem = m_DiskMap[toupper(wpath[0])];
		}else{
			// ファイル・ディレクトリ
			QTreeWidgetItem *target, *base = m_CurrentItem;
			int num = base->childCount();

			m_CurrentItem = nullptr;
			for(int index = 0; index < num; index++){
				target = base->child(index);
				if (target->text(0).compare(split[cnt], Qt::CaseInsensitive) == 0){
					m_CurrentItem = target;
					break;
				}
			}
		}
		if (m_CurrentItem == nullptr){
			break;
		}
	}
}

// ファイル・ディレクトリをカレントアイテムへ追加
void TerminalFile::addItem(const std::wstring &name, unsigned long long size, bool dir, unsigned int date){
	if (name.empty() == true) return;

	if (m_CurrentItem != nullptr){
		QFileIconProvider icon_provider;

		// アイテムの生成
		wchar_t buf[1024];
		QTreeWidgetItem *item;
		if (dir == true){
			// ディレクトリ
			_snwprintf_s(buf, 1024, L"%s;;<DIR>;%s", name.c_str(), ConvertDate(date));
			item = new QTreeWidgetItem((QTreeWidget *)NULL, WCharToQString(buf).split(';'));
			item->setIcon(0, icon_provider.icon(QFileIconProvider::Folder));
		}else{
			// ファイル
			unsigned long long size_in_kb = (size + 1023) / 1024;
			_snwprintf_s(buf, 1024, L"%s;%lld KB;;%s", name.c_str(), size_in_kb, ConvertDate(date));
			item = new QTreeWidgetItem((QTreeWidget *)NULL, WCharToQString(buf).split(';'));
			item->setIcon(0, icon_provider.icon(QFileIconProvider::File));
		}
		item->setFlags(Qt::ItemIsEditable | Qt::ItemIsEnabled | Qt::ItemIsSelectable);
		item->setTextAlignment(1, Qt::AlignRight | Qt::AlignVCenter);
		item->setTextColor(1, Qt::darkGray);
		item->setTextColor(2, Qt::darkGray);
		item->setTextColor(3, Qt::darkGray);

		// 所属するドライブのドライブレターを取得
		char letter = GetDriveLetter(m_CurrentItem);

		// オブジェクトにデータを格納
		item->setData(File_Letter, Qt::UserRole, QVariant(letter));
		item->setData(File_Directory, Qt::UserRole, QVariant(dir));
		item->setData(File_Expanded, Qt::UserRole, QVariant(false));

		// ツリーに追加
		m_CurrentItem->addChild(item);
		if (dir == true){
			item->setChildIndicatorPolicy(QTreeWidgetItem::ShowIndicator);
			// item->setExpanded(true);
		}

		// カレントアイテムを新しいアイテムへ移す
		m_CurrentItem = item;
	}
}

// カレントアイテムを上の階層へ
void TerminalFile::moveUp(void){
	if (m_CurrentItem != nullptr){
		// カレントアイテムを親アイテムに移す
		m_CurrentItem = m_CurrentItem->parent();
	}else{
		m_CurrentItem = nullptr;
	}
}

// ファイルが更新された
void TerminalFile::changeFile(std::wstring *path, unsigned long long size){
	QTreeWidgetItem *current = m_CurrentItem;

	moveToItem(*path);
	if (m_CurrentItem != nullptr){
		// ツリー中にすでにファイルが存在する
		QString qstr;
		unsigned long long size_in_kb = (size + 1023) / 1024;
		qstr.sprintf("%lld KB", size_in_kb);
		m_CurrentItem->setText(1, qstr);
		m_CurrentItem->setText(3, WCharToQString(ConvertDate(GetDate())));
	}else{
		// パス中の最後のスプリッター(/か\)をヌルに置き換える
		wchar_t *buf = &(*path)[0];
		int length = path->size();
		int splitter = -1;
		for(int cnt = 0; cnt < length; cnt++){
			if ((*buf == L'/') || (*buf == L'\\')){
				splitter = cnt;
			}
			buf++;
		}
		if (0 <= splitter){
			(*path)[splitter] = L'\0';
			moveToItem(*path);
			if (m_CurrentItem != nullptr){
				// ツリー中に親ディレクトリがすでに存在する
				addItem(&(*path)[splitter + 1], size, false, GetDate());
			}
		}
	}

	m_CurrentItem = current;
	delete path;
}






// アイテムが選択された
void TerminalFile::itemSelectionChanged(void){
	QList<QTreeWidgetItem*> list;
	list = m_Tree->selectedItems();
	if (list.empty() == true){
		Trace(L"Unselected");
	}else{
		Disk_t *disk;
		QTreeWidgetItem *item = list.at(0);
		char letter;

		letter = GetDriveLetter(item);

		//Trace(L"selected is disk %c", letter);

		if (letter != m_SelectedDriveLetter){
			// 容量表示を更新
			m_SelectedDriveLetter = letter;
			UpdateUsage();
		}
	}
}

// アイテムが変更された
void TerminalFile::itemChanged(QTreeWidgetItem *item, int column){
	if (column != 0) return;
	
	QTreeWidgetItem *parent = item->parent();
	if (parent == nullptr) return;
	
	if (m_AllowDirWrite == true){
		QString q_dst_name = item->text(0);
		if (CorrectionName(parent, item, q_dst_name) == true){
			// 名前を訂正できた
			QString q_src_name = m_PreviousName;

			// 古いパスと新しいパスを求める
			bool result;
			std::wstring src_path, dst_path;
			src_path.assign(MakePath(parent, result));
			if (result == true){
				src_path.append(L"\\");
				dst_path.assign(src_path);
				src_path.append(QStringToWString(q_src_name));
				dst_path.append(QStringToWString(q_dst_name));
				
				// 名前を変更
				m_Tree->blockSignals(true);
				item->setText(0, q_dst_name);
				m_Tree->blockSignals(false);
				
				if (q_dst_name.compare(q_src_name, Qt::CaseInsensitive) != 0){
					// リネームリクエストを送る
					Trace(L"moveRequest '%s' <- '%s'", dst_path.c_str(), src_path.c_str());
					emit moveRequest(dst_path, src_path);
				}

				return;
			}
		}
	}

	// エラーが起きたのでテキストを戻す
	m_Tree->blockSignals(true);
	item->setText(0, m_PreviousName);
	m_Tree->blockSignals(false);
}

// アイテムが展開された
void TerminalFile::itemExpanded(QTreeWidgetItem *item){
	m_SelectedItem = item;
	updateTree(false);
}








// 適切なファイル名に直す
bool TerminalFile::CorrectionName(QTreeWidgetItem *parent, QTreeWidgetItem *item, QString &q_name, bool ask_overwrite){
	// 同名のファイル・ディレクトリがあるか調べる
	bool match = false, overwrite = false;
	int num = parent->childCount();
	for(int cnt = 0; cnt < num; cnt++){
		QTreeWidgetItem *target = parent->child(cnt);
		if (target == item) continue;
		if (QString::compare(q_name, target->text(0), Qt::CaseInsensitive) == 0){
			match = 1;
			break;
		}
	}
	if (match == true){
		if (ask_overwrite == false){
			QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"同名のファイルが存在します。"));
		}else{
			QMessageBox::StandardButton pushed;
			pushed = QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"同名のファイルが存在します。\n上書きしますか？"), QMessageBox::Yes | QMessageBox::No, QMessageBox::No);
			if (pushed & QMessageBox::Yes){
				overwrite = true;
			}
		}
	}
	if (overwrite | !match){
		// 名前は被っていない・上書きする

		// 使えない文字が含まれていないか調べる
		char letter = GetDriveLetter(parent);
		QTreeWidgetItem *drive = m_DiskMap[letter];
		
		std::wstring name = QStringToWString(q_name);
		bool error = false;
		if (drive->data(Drive_UseSFN, Qt::UserRole).toBool() == true){
			// SFN
			// 半角カタカナは使用不可とする
			// 使用可能なのは、半角大文字英数、$、%、'、-、_、@、~、`、!、(、)、{、}、^、#、&
			unsigned int usable[] = {0x00000000, 0x03FF63FA, 0xC7FFFFFF, 0x6FFFFFFF};
			int len = name.size();
			int before_p = 0, after_p = -1;
			for(int cnt = 0; cnt < len; cnt++){
				wchar_t c = name[cnt];
				if ((0x0080 <= c) || (~usable[c >> 5] & (1 << (c & 0x1F)))){
					error = true;	// 使用不可能な文字が含まれる
					break;
				}
				name[cnt] = towupper(c);	// 大文字変換
				if (c == L'.'){
					if (0 <= after_p){
						error = true;	// ピリオドが2つある
						break;
					}
					after_p = 0;
				}else{
					if (after_p < 0){
						before_p++;	// ピリオド前
					}else{
						after_p++;	// ピリオド後
					}
				}
			}

			//Trace(L"error=%s", error ? L"true" : L"false");
			//Trace(L"before_p=%d, after_p=%d", before_p, after_p);

			if ((error == true) || (before_p <= 0) || (8 < before_p) || (3 < after_p)){
				error = true;
			}else{
				if (after_p == 0){
					name.erase(len - 1);	// 末尾のピリオドの除去
				}
			}
		}else{
			// LFN
			// 半角カタカナは使用不可とする
			// 使用可能なのは、全角すべて、半角英数、$、%、'、-、_、@、~、`、!、(、)、{、}、^、#、&、+、,、;、=、[、]
			unsigned int usable[] = {0x00000000, 0x2BFF7BFA, 0xEFFFFFFF, 0x6FFFFFFF, 0x00000000, 0x00000000, 0x00000000, 0x00000000};
			int len = name.size();
			int tail = 0;
			for(int cnt = 0; cnt < len; cnt++){
				wchar_t c = name[cnt];
				if ((c < 0x0100) && (~usable[c >> 5] & (1 << (c & 0x1F)))){
					error = true;	// 使用不可能な文字が含まれる
					break;
				}
				if ((c != L'.') && (c != L' ')){
					tail = cnt + 1;
				}
			}

			if (tail == 0){
				error = true;
			}
			if ((error == false) && (tail != len)){
				name.erase(tail);	// 末尾のピリオド・スペースを除去
			}
		}
		
		if (error == true){
			QMessageBox::warning(m_Tree, tr("File"), WCharToQString(L"ファイル名が不正です。"));
		}else{
			// 成功
			q_name = WStringToQString(name);
			return true;
		}
	}

	return false;
}




