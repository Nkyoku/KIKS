// ログの表示と保存

#include "TerminalLogger.h"
#include "trace.h"
#include "convstr.h"
#include "convqstr.h"
#include "ini.h"

#include <QMenu>
#include <QFileDialog>
#include <QMessageBox>



const TerminalLogger::TypeTable_t TerminalLogger::TYPE_TABLE[] = {
	{L"BIT",	TYPE_BIT,	false},
	{L"INT",	TYPE_INT,	true},
	{L"SINT",	TYPE_INT,	true},
	{L"UINT",	TYPE_INT,	false},
	{L"FIX",	TYPE_FIX,	true},
	{L"SFIX",	TYPE_FIX,	true},
	{L"UFIX",	TYPE_FIX,	false},
	{L"FLOAT",	TYPE_FLOAT,	false}
};



// コンストラクタ
TerminalLogger::TerminalLogger(
	QCheckBox *check, QGraphicsView *graph, QPushButton *add, QPushButton *remove, QTableWidget *list, QTableWidget *save_list,
	QLabel *label, QPushButton *start, QPushButton *stop, QPushButton *save)
	: m_CheckUse(check), m_Graph(graph), m_Add(add), m_Remove(remove), m_List(list), m_SaveList(save_list),
	m_Label(label), m_Start(start), m_Stop(stop), m_Save(save), m_Enabled(false), /*m_Checked(false), */m_Logging(false), m_Dropped(false),
	m_ReceivingID(0), m_ReceivingData(0), m_ReceivingSize(0), m_ReceivingRemain(0)
{
	// カラムの設定
	m_List->setColumnWidth(0, 32);
	m_SaveList->setColumnWidth(0, 32);
	
	// 保存メニューを作成
	QMenu *s_menu = new QMenu();
	m_Save->setMenu(s_menu);
	m_SaveActionRecently = s_menu->addAction(WCharToQString(L"最近使用した保存先"));
	s_menu->addSeparator();
	m_SaveActionCSV = s_menu->addAction(WCharToQString(L"CSVファイル"));
	m_SaveActionCSVplusPLT = s_menu->addAction(WCharToQString(L"CSVファイル + PLTファイル"));
	m_SaveActionVCD = s_menu->addAction(WCharToQString(L"VCDファイル"));
	m_SaveActionRecently->setEnabled(false);
	m_RecentlySaveAction = nullptr;

	// シグナルを接続
	//connect(m_CheckUse, SIGNAL(stateChanged(int)), this, SLOT(checked(int)));
	connect(m_Add, SIGNAL(clicked()), this, SLOT(addPushed()));
	connect(m_Remove, SIGNAL(clicked()), this, SLOT(removePushed()));
	connect(m_Start, SIGNAL(clicked()), this, SLOT(startPushed()));
	connect(m_Stop, SIGNAL(clicked()), this, SLOT(stopPushed()));
	//connect(m_Save, SIGNAL(clicked()), this, SLOT(savePushed()));
	connect(s_menu, SIGNAL(triggered(QAction *)), this, SLOT(savePushed(QAction *)));

	// ラベルをクリア
	m_Label->clear();
	m_Graph->setVisible(false);
}
	
// デストラクタ
TerminalLogger::~TerminalLogger(){

}

// チェックボタンが押された
/*void TerminalLogger::checked(int state){
	bool checked = state != Qt::Unchecked;
	checked &= m_Enabled;
	if (checked != m_Checked){
		m_Checked = checked;
		enable(m_Checked);
	}
}*/

