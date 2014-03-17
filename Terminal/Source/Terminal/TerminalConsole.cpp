// コンソール部分

#include "TerminalConsole.h"
#include "trace.h"
#include "convqstr.h"

#include <QEvent>
#include <QKeyEvent>



// コンストラクタ
TerminalConsole::TerminalConsole(QLineEdit *input, QPlainTextEdit *output, QPushButton *clear)
	: m_Input(input), m_Output(output), m_ButtonClear(clear)
{
	// イベントフィルターをインストール
	m_Input->installEventFilter(this);

	// 各ウィジェットのシグナルを接続
	connect(m_ButtonClear, SIGNAL(clicked()), this, SLOT(clear()));



	
	

	


}

// デストラクタ
TerminalConsole::~TerminalConsole(){

}

// イベントフィルター
bool TerminalConsole::eventFilter(QObject *obj, QEvent *event){
	if (obj != m_Input) return false;

	if (event->type() == QEvent::KeyPress){
		QKeyEvent *keyEvent = (QKeyEvent*)event;
		if (keyEvent->isAutoRepeat()){
			// コマンドのオートリピートは無視
			switch(keyEvent->key()){
			case Qt::Key_Return:
			case Qt::Key_Escape:
			case Qt::Key_Up:
			case Qt::Key_Down:
				return true;
			default:
				return false;	// イベントをスルー
			}
		}
		switch(keyEvent->key()){
		case Qt::Key_Return:
			{
				// 入力を送る
				emit send(m_Input->text());
				m_Input->clear();
			}
			break;
		case Qt::Key_Escape:
			// 入力を削除
			m_Input->clear();
			break;
		case Qt::Key_Up:
			// 履歴を前に
			
			break;
		case Qt::Key_Down:
			// 履歴を後に

			break;
		default:
			return false;	// イベントをスルー
		}
		return true;
	}
	return false;
}

// 有効にする
void TerminalConsole::enable(bool enable){
	m_Input->setEnabled(enable);
	// consoleOutputとconsoleButtonClearは常に有効
}

// フォーカスを合わせる
void TerminalConsole::focused(void){
	m_Input->setFocus();
}

// コンソールをクリアする
void TerminalConsole::clear(void){
	m_log.clear();
	m_Output->clear();
}

// コンソールに文字列を追加
void TerminalConsole::append(const std::string &str){
	m_log += CharToQString(str.c_str());
	if (LOG_LENGTH < m_log.length()){
		m_log.remove(0, REMOVE_LENGTH);
	}
	m_Output->setPlainText(m_log);
	//m_Output->ensureCursorVisible();

	QTextCursor cursor =  m_Output->textCursor();
	cursor.movePosition(QTextCursor::End);
	m_Output->setTextCursor(cursor);

}
void TerminalConsole::append(const QString &str){
	m_log += str;
	if (LOG_LENGTH < m_log.length()){
		m_log.remove(0, REMOVE_LENGTH);
	}
	m_Output->setPlainText(m_log);
	m_Output->ensureCursorVisible();
}

