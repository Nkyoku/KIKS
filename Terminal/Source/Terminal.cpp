// GUIスレッド

#include "Terminal.h"
#include "trace.h"
#include "convqstr.h"
#include "ini.h"

#include <QTimer>
#include <QMessageBox>
#include <QFileIconProvider>

#include <stdio.h>
#include <stdlib.h>
#include <string>
#include <sstream>



// コンストラクタ
Terminal::Terminal(QWidget *parent) : QMainWindow(parent), m_ds(this){
	// 変数初期化
	
	
	// GUIを作成
	m_ui.setupUi(this);

	// GUI各部の制御クラスを作成
	m_console = new TerminalConsole(m_ui.ConsoleInput, m_ui.ConsoleOutput, m_ui.ConsoleClear);
	m_info = new TerminalInfo(m_ui.StatusBar, m_ui.InfoIconDevice, m_ui.InfoLabelName, m_ui.InfoLabelVersion,
		m_ui.InfoButtonReboot, m_ui.InfoButtonConnect, m_ui.InfoButtonDisconnect);
	m_access = new TerminalAccess(m_ui.ProcessorInput, m_ui.ProcessorOpen, m_ui.ProcessorWrite, m_ui.ProcessorRead,
		m_ui.BitstreamInput, m_ui.BitstreamOpen, m_ui.BitstreamSend, m_ui.BitstreamWrite,
		m_ui.CoprocessorInput, m_ui.CoprocessorOpen, m_ui.CoprocessorSend, m_ui.CoprocessorWrite);
	m_controller = new TerminalController(this, m_ui.ControllerShow);
	m_logger = new TerminalLogger(m_ui.LoggerCheckUse, m_ui.LoggerGraph, m_ui.LoggerButtonAdd, m_ui.LoggerButtonRemove, m_ui.LoggerList, m_ui.LoggerSaveList,
		m_ui.LoggerLabel, m_ui.LoggerStart, m_ui.LoggerStop, m_ui.LoggerSave);
	m_pipe = new TerminalPipe(m_ui.PipeTable);
	m_file = new TerminalFile(m_ui.FileTree, m_ui.FileProgress);

	// ファイラータブのツールボックスにアイコンを設定
	QFileIconProvider icon_provider;
	m_ui.FilerToolBox->setItemIcon(0, icon_provider.icon(QFileIconProvider::Network));
	m_ui.FilerToolBox->setItemIcon(1, icon_provider.icon(QFileIconProvider::Drive));

	// 非同期操作用のスレッドを作成
	m_thread = new QThread(this);
	m_async = new TerminalAsync(&m_ds);
	m_async->moveToThread(m_thread);
	
	// シグナルを接続
	connect(&m_ds, SIGNAL(enableConsole(bool)), m_console, SLOT(enable(bool)));
	connect(&m_ds, SIGNAL(enableInfo(bool, bool)), m_info, SLOT(enable(bool, bool)));
	connect(&m_ds, SIGNAL(enableAccess(char, bool, bool, bool, bool)), m_access, SLOT(enable(char, bool, bool, bool, bool)));
	connect(&m_ds, SIGNAL(enableFileTree(bool, bool, bool, bool, bool, bool)), m_file, SLOT(enable(bool, bool, bool, bool, bool, bool)));
	connect(&m_ds, SIGNAL(enableController(bool, bool, bool)), m_controller, SLOT(enable(bool, bool, bool)));
	connect(&m_ds, SIGNAL(enableLogger(bool, bool, bool)), m_logger, SLOT(enable(bool, bool, bool)));

	connect(m_async, SIGNAL(showWarningConst(const wchar_t *, const wchar_t *)), this, SLOT(showWarningConst(const wchar_t *, const wchar_t *)), Qt::QueuedConnection);
	connect(m_async, SIGNAL(sendProgress(int)), m_info, SLOT(setProgress(int)), Qt::QueuedConnection);
	connect(m_async, SIGNAL(setExclusiveState(bool)), &m_ds, SLOT(setExclusiveState(bool)), Qt::QueuedConnection);
	connect(m_console, SIGNAL(send(const QString &)), this, SLOT(transmitDebug(const QString &)));
	connect(m_info, SIGNAL(changeConnection(const std::wstring *, bool, bool)), this, SLOT(changeConnection(const std::wstring *, bool, bool)));
	connect(m_info, SIGNAL(rebootRequest(const wchar_t *)), &m_ds, SLOT(changeBootMode(const wchar_t *)));
	connect(m_access, SIGNAL(operation(char, std::wstring *)), m_async, SLOT(onAccessOperation(char, std::wstring *)), Qt::QueuedConnection);
	//connect(m_controller, SIGNAL(operation(const Controller_t &)), &m_ds, SLOT(setController(const Controller_t &)));
	connect(m_file, SIGNAL(updateRequest(const std::wstring &)), m_ds.m_dsDir, SLOT(updateRequest(const std::wstring &)));
	connect(m_file, SIGNAL(moveRequest(const std::wstring &, const std::wstring &)), m_ds.m_dsDir, SLOT(moveRequest(const std::wstring &, const std::wstring &)));
	connect(m_file, SIGNAL(copyRequest(const std::wstring &, const std::wstring &)), m_ds.m_dsDir, SLOT(copyRequest(const std::wstring &, const std::wstring &)));
	connect(m_file, SIGNAL(deleteRequest(const std::wstring &)), m_ds.m_dsDir, SLOT(deleteRequest(const std::wstring &)));
	connect(m_file, SIGNAL(mkdirRequest(const std::wstring &)), m_ds.m_dsDir, SLOT(mkdirRequest(const std::wstring &)));
	connect(m_file, SIGNAL(transfarToDevice(std::wstring *, std::wstring *)), m_async, SLOT(transfarToDevice(std::wstring *, std::wstring *)), Qt::QueuedConnection);
	connect(m_file, SIGNAL(transfarFromDevice(std::wstring *, std::wstring *)), m_async, SLOT(transfarFromDevice(std::wstring *, std::wstring *)), Qt::QueuedConnection);
	connect(m_logger, SIGNAL(sendLoggingList(char *, unsigned int)), m_async, SLOT(setLoggingList(char *, unsigned int)), Qt::QueuedConnection);
	connect(m_async, SIGNAL(sendLog(unsigned short *, unsigned int)), m_logger, SLOT(receiveLog(unsigned short *, unsigned int)), Qt::QueuedConnection);
	connect(m_async, SIGNAL(sendLoggingError()), m_logger, SLOT(receiveError()), Qt::QueuedConnection);
	connect(m_controller, SIGNAL(setControllerState(ControllerState_t *)), m_async, SLOT(setControllerState(ControllerState_t *)), Qt::QueuedConnection);
	connect(m_async, SIGNAL(requestControllerState()), m_controller, SLOT(requestControllerState()), Qt::QueuedConnection);

	connect(&m_ds, SIGNAL(setDebugText(QString &)), m_info, SLOT(setDebugText(QString &)));
	connect(&m_ds, SIGNAL(sendProgress(int)), m_info, SLOT(setProgress(int)));
	connect(&m_ds, SIGNAL(setLogInfo(const std::wstring &)), m_logger, SLOT(setLogInfo(const std::wstring &)));
	connect(&m_ds, SIGNAL(changeConnection(const std::wstring *, bool, bool)), this, SLOT(changeConnection(const std::wstring *, bool, bool)));
	connect(&m_ds, SIGNAL(updateWidgetsInfo()), this, SLOT(updateWidgetsInfo()));
	
	connect(m_ds.m_dsPipe, SIGNAL(clearPipe()), m_pipe, SLOT(clearPipe()));
	connect(m_ds.m_dsPipe, SIGNAL(addPipe(const wchar_t *, int, int, const wchar_t *)), m_pipe, SLOT(addPipe(const wchar_t *, int, int, const wchar_t *)));
	connect(m_ds.m_dsDir, SIGNAL(initTree(const std::wstring &)), m_file, SLOT(initTree(const std::wstring &)));
	connect(m_ds.m_dsDir, SIGNAL(addDrive(char, const std::wstring &, bool, unsigned long long)), m_file, SLOT(addDrive(char, const std::wstring &, bool, unsigned long long)));
	connect(m_ds.m_dsDir, SIGNAL(changeDriveStatus(char, unsigned long long)), m_file, SLOT(changeDriveStatus(char, unsigned long long)));
	connect(m_ds.m_dsDir, SIGNAL(moveToItem(const std::wstring &)), m_file, SLOT(moveToItem(const std::wstring &)));
	connect(m_ds.m_dsDir, SIGNAL(addItem(const std::wstring &, unsigned long long, bool, unsigned int)), m_file, SLOT(addItem(const std::wstring &, unsigned long long, bool, unsigned int)));
	connect(m_ds.m_dsDir, SIGNAL(moveUp()), m_file, SLOT(moveUp()));
	connect(m_ds.m_dsFile, SIGNAL(changeFile(std::wstring *, unsigned long long)), m_file, SLOT(changeFile(std::wstring *, unsigned long long)), Qt::QueuedConnection);

	





	

	// タイマーを作成
	QTimer *interval = new QTimer(this);
    connect(interval, SIGNAL(timeout()), this, SLOT(onInterval()));
	connect(interval, SIGNAL(timeout()), m_logger, SLOT(update()));
    interval->start(PERIOD);

	// ウィジェットを初期状態に
	m_console->enable(false);
	m_info->enable(false, false);
	m_access->enable('P', false);
	m_access->enable('B', false);
	m_access->enable('C', false);
	m_file->enable(false);
	m_controller->enable(false);
	m_logger->enable(false);

	// 前回の設定の読み込み
	int maximized = 0;
	clINI setting;
	if (setting.Open(g_ApplicationDir.c_str(), L"setting.ini") == true){
		// パスの読み込み
		wchar_t buf[MAX_PATH];
		setting.Read(L"Path", L"Processor", buf);
		m_access->setPath('P', buf);
		setting.Read(L"Path", L"Bitstream", buf);
		m_access->setPath('B', buf);
		setting.Read(L"Path", L"Coprocessor", buf);
		m_access->setPath('C', buf);

		// 設定の読み込み
		int baudrate = m_info->getBaudrate();
		setting.Read(L"Setting", L"Baudrate", baudrate);
		m_info->setBaudrate(baudrate);

		// ウィンドウ座標・サイズの読み込み
		int pos_x, pos_y, size_w, size_h;
		setting.Read(L"Window", L"Maximize", maximized);
		setting.Read(L"Window", L"PosX", pos_x);
		setting.Read(L"Window", L"PosY", pos_y);
		setting.Read(L"Window", L"SizeW", size_w);
		setting.Read(L"Window", L"SizeH", size_h);
		pos_x -= 500000;
		pos_y -= 500000;
		size_w -= 500000;
		size_h -= 500000;
		if ((abs(pos_x) <= 32767) && (abs(pos_y) <= 32767)) this->move(pos_x, pos_y);
		if ((abs(size_w) <= 32767) && (abs(size_h) <= 32767)) this->resize(size_w, size_h);
	}

	// 非同期操作用スレッドを開始
	m_thread->start();

	// タイマーの精度を高める
	timeBeginPeriod(1);

	// ウィンドウを表示
	if (maximized == 0){
		this->show();
	}else{
		this->showMaximized();
	}
}