// 開始ボタンが押された
void TerminalLogger::startPushed(void){
	if (m_Logging == false){
		if (m_SaveList->rowCount() != 0){
			// ロギングを開始
			m_Logging = true;
			m_CurrentTime = 0;
			m_LoggingPoints.clear();
			m_LoggingIDs.clear();
			for(int cnt = m_SaveList->rowCount() - 1; 0 <= cnt; cnt--){
				unsigned int id = m_SaveList->item(cnt, 0)->data(Qt::UserRole).toUInt();
				if (id <= _ID_MAX_){
					m_LoggingIDs.push_back(id);
				}
			}

			// UIを有効・無効化
			m_List->setEnabled(false);
			m_SaveList->setEnabled(false);
			m_Add->setEnabled(false);
			m_Remove->setEnabled(false);
			m_Start->setEnabled(false);
			m_Stop->setEnabled(true);
			m_Save->setEnabled(false);
		}else{
			QMessageBox::warning(m_List, tr("Logger"), WCharToQString(L"ログをとる項目を選択してください。"));
		}
	}
}

// 停止ボタンが押された
void TerminalLogger::stopPushed(void){
	if (m_Logging == true){
		m_Logging = false;

		// UIを有効・無効化
		m_List->setEnabled(true);
		m_SaveList->setEnabled(true);
		m_Add->setEnabled(true);
		m_Remove->setEnabled(true);
		m_Start->setEnabled(true);
		m_Stop->setEnabled(false);
		m_Save->setEnabled(true);
	}
}

// 保存ボタンが押された
void TerminalLogger::savePushed(QAction *action){
	if (m_LoggingPoints.empty() == false){
		// 保存先ファイルパスを取得
		if (action == m_SaveActionRecently){
			action = m_RecentlySaveAction;
		}else{
			QString q_path, title;
			title = WCharToQString(L"保存先のファイル(拡張子含まず)を入力してください。");
			q_path = QFileDialog::getSaveFileName(m_List, title, QDir::currentPath());
			if (q_path.isEmpty() == true) return;
			m_RecentlySavePath = QStringToWString(q_path);
			m_RecentlySaveAction = action;
			m_SaveActionRecently->setText(action->text());
			m_SaveActionRecently->setEnabled(true);
		}
		if (m_RecentlySavePath.empty() == true) return;

		// 保存するファイルの種類に応じて分岐
		bool result;
		if (action == m_SaveActionCSV){
			result = SaveToCSV(m_RecentlySavePath);
		}else if (action == m_SaveActionCSVplusPLT){
			result = SaveToCSV(m_RecentlySavePath);
			result &= SaveToPLT(m_RecentlySavePath);
		}else if (action == m_SaveActionVCD){
			result = SaveToVCD(m_RecentlySavePath);
		}
		if (result == false){
			QMessageBox::warning(m_List, tr("Logger"), WCharToQString(L"ファイルの保存に失敗しました。"));
		}
	}
}





// 有効にする
void TerminalLogger::enable(bool enabled, bool idle, bool pipe_r){
	if ((m_Enabled = true) && (enabled == false)){
		m_Logging = false;
		clearLogInfo();
	}
	
	//Trace(L"pipe_r=%d", pipe_r);

	enabled &= pipe_r;
	m_Enabled = enabled;
	m_Logging &= enabled;
	m_Dropped &= enabled;

	m_List->setEnabled(enabled & !m_Logging);
	m_SaveList->setEnabled(enabled & !m_Logging);
	m_Add->setEnabled(enabled & idle & !m_Logging);
	m_Remove->setEnabled(enabled & idle & !m_Logging);
	m_Start->setEnabled(enabled & idle & !m_Logging);
	m_Stop->setEnabled(enabled & idle & m_Logging);
	m_Save->setEnabled(enabled & idle & !m_Logging);

	/*if (m_Checked && !enable){
		// チェックをはずす
		m_CheckUse->blockSignals(true);
		m_CheckUse->setChecked(false);
		m_CheckUse->blockSignals(false);
	}
	m_Checked &= enable;*/
}

