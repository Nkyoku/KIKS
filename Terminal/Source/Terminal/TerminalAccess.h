// 情報タブのアクセスパネル (プロセッサ・ビットストリーム・コプロセッサパネル)

#pragma once

#include <QObject>
#include <QLineEdit>
#include <QPushButton>
#include <QString>



class TerminalAccess : public QObject{
Q_OBJECT

private:
	QLineEdit *m_ProcessorInput;
	QPushButton *m_ProcessorOpen;
	QPushButton *m_ProcessorWrite;
	QPushButton *m_ProcessorRead;

	QLineEdit *m_BitstreamInput;
	QPushButton *m_BitstreamOpen;
	QPushButton *m_BitstreamSend;
	QPushButton *m_BitstreamWrite;

	QLineEdit *m_CoprocessorInput;
	QPushButton *m_CoprocessorOpen;
	QPushButton *m_CoprocessorSend;
	QPushButton *m_CoprocessorWrite;



public:
	// コンストラクタ
	TerminalAccess(
		QLineEdit *p_input, QPushButton *p_open, QPushButton *p_write, QPushButton *p_read,
		QLineEdit *b_input, QPushButton *b_open, QPushButton *b_send, QPushButton *b_write,
		QLineEdit *c_input, QPushButton *c_open, QPushButton *c_send, QPushButton *c_write
		);
	
	// デストラクタ
	~TerminalAccess();

	// ファイルパスをセット
	void setPath(char letter, const std::wstring &path);

	// ファイルパスを取得
	void getPath(char letter, std::wstring &path);

private:
	// イベントフィルター
	bool eventFilter(QObject *obj, QEvent *event);

public slots:
	// 有効にする
	void enable(char letter, bool enable, bool idle = false, bool func1 = false, bool func2 = false);
	

private slots:
	// ファイルオープンダイアログを開く
	void openDialog(void);

	// ボタンが押された
	void buttonPushed(void);

signals:
	// 何かする
	void operation(char letter, std::wstring *path);



};
