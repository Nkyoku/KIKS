// 情報表示パネルとステータスバー

#ifndef TERMINAL_INFO_H
#define TERMINAL_INFO_H

#include <QObject>
#include <QStatusBar>
#include <QGraphicsView>
#include <QLabel>
#include <QPushButton>
#include <QComboBox>
#include <QProgressBar>
#include <QActionGroup>
#include <QMenu>
#include <QString>
#include <QGraphicsScene>



class TerminalInfo : public QObject{
Q_OBJECT
	
private:
	QGraphicsView *m_IconDevice;
	QStatusBar *m_StatusBar;
	QLabel *m_LabelName;
	QLabel *m_LabelVersion;
	QPushButton *m_ButtonReboot;
	QPushButton *m_ButtonConnect;
	QPushButton *m_ButtonDisconnect;
	QProgressBar *m_Progress;
	QLabel *m_StatusName;
	QLabel *m_StatusVersion;
	QLabel *m_StatusDebug;

	bool m_Connected;
	
	QGraphicsScene *m_Scene;
	QActionGroup *m_PhyGroup;
	QAction *m_RebootActionDFU;
	QAction *m_RebootActionAPP;
	QAction *m_RebootActionSafeAPP;



public:
	// コンストラクタ
	TerminalInfo(QStatusBar *status, QGraphicsView *icon, QLabel *name, QLabel *version,
		QPushButton *reboot, QPushButton *connect_, QPushButton *disconnect_);
	
	// デストラクタ
	~TerminalInfo();

	// 表示を変更
	void display(QString &name, QString &version, int id);

	// アイコンを描画
	void drawIcon(unsigned int id);

private:
	// COMポートを列挙して追加
	void EnumCOMPort(void);



public slots:
	// 有効にする
	void enable(bool enable, bool idle);

	// デバッグ情報を更新
	void setDebugText(QString &text);

	// プログレスバーの値を変更
	void setProgress(int value);

private slots:
	// 接続メニューが押された
	void connectPushed(QAction *action);

	// 切断ボタンが押された
	void disconnectPushed(void);

	// 再起動ボタンが押された
	void rebootPushed(QAction *action);

signals:
	// 接続・切断する
	void changeConnection(const std::wstring *phy, bool connect, bool warn);

	// 再起動の要求
	void rebootRequest(const wchar_t *mode);






};

#endif // TERMINAL_INFO_H