// デストラクタ
Terminal::~Terminal(){
	// デバイスを切断
	m_ds.Connect(nullptr, false);

	// 設定を保存
	clINI setting;
	if (setting.Open(g_ApplicationDir.c_str(), L"setting.ini") == true){
		// パスを保存
		std::wstring str;
		m_access->getPath('P', str);
		setting.Write(L"Path", L"Processor", str.c_str());
		m_access->getPath('B', str);
		setting.Write(L"Path", L"Bitstream", str.c_str());
		m_access->getPath('C', str);
		setting.Write(L"Path", L"Coprocessor", str.c_str());

		// 設定の保存
		setting.Write(L"Setting", L"Baudrate", std::to_wstring((long long)m_info->getBaudrate()).c_str());

		// ウィンドウ座標・サイズの保存
		setting.Write(L"Window", L"Maximize", this->isMaximized() ? 1 : 0);
		setting.Write(L"Window", L"PosX", this->pos().x() + 500000);
		setting.Write(L"Window", L"PosY", this->pos().y() + 500000);
		setting.Write(L"Window", L"SizeW", this->size().width() + 500000);
		setting.Write(L"Window", L"SizeH", this->size().height() + 500000);
	}

	// 非同期操作用スレッドを止める
	Sleep(80);
	m_thread->exit();
	Sleep(10);
	m_async->~TerminalAsync();
	Sleep(10);

	// 各部の制御クラスを削除
	delete m_console;
	delete m_info;
	delete m_access;
	delete m_logger;
	delete m_controller;
	delete m_pipe;
	delete m_file;
	
	// タイマーの精度を戻す
	timeEndPeriod(1);
}