// ログの表示を更新する
void TerminalLogger::update(void){
	const char *dropped_text;
	
	dropped_text = m_Dropped ? ", Data dropping" : "";

	if (m_SaveList->rowCount() == 0){
		// ログを受信していない
		m_Label->setText("Stop");
	}else{
		QString text;
		if (m_Logging == false){
			// ログを保存していない
			text.sprintf("Freerun%s", dropped_text);
			m_Label->setText(text);
		}else{
			// ログを保存中
			text.sprintf("Logging %d points, %.2f s%s", m_LoggingPoints.size(), (double)m_CurrentTime / 1000, dropped_text);
			m_Label->setText(text);
		}

		// 値を更新
		auto it = m_Register.begin();
		auto end = m_Register.end();
		for(; it != end; ++it){
			QTableWidgetItem *item;
			item = it->second.Item;
			if (item != nullptr){
				unsigned int id = it->second.ID;
				const char *string = CreateString(&it->second, m_CurrentValues[id], m_CurrentValuesSize[id]);
				if (string != nullptr){
					text = string;
					text.append(WCharToQString(it->second.Unit));
					item->setText(text);
				}else{
					item->setText("----");
				}
			}
		}
	}
}

// 値を文字列に変換
const char* TerminalLogger::CreateString(const Register_t *reg, Compound_u value, int size){
	static char buffer[40];

	unsigned int id = reg->ID;
	
	if ((0 <= size) && (size <= 2)){
		switch(reg->Type){
		case TYPE_BIT:
			for(int cnt = reg->Width - 1; 0 <= cnt; cnt--){
				buffer[cnt] = value.Unsigned & 0x1 ? '1' : '0';
				value.Unsigned >>= 1;
			}
			buffer[reg->Width] = '\0';
			break;

		case TYPE_INT:
			if (m_RegisterSigned[id] == false){
				_i64toa(reg->Num * value.Unsigned, buffer, 10);
			}else{
				_i64toa(reg->Num * value.Signed, buffer, 10);
			}
			break;

		case TYPE_FIX:
			if (m_RegisterSigned[id] == false){
				sprintf_s(buffer, sizeof(buffer), "%.6f", reg->Num * value.Unsigned);
			}else{
				sprintf_s(buffer, sizeof(buffer), "%.6f", reg->Num * value.Signed);
			}
			break;

		case TYPE_FLOAT:
			sprintf_s(buffer, sizeof(buffer), "%.6f", reg->Num * value.Float);
			break;

		default:
			goto Error;
		}

		// すべてunsigned, num=1.0で出力
		//_i64toa(value.Signed, buffer, 10);
		return buffer;
	}

Error:
	return nullptr;
}

// ログを時刻でソート
void TerminalLogger::SortLog(void){
	unsigned int size = m_LoggingPoints.size();
	if (1 < size){
		Point_t *log = &m_LoggingPoints[0];
		std::sort(log, log + size, [](Point_t &p1, Point_t &p2){return p1.Time < p2.Time;});
	}
}

// ログ情報をクリア
void TerminalLogger::clearLogInfo(void){
	m_Register.clear();
	memset(m_RegisterSigned, 0x00, sizeof(m_RegisterSigned));
	m_RegisterSigned[ID_DELTATIME] = true;
	m_List->setRowCount(0);
	m_SaveList->setRowCount(0);
}

// ログ情報を与える
void TerminalLogger::setLogInfo(const std::wstring &name){
	Trace(L"LogInfo '%s'", name.c_str());

	// クリア
	clearLogInfo();

	// iniファイルから読み取る
	auto ParseINI = [&](const wchar_t *file){
		clINI ini;
		if (ini.Open(g_ApplicationDir.c_str(), file) == true){
			wchar_t buf[MAX_PATH];
			wchar_t *list = new wchar_t[MAX_INI_LENGTH];
			ini.Read(L"Register", nullptr, list, MAX_INI_LENGTH);
			const wchar_t *p = list;
			while(true){
				int len = wcsnlen(p, MAX_INI_LENGTH);
				if (len <= 0) break;
				ini.Read(L"Register", p, buf);
				int id = _wtoi(p);
				AddLogInfo(id, buf);
				p += len + 1;
			}
			delete [] list;
		}
	};
	ParseINI(name.c_str());		// デバイスiniファイルから読み取る
	ParseINI(L"log_sys.ini");	// システムのiniファイルから読み取る

	// ソート
	m_List->sortItems(0, Qt::AscendingOrder);

	// 必要な行数を取得
	auto it = m_Register.begin();
	auto end = m_Register.end();
	int row_count = 0;
	for(; it != end; ++it){
		if (_ID_USER_ <= it->second.ID){
			row_count++;
		}
	}

	// m_Listにリストを追加
	m_List->setRowCount(row_count);
	it = m_Register.begin();
	int row_index = 0;
	for(; it != end; ++it){
		unsigned int id = it->second.ID;
		if (_ID_USER_ <= id){
			QTableWidgetItem *item0 = new QTableWidgetItem(QString::number(id));
			QTableWidgetItem *item1 = new QTableWidgetItem(WCharToQString(it->second.Name));
			item0->setData(Qt::UserRole, QVariant(id));
			m_List->setItem(row_index, 0, item0);
			m_List->setItem(row_index, 1, item1);
			if (it->second.Default == true){
				item0->setSelected(true);
				item1->setSelected(true);
			}
			row_index++;
		}
	}
}

