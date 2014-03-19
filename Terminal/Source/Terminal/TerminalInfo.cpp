// 情報表示パネルとステータスバー

#include "TerminalInfo.h"
#include "trace.h"
#include "convqstr.h"

#include <Windows.h>
#include <SetupAPI.h>

#include <QMenu>
#include <QRectF>
#include <QPen>
#include <QBrush>
#include <QPainterPath>
#include <QGraphicsTextItem>
#include <QTextCursor>
#include <QTextBlockFormat>
#include <QInputDialog>



// コンストラクタ
TerminalInfo::TerminalInfo(QStatusBar *status, QGraphicsView *icon, QLabel *name, QLabel *version,
		QPushButton *reboot, QPushButton *connect_, QPushButton *disconnect_)
	: m_StatusBar(status), m_IconDevice(icon), m_LabelName(name), m_LabelVersion(version),
	m_ButtonReboot(reboot), m_ButtonConnect(connect_), m_ButtonDisconnect(disconnect_), m_Connected(false),
	m_PhyActionBaudrate(nullptr), m_Baudrate(9600)
{
	// ステータスバーにアイテムを作成
	m_Progress = new QProgressBar();
	m_Progress->setMinimumSize(QSize(64, 0));
	m_Progress->setAlignment(Qt::AlignCenter);
	m_StatusName = new QLabel();
	m_StatusVersion = new QLabel();
	m_StatusDebug = new QLabel();
	m_StatusBar->addWidget(m_Progress, 1);
	m_StatusBar->addWidget(m_StatusName, 2);
	m_StatusBar->addWidget(m_StatusVersion, 2);
	m_StatusBar->addWidget(m_StatusDebug, 2);

	// 接続ボタンにつけるメニューを作成
	QMenu *c_menu = new QMenu();
	m_ButtonConnect->setMenu(c_menu);
	m_PhyGroup = new QActionGroup(c_menu);
	
	// 再起動ボタンにつけるメニューを作成
	QMenu *r_menu = new QMenu();
	m_ButtonReboot->setMenu(r_menu);
	m_RebootActionDFU = r_menu->addAction(tr("DFU Mode"));
	m_RebootActionAPP = r_menu->addAction(tr("APP Mode"));
	m_RebootActionSafeAPP = r_menu->addAction(tr("SafeAPP Mode"));

	// アイコン表示用のシーンの作成
	m_Scene = new QGraphicsScene(this);
	m_IconDevice->setScene(m_Scene);
	
	// シグナルを接続
	connect(c_menu, SIGNAL(triggered(QAction *)), this, SLOT(connectPushed(QAction *)));
	connect(m_ButtonDisconnect, SIGNAL(clicked()), this, SLOT(disconnectPushed()));
	connect(r_menu, SIGNAL(triggered(QAction *)), this, SLOT(rebootPushed(QAction *)));
	


	// 接続ボタンにUSBを追加
	QAction *usb_action;
	usb_action = c_menu->addAction(tr("USB"));
	usb_action->setCheckable(true);
	usb_action->setActionGroup(m_PhyGroup);
	m_ActionMap[usb_action] = L"USB";

	// 接続ボタンにCOMポートを追加
	EnumCOMPort();
}

// デストラクタ
TerminalInfo::~TerminalInfo(){

}

// 表示を変更
void TerminalInfo::display(QString &name, QString &version, int id){
	if (m_Connected == true){
		m_LabelName->setText(name);
		m_StatusName->setText(name);
		m_LabelVersion->setText(version);
		m_StatusVersion->setText(version);

		drawIcon(id);
	}
}

// アイコンを描画
void TerminalInfo::drawIcon(unsigned int id){
	static const char table[12] = {
		0x2, 0xA, 0xE, 0x6, 0x1, 0x9, 0xD, 0x5, 0xF, 0x0, 0x3, 0xC
	};

	if (12 <= id){
		m_Scene->clear();
		return;
	}

	// リソース作成
	QPen pen(QColor::fromRgb(0, 0, 0, 0));
	QBrush black_brush(QColor::fromRgb(16, 16, 16));
	QBrush green_brush(QColor::fromRgb(32, 224, 32));
	QBrush purple_brush(QColor::fromRgb(224, 32, 224));
	QBrush blue_brush(QColor::fromRgb(32, 64, 255));

	// 描画
	QPainterPath path;
	path.moveTo(32, 10);
	path.arcTo(0, 0, 64, 64, 137.5, 265);
	m_Scene->addPath(path, pen, black_brush);
	m_Scene->addEllipse(6, 12, 12, 12, pen, table[id] & 0x8 ? green_brush : purple_brush);
	m_Scene->addEllipse(46, 12, 12, 12, pen, table[id] & 0x4 ? green_brush : purple_brush);
	m_Scene->addEllipse(14, 47, 12, 12, pen, table[id] & 0x2 ? green_brush : purple_brush);
	m_Scene->addEllipse(38, 47, 12, 12, pen, table[id] & 0x1 ? green_brush : purple_brush);

	// ID文字を描画
	QGraphicsTextItem *text;
	text = m_Scene->addText(tr("ID:") + QString::number(id));
	text->setDefaultTextColor(Qt::white);
	QRectF rect = text->boundingRect();
	text->setPos(32 - rect.right() / 2, 36 - rect.bottom() / 2);
}

