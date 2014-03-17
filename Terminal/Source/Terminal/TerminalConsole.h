// コンソール部分

#ifndef TERMINAL_CONSOLE_H
#define TERMINAL_CONSOLE_H

#include <QObject>
#include <QtWidgets/QLineEdit>
#include <QtWidgets/QPlainTextEdit>
#include <QtWidgets/QPushButton>
#include <QString>



class TerminalConsole : public QObject{
Q_OBJECT

private:
	static const int LOG_LENGTH		= 8192 * 2;
	static const int REMOVE_LENGTH	= 8192;

	QLineEdit *m_Input;
	QPlainTextEdit *m_Output;
	QPushButton *m_ButtonClear;

	QString m_log;

public:
	// コンストラクタ
	TerminalConsole(QLineEdit *input, QPlainTextEdit *output, QPushButton *clear);
	
	// デストラクタ
	~TerminalConsole();

private:
	// イベントフィルター
	bool eventFilter(QObject *obj, QEvent *event);

public slots:
	// 有効にする
	void enable(bool enable);

	// フォーカスを合わせる
	void focused(void);

	// コンソールをクリアする
	void clear(void);
	
	// コンソールに文字列を追加
	void append(const std::string &str);
	void append(const QString &str);

signals:
	// 入力が確定された
	void send(const QString &str);





};

#endif // TERMINAL_CONSOLE_H