// ログ情報を追加
void TerminalLogger::AddLogInfo(unsigned int id, wchar_t *str){
	if (_ID_MAX_ <= id) return;

	unsigned int num_of_comma = 0;
	const wchar_t *split[4];
	wchar_t c;

	//Trace(L"log '%s'", str);

	split[0] = str;
	while(true){
		c = *str;
		if (c == L'\0') break;
		if (c == L','){
			*str = L'\0';
			num_of_comma++;
			if (4 <= num_of_comma) break;
			split[num_of_comma] = str + 1;
		}
		str++;
	}
	if ((num_of_comma != 2) && (num_of_comma != 3)) return;

	// リストに追加
	Register_t new_info;
	bool new_signed = false;
	new_info.ID = id;
	if (*split[0] == L'*'){
		new_info.Default = true;
		split[0]++;
	}else{
		new_info.Default = false;
	}
	wcscpy_s(new_info.Name, sizeof(new_info.Name) / sizeof(wchar_t), split[0]);
	wcscpy_s(new_info.Unit, sizeof(new_info.Unit) / sizeof(wchar_t), split[1]);
	new_info.Type = TYPE_ERROR;
	for(int cnt = 0; cnt < (sizeof(TYPE_TABLE) / sizeof(TypeTable_t)); cnt++){
		if (wcsnicmp(split[2], TYPE_TABLE[cnt].Name, MAX_PATH) == 0){
			new_info.Type = TYPE_TABLE[cnt].Type;
			new_signed = TYPE_TABLE[cnt].Signed;
			break;
		}
	}
	if (new_info.Type != TYPE_ERROR){
		if (num_of_comma == 3){
			new_info.Num = _wtof(split[3]);
			new_info.Width = _wtoi(split[3]);
			if (new_info.Width < 1) new_info.Width = 1;
			else if(32 < new_info.Width) new_info.Width = 32;
		}else{
			new_info.Num = 1.0;
			new_info.Width = 1;
		}
		new_info.Item = nullptr;
		m_CurrentValues[id].Unsigned = 0;
		m_CurrentValuesSize[id] = -1;

		Trace(L"id=%d : name=%s, unit=%s, type=%s, num=%f", id, new_info.Name, new_info.Unit, TYPE_TABLE[new_info.Type], new_info.Num);

		m_Register[id] = new_info;
		m_RegisterSigned[id] = new_signed;
	}
}