// COMポートを列挙して追加
void TerminalInfo::EnumCOMPort(void){
	bool detect = false;

	// 存在するCOMポートを列挙
	HDEVINFO hDevinfo;
	hDevinfo = SetupDiGetClassDevs(&GUID_CLASS_COMPORT, NULL, NULL, DIGCF_PRESENT | DIGCF_DEVICEINTERFACE);

	for(int cnt = 0; cnt < 255; cnt++){
		int result;
		SP_DEVICE_INTERFACE_DATA sp_dif;
		SP_DEVINFO_DATA sp_did;
		sp_dif.cbSize = sizeof(sp_dif);
		sp_did.cbSize = sizeof(SP_DEVINFO_DATA);

		result = SetupDiEnumDeviceInterfaces(hDevinfo, NULL, &GUID_CLASS_COMPORT, cnt, &sp_dif);
		if (result == FALSE) break;
		
		int size = 0;
		SetupDiGetDeviceInterfaceDetail(hDevinfo, &sp_dif, NULL, NULL, (DWORD*)&size, NULL);
		
		SP_DEVICE_INTERFACE_DETAIL_DATA *sp_didd;
		sp_didd = (SP_DEVICE_INTERFACE_DETAIL_DATA*)malloc(size);
		sp_didd->cbSize = sizeof(SP_DEVICE_INTERFACE_DETAIL_DATA);

		SetupDiGetDeviceInterfaceDetail(hDevinfo, &sp_dif, sp_didd, size, NULL, &sp_did);
		
		// COMポートの名前を取得
		wchar_t port_name[MAX_PATH];
		result = SetupDiGetDeviceRegistryProperty(hDevinfo, &sp_did, SPDRP_FRIENDLYNAME, NULL, (BYTE*)port_name, MAX_PATH, NULL);
		if (result == TRUE){
			// 成功

			// COMポートの番号を取得
			HKEY hKey;
			hKey = SetupDiOpenDevRegKey(hDevinfo, &sp_did, DICS_FLAG_GLOBAL, 0, DIREG_DEV, KEY_READ);
			if (hKey != NULL){
				wchar_t port_number[MAX_PATH];
				DWORD reg_type, reg_length = sizeof(port_number);
				result = RegQueryValueEx(hKey, L"PortName", 0, &reg_type, (BYTE*)port_number, &reg_length);
				RegCloseKey(hKey);
				if (result == ERROR_SUCCESS){
					// メニューに追加していく
					QString text;
					text = WCharToQString(port_number) + " : " + WCharToQString(port_name);
					//Trace(L"COMポート '%s', '%s'", port_number, port_name);

					QAction *new_action;
					new_action = m_ButtonConnect->menu()->addAction(text);
					new_action->setCheckable(true);
					new_action->setActionGroup(m_PhyGroup);
					m_ActionMap[new_action] = port_number;

					detect = true;
				}
			}
		}
		free(sp_didd);
	}
	SetupDiDestroyDeviceInfoList(hDevinfo);

	if (detect == true){
		// COMポートが1つ以上見つかったら、ボーレートの設定ダイアログを出す項目を追加
		m_ButtonConnect->menu()->addSeparator();
		m_PhyActionBaudrate = m_ButtonConnect->menu()->addAction(WCharToQString(L"ボーレート設定..."));
	}
}

// 有効にする
void TerminalInfo::enable(bool enable, bool idle){
	m_Connected = enable;

	m_ButtonConnect->setEnabled(!enable);
	m_ButtonDisconnect->setEnabled(enable & idle);
	m_ButtonReboot->setEnabled(enable & idle);

	if (enable == false){
		QString text = WCharToQString(L"未接続");
		m_LabelName->setText(text);
		m_StatusName->setText(text);
		m_LabelVersion->clear();
		m_StatusVersion->clear();
		drawIcon(-1);
	}
}

// デバッグ情報を更新
void TerminalInfo::setDebugText(QString &text){
	m_StatusDebug->setText(text);
}

// プログレスバーの値を変更
void TerminalInfo::setProgress(int value){
	if (value < 0){
		m_Progress->setValue(0);
		m_Progress->setTextVisible(false);
	}else{
		m_Progress->setValue(value);
		m_Progress->setTextVisible(true);
	}
}

// 接続メニューが押された
void TerminalInfo::connectPushed(QAction *action){
	//Trace(L"Triggered '%s'", QStringToWString(action->text()).c_str());
	auto it = m_ActionMap.find(action);
	if (it != m_ActionMap.end()){
		// 接続
		std::wstring text = it->second;
		if (text.find_first_of(L"COM", 0) == 0){
			// COMポートだったら後ろにボーレートを付与
			text.append(L":");
			text.append(std::to_wstring((long long)m_Baudrate));
		}
		emit changeConnection(&text, true, true);
	}else{
		if (action == m_PhyActionBaudrate){
			// ボーレートの設定ダイアログ
			m_Baudrate = QInputDialog::getInt(m_ButtonConnect, WCharToQString(L"ボーレートの設定"), WCharToQString(L"ボーレート"), m_Baudrate, 0);
		}
	}
}

// 切断ボタンが押された
void TerminalInfo::disconnectPushed(void){
	emit changeConnection(nullptr, false, true);
}

// 再起動ボタンが押された
void TerminalInfo::rebootPushed(QAction *action){
	const wchar_t *mode;
	if (action == m_RebootActionDFU){
		mode = L"DFU";
	}else if (action == m_RebootActionAPP){
		mode = L"APP";
	}else if (action == m_RebootActionSafeAPP){
		mode = L"SafeAPP";
	}else{
		return;
	}
	emit rebootRequest(mode);
}






