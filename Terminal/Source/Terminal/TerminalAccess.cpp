// 情報タブのアクセスパネル (プロセッサ・ビットストリーム・コプロセッサパネル)

#include "TerminalAccess.h"
#include "trace.h"
#include "convqstr.h"

#include <QFileDialog>
#include <QEvent>
#include <QDropEvent>
#include <QMimeData>

#include <string>



// コンストラクタ
TerminalAccess::TerminalAccess(
	QLineEdit *p_input, QPushButton *p_open, QPushButton *p_write, QPushButton *p_read,
	QLineEdit *b_input, QPushButton *b_open, QPushButton *b_send, QPushButton *b_write,
	QLineEdit *c_input, QPushButton *c_open, QPushButton *c_send, QPushButton *c_write
	) :
	m_ProcessorInput(p_input), m_ProcessorOpen(p_open), m_ProcessorWrite(p_write), m_ProcessorRead(p_read),
	m_BitstreamInput(b_input), m_BitstreamOpen(b_open), m_BitstreamSend(b_send), m_BitstreamWrite(b_write),
	m_CoprocessorInput(c_input), m_CoprocessorOpen(c_open), m_CoprocessorSend(c_send), m_CoprocessorWrite(c_write)
{
	// イベントフィルターをインストール
	m_ProcessorInput->installEventFilter(this);
	m_BitstreamInput->installEventFilter(this);
	m_CoprocessorInput->installEventFilter(this);

	// シグナルを接続
	connect(m_ProcessorOpen, SIGNAL(clicked()), this, SLOT(openDialog()));
	connect(m_BitstreamOpen, SIGNAL(clicked()), this, SLOT(openDialog()));
	connect(m_CoprocessorOpen, SIGNAL(clicked()), this, SLOT(openDialog()));
	connect(m_ProcessorWrite, SIGNAL(clicked()), this, SLOT(buttonPushed()));
	connect(m_ProcessorRead, SIGNAL(clicked()), this, SLOT(buttonPushed()));
	connect(m_BitstreamSend, SIGNAL(clicked()), this, SLOT(buttonPushed()));
	connect(m_BitstreamWrite, SIGNAL(clicked()), this, SLOT(buttonPushed()));
	connect(m_CoprocessorSend, SIGNAL(clicked()), this, SLOT(buttonPushed()));
	connect(m_CoprocessorWrite, SIGNAL(clicked()), this, SLOT(buttonPushed()));


	

}

// デストラクタ
TerminalAccess::~TerminalAccess(){

}

// ファイルパスをセット
void TerminalAccess::setPath(char letter, const std::wstring &path){
	switch(letter){
	case 'P':
		m_ProcessorInput->setText(WStringToQString(path));
		break;

	case 'B':
		m_BitstreamInput->setText(WStringToQString(path));
		break;

	case 'C':
		m_CoprocessorInput->setText(WStringToQString(path));
		break;
	}
}

// ファイルパスを取得
void TerminalAccess::getPath(char letter, std::wstring &path){
	switch(letter){
	case 'P':
		path = QStringToWString(m_ProcessorInput->text());
		break;

	case 'B':
		path = QStringToWString(m_BitstreamInput->text());
		break;

	case 'C':
		path = QStringToWString(m_CoprocessorInput->text());
		break;
	}
}

// イベントフィルター
bool TerminalAccess::eventFilter(QObject *obj, QEvent *event){
	if ((obj != m_ProcessorInput) &&
		(obj != m_BitstreamInput) &&
		(obj != m_CoprocessorInput)) return false;

	// ドラッグ＆ドロップを処理する
	if (event->type() == QEvent::DragEnter){
		QDragEnterEvent *dragEnterEvent = (QDragEnterEvent*)event;
		dragEnterEvent->acceptProposedAction();
		return true;
	}else if (event->type() == QEvent::DragMove){
		QDragMoveEvent *dragMoveEvent = (QDragMoveEvent*)event;
		dragMoveEvent->acceptProposedAction();
		return true;
	}else if (event->type() == QEvent::Drop){
		QDropEvent *dropEvent = (QDropEvent*)event;
		QString file;
		file = dropEvent->mimeData()->urls().first().toLocalFile();
		QLineEdit *input = (QLineEdit*)obj;
		input->setText(file);
		return true;
	}
	return false;
}

// 有効にする
void TerminalAccess::enable(char letter, bool enable, bool idle, bool func1, bool func2){
	enable &= idle;
	func1 &= enable;
	func2 &= enable;
	switch(letter){
	case 'P':
		m_ProcessorInput->setEnabled(enable);
		m_ProcessorOpen->setEnabled(enable);
		m_ProcessorWrite->setEnabled(func1);
		m_ProcessorRead->setEnabled(func2);
		break;

	case 'B':
		m_BitstreamInput->setEnabled(enable);
		m_BitstreamOpen->setEnabled(enable);
		m_BitstreamSend->setEnabled(func1);
		m_BitstreamWrite->setEnabled(func2);
		break;

	case 'C':
		m_CoprocessorInput->setEnabled(enable);
		m_CoprocessorOpen->setEnabled(enable);
		m_CoprocessorSend->setEnabled(func1);
		m_CoprocessorWrite->setEnabled(func2);
		break;
	}
}

// ファイルオープンダイアログを開く
void TerminalAccess::openDialog(void){
	QString title, filter;
	QObject *sender = QObject::sender();
	QLineEdit *input;
	if (sender == m_ProcessorOpen){
		title = WCharToQString(L"ファームウェアを選択してください。");
		filter = WCharToQString(L"HEXファイル(*.hex)\nすべてのファイル(*.*)");
		input = m_ProcessorInput;
	}else if (sender == m_BitstreamOpen){
		title = WCharToQString(L"ビットストリームを選択してください。");
		filter = WCharToQString(L"BITファイル(*.bit)\nすべてのファイル(*.*)");
		input = m_BitstreamInput;
	}else if (sender == m_CoprocessorOpen){
		title = WCharToQString(L"ファームウェアを選択してください。");
		filter = WCharToQString(L"HEXファイル(*.hex)\nすべてのファイル(*.*)");
		input = m_CoprocessorInput;
	}else{
		return;
	}

	QString select = QFileDialog::getOpenFileName(input, title, QDir::currentPath(), filter);
	if (select.isEmpty() == false){
		input->setText(select);
	}
}

// ボタンが押された
void TerminalAccess::buttonPushed(void){
	char letter;
	QString q_path;
	QObject *sender = QObject::sender();
	if (sender == m_ProcessorWrite){
		q_path = m_ProcessorInput->text();
		letter = 'p';
	}else if (sender == m_ProcessorRead){
		QString title, filter;
		title = WCharToQString(L"保存先のファイルを入力してください。");
		filter = WCharToQString(L"BINファイル(*.bin)\nすべてのファイル(*.*)");
		q_path = QFileDialog::getSaveFileName(m_ProcessorInput, title, QDir::currentPath(), filter);
		letter = 'P';
	}else if (sender == m_BitstreamSend){
		q_path = m_BitstreamInput->text();
		letter = 'b';
	}else if (sender == m_BitstreamWrite){
		q_path = m_BitstreamInput->text();
		letter = 'B';
	}else if (sender == m_CoprocessorSend){
		q_path = m_CoprocessorInput->text();
		letter = 'c';
	}else if (sender == m_CoprocessorWrite){
		q_path = m_CoprocessorInput->text();
		letter = 'C';
	}else{
		return;
	}

	if (q_path.isEmpty() == false){
		std::wstring *path = new std::wstring();
		*path = QStringToWString(q_path);
		emit operation(letter, path);
	}
}