// ログ情報を移動
void TerminalLogger::MoveLogInfo(QTableWidget *dst_table, QTableWidget *src_table, bool dir_add){
	QList<QTableWidgetItem*> selected;
	selected = src_table->selectedItems();
	if (selected.empty() == false){
		// 移動する行のリストを作成
		std::vector<int> row_list;
		int size = selected.size();
		for(int cnt = 0; cnt < size; cnt++){
			if (selected[cnt]->column() == 0){
				row_list.push_back(selected[cnt]->row());
			}
		}

		// 行リストをソート
		std::sort(row_list.begin(), row_list.end());

		// 移動先リストに行を追加し選択状態にする
		size = row_list.size();
		int row_index = dst_table->rowCount();
		dst_table->setRowCount(row_index + size);
		for(int cnt = 0; cnt < size; cnt++){
			unsigned int id;
			id = src_table->item(row_list[cnt], 0)->data(Qt::UserRole).toUInt();
			auto it = m_Register.find(id);
			if (it != m_Register.end()){
				// 行にアイテムをセット
				QTableWidgetItem *item0 = new QTableWidgetItem(QString::number(id));
				QTableWidgetItem *item1 = new QTableWidgetItem(WCharToQString(it->second.Name));
				item0->setData(Qt::UserRole, QVariant(id));
				dst_table->setItem(row_index, 0, item0);	
				dst_table->setItem(row_index, 1, item1);
				if (dir_add == false){
					it->second.Item = nullptr;
				}else{
					QTableWidgetItem *item2 = new QTableWidgetItem();
					dst_table->setItem(row_index, 2, item2);
					item2->setSelected(true);
					it->second.Item = item2;

					// 値をクリア
					m_CurrentValues[id].Unsigned = 0;
					m_CurrentValuesSize[id] = -1;
				}
				item0->setSelected(true);
				item1->setSelected(true);

				row_index++;
			}
		}

		// ソート
		dst_table->sortItems(0, Qt::AscendingOrder);

		// 移動元リストから行を削除
		auto it = row_list.rbegin();
		auto end = row_list.rend();
		for(; it != end; ++it){
			src_table->removeRow(*it);
		}

		// 移動先のリストにフォーカスをあわせる
		dst_table->setFocus();

		// ロギングする項目を更新する
		UpdateLoggingList();
	}
}

// ロギングする項目を更新する
void TerminalLogger::UpdateLoggingList(void){
	if (m_SaveList->rowCount() == 0){
		emit sendLoggingList(nullptr, 0);
	}else{
		unsigned int size = (_ID_MAX_ + 7) / 8;
		char *buffer = new char[size];
		memset(buffer, 0x00, size);

		// リストから保存する項目のビットを立てる
		int row_count = m_SaveList->rowCount();
		for(int cnt = 0; cnt < row_count; cnt++){
			unsigned int id;
			id = m_SaveList->item(cnt, 0)->data(Qt::UserRole).toUInt();
			if (id <= _ID_MAX_){
				buffer[id / 8] |= 1 << (id % 8);
			}
		}

		// システムで使用するビットを立てる
		buffer[ID_DELTATIME / 8] |= 1 << (ID_DELTATIME % 8);

		// 時刻をリセット
		m_CurrentTime = 0;

		emit sendLoggingList(buffer, size);
	}
}







