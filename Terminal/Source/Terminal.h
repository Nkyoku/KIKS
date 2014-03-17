// GUIスレッド

#pragma once

#include <QtWidgets/QMainWindow>
#include <QThread>
#include "ui_Terminal.h"

#include "DeviceState.h"

#include "Terminal/TerminalAsync.h"
#include "Terminal/TerminalConsole.h"
#include "Terminal/TerminalAccess.h"
#include "Terminal/TerminalInfo.h"
#include "Terminal/TerminalPipe.h"
#include "Terminal/TerminalFile.h"
#include "Terminal/TerminalLogger.h"
#include "Terminal/TerminalController.h"



class Terminal : public QMainWindow{
Q_OBJECT

private:
	// 定数
	static const int PERIOD = 100;




	// UI関係
	Ui::TerminalClass m_ui;

	QThread *m_thread;

	TerminalAsync *m_async;
	TerminalConsole *m_console;
	TerminalInfo *m_info;
	TerminalAccess *m_access;
	TerminalPipe *m_pipe;
	TerminalFile *m_file;
	TerminalLogger *m_logger;
	TerminalController *m_controller;
	

	clDeviceState m_ds;


	






public:
	// コンストラクタ
	Terminal(QWidget *parent = 0);
	
	// デストラクタ
	~Terminal();

private:
	


	


private slots:
	// ウィジェットの表示情報を更新
	void updateWidgetsInfo(void);

	// 接続・切断する
	void changeConnection(const std::wstring *phy, bool connect, bool warn);

	// 一定周期で呼び出される
	void onInterval(void);

	// デバッグ文字列を送信する
	void transmitDebug(const QString &str);

	// 警告ダイアログを表示
	void showWarningConst(const wchar_t *title, const wchar_t *content);

	

	





};