// ウィジェットの表示情報を更新
void Terminal::updateWidgetsInfo(void){
	m_info->display(
		WCharToQString(m_ds.GetString(clDeviceState::STRING_NAME)),
		WCharToQString(m_ds.GetString(clDeviceState::STRING_VERSION)),
		m_ds.GetValue(clDeviceState::VALUE_ID)
		);
}

// 接続・切断する
void Terminal::changeConnection(const std::wstring *phy, bool connect, bool warn){
	if (connect == true){
		if (m_ds.Connect(phy, true) == true){
			// 接続した
		}else{
			if (warn == true){
				// 警告を表示
				QMessageBox::warning(this, tr("Terminal"), WCharToQString(L"デバイスが見つかりません。"));
			}
		}
	}else{
		if (m_ds.Connect(nullptr, false) == true){
			// 切断した
		}else{
			if (warn == true){
				// 警告を表示
				QMessageBox::warning(this, tr("Terminal"), WCharToQString(L"デバイスを切断できません。"));
			}
		}
	}
}

// 一定周期で呼び出される
void Terminal::onInterval(void){
	m_ds.onInterval(PERIOD);

	// コンソールの更新
	if (m_ds.RxDebug() == true){
		std::string str;
		m_ds.RxDebug(str);
		m_console->append(str);
	}


}

// デバッグ文字列を送信する
void Terminal::transmitDebug(const QString &str){
	std::string text = QStringToString(str);
	//Trace("Tx '%s'", text.c_str());
	text.append("\n");
	m_ds.TxDebug(text);
}

// 警告ダイアログを表示
void Terminal::showWarningConst(const wchar_t *title, const wchar_t *content){
	QMessageBox::warning(this, WCharToQString(title), WCharToQString(content));
}