// ログを受信する
void TerminalLogger::receiveLog(unsigned short *data, unsigned int size){
	Trace(L"receiveLog(%d, %d)", size);
	m_Dropped = false;

	unsigned int receiving_id = m_ReceivingID;
	unsigned int receiving_data = m_ReceivingData;
	unsigned int receiving_size = m_ReceivingSize;
	unsigned int receiving_remain = m_ReceivingRemain;

	unsigned int size_bak = size;
	unsigned int cnt_size = 0;

	unsigned short *p = data;
	while(0 < size--){
		unsigned short c = *p++;
		if (c & 0x0001){
			// First word
			receiving_remain = (c >> 14);
			receiving_size = receiving_remain;
			if (receiving_remain == 0){
				receiving_id = (c >> 9) & 0x1F;
				receiving_data = (c >> 1) & 0xFF;
			}else{
				receiving_id = (c >> 4) & 0x3FF;
				receiving_data = (c >> 1) & 0x7;
			}
			if (receiving_id == ID_DROP){
				// データが欠落している
				m_Dropped = true;
				receiving_id = 0;
			}
		}else{
			// Second/Third word
			if (0 < receiving_remain){
				receiving_remain--;
				receiving_data = (receiving_data << 15) | (c >> 1);
			}
		}
		if (receiving_remain == 0){
			if (receiving_id != 0){
				// データが完成

				// ログの表示データを更新
				if (m_RegisterSigned[receiving_id] == true){
					// 符号拡張
					if (receiving_size == 0){
						receiving_data = (signed char)receiving_data;
					}else if (receiving_size == 1){
						receiving_data = (signed short)receiving_data;
					}else{
						receiving_data = (signed long)receiving_data;
					}
				}
				m_CurrentValues[receiving_id].Unsigned = receiving_data;
				m_CurrentValuesSize[receiving_id] = receiving_size;

				// ロギング中なら保存
				if (m_Logging == true){
					if (receiving_id == ID_DELTATIME){
						m_CurrentTime += receiving_data;
					}else{
						if (0 <= m_CurrentTime){
							Point_t point;
							point.Time = m_CurrentTime;
							point.ID = receiving_id;
							point.Size = receiving_size;
							point.Value.Unsigned = receiving_data;
							m_LoggingPoints.push_back(point);
						}
					}
				}

				receiving_id = 0;
			}
			//receiving_data = 0;
			//receiving_size = 0;
		}
		cnt_size++;
	}

	m_ReceivingID = receiving_id;
	m_ReceivingData = receiving_data;
	m_ReceivingSize = receiving_size;
	m_ReceivingRemain = receiving_remain;

	delete [] data;
}

// エラーを受信する
void TerminalLogger::receiveError(void){
	Trace(L"receiveError()");

	// ロギングを取りやめ
	m_Logging = false;
	m_Dropped = false;

	// 保存リストからすべての項目を排除
	m_SaveList->selectAll();
	removePushed();

	// 警告ダイアログ表示
	//QMessageBox::warning(m_List, tr("Logger"), WCharToQString(L"ロギング中にエラーが発生しました。"));
}







// CSVファイルに保存
bool TerminalLogger::SaveToCSV(const std::wstring &path_no_ext){
	// ログをソート
	SortLog();

	// 各IDのデータを出力
	int signal_count = m_LoggingIDs.size();
	for(int cnt = 0; cnt < signal_count; cnt++){
		unsigned int id = m_LoggingIDs[cnt];
		const Register_t *reg = &m_Register[id];
		Type_e type = reg->Type;
		
		// ファイルを開く
		FILE *fp;
		wchar_t path_buf[MAX_PATH];
		swprintf_s(path_buf, MAX_PATH, L"%s_%d.csv", path_no_ext.c_str(), id);
		if (_wfopen_s(&fp, path_buf, L"w") != 0) return false;

		// 値を出力
		unsigned int time = 0;
		Point_t *point = &m_LoggingPoints[0];
		int num_of_points = m_LoggingPoints.size();
		for(int cnt = 0; cnt < num_of_points; cnt++, point++){
			unsigned int delta = point->Time - time;
			if (0 < delta){
				time += delta;
			}
			if (point->ID != id) continue;

			fprintf(fp, "%u,%s\n", time, CreateString(reg, point->Value, point->Size));
		}

		fclose(fp);
	}

	return true;
}

// PLTファイルに保存
bool TerminalLogger::SaveToPLT(const std::wstring &path_no_ext){
	std::wstring path(path_no_ext + L".plt");
	FILE *fp;
	if (_wfopen_s(&fp, path.c_str(), L"w") != 0) return false;

	// カレントパスの設定
	std::string path_mb;
	char path_buf[MAX_PATH], path_drive[_MAX_DRIVE], path_dir[_MAX_DIR], path_fname[_MAX_FNAME];
	WCharToString(path_mb, path_no_ext.c_str());
	_splitpath_s(path_mb.c_str(), path_drive, _MAX_DRIVE, path_dir, _MAX_DIR, path_fname, _MAX_FNAME, nullptr, 0);
	_makepath_s(path_buf, MAX_PATH, path_drive, path_dir, nullptr, nullptr);
	fprintf(fp, "cd '%s'\n", path_buf);

	// 表示設定
	fputs("set title 'Logger'\n"
	      "set key left top\n"
	      "set y2tics\n"
	      "set xtics nomirror\n"
	      "set ytics nomirror\n"
		  "set datafile separator \",\"\n"
	      , fp);

	// 信号名を出力
	fputs("plot\t", fp);
	int signal_count = m_LoggingIDs.size();
	for(int cnt = 0; cnt < signal_count; cnt++){
		unsigned int id = m_LoggingIDs[cnt];
		const Register_t *reg = &m_Register[id];
		
		std::string identifier;
		WCharToString(identifier, reg->Name);
		if (cnt != 0) fputs("\t\t", fp);
		fprintf(fp, "'%s_%d.csv' using 1:2 with lines axis x1y1 title \"%s\"", path_fname, id, identifier.c_str());
		if (cnt != (signal_count - 1)) fputs(",\\", fp);
		fputs("\n", fp);
	}

	// ×ボタンを押したときの処理
	fputs("\n", fp);
	fputs("bind \"Close\" \"if (GPVAL_TERM eq \\'wxt\\') bind \\'Close\\' \\'\\'; exit gnuplot; else bind \\'Close\\' \\'\\'; exit\"\n", fp);

	fclose(fp);

	return true;
}

// VCDファイルに保存
bool TerminalLogger::SaveToVCD(const std::wstring &path_no_ext){
	std::wstring path(path_no_ext + L".vcd");
	FILE *fp;
	if (_wfopen_s(&fp, path.c_str(), L"w") != 0) return false;

	// ログをソート
	SortLog();

	// ヘッダーを出力
	fputs("$version Terminal $end\n", fp);
	fputs("$timescale 1 ms $end\n", fp);
	fputs("$scope module device $end\n", fp);

	// 信号名を出力
	static const int signal_max = '~' - '!';	// VCDの扱える信号数
	char char_table[_ID_MAX_] = {0};			// IDとアスキーコードの変換テーブル
	char char_assign = '!';
	int signal_count = m_LoggingIDs.size();
	for(int cnt = 0; cnt < signal_count; cnt++){
		unsigned int id = m_LoggingIDs[cnt];
		const Register_t *reg = &m_Register[id];
		const char *var_type;
		int bit_width;
		switch(reg->Type){
		case TYPE_BIT:
			var_type = "reg";
			bit_width = reg->Width;
			break;
		case TYPE_INT:
		case TYPE_FIX:
		case TYPE_FLOAT:
			var_type = "real";
			bit_width = 32;
			break;
		default:
			continue;
		}

		std::string identifier;
		WCharToString(identifier, reg->Name);
		int size = identifier.size();
		for(int cnt = 0; cnt < size; cnt++){
			if (identifier[cnt] == ' ') identifier[cnt] = '_';	// スペースをアンダーバーに置き換え
		}
		fprintf(fp, "$var %s %d %c %s $end\n", var_type, bit_width, char_assign, identifier.c_str());

		char_table[id] = char_assign++;
		if ('~' < char_assign){
			break;
		}
	}

	fputs("$upscope $end\n", fp);
	fputs("$enddefinitions $end\n", fp);

	// 値を出力
	unsigned int time = 0;
	auto it = m_LoggingPoints.begin();
	auto end = m_LoggingPoints.end();
	for(; it != end; ++it){
		unsigned int delta = it->Time - time;
		if (0 < delta){
			fprintf(fp, "#%d\n", time);
			time += delta;
		}

		unsigned int id = it->ID;
		char char_assign = char_table[id];
		if (char_assign != 0){
			const Register_t *reg = &m_Register[id];
			if (reg->Type == TYPE_BIT){
				fprintf(fp, "b%s %c\n", CreateString(reg, it->Value, it->Size), char_assign);
			}else{
				fprintf(fp, "r%s %c\n", CreateString(reg, it->Value, it->Size), char_assign);
			}
		}
	}
	
	fclose(fp);

	return true;
}

