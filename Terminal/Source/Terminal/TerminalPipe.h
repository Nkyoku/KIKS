// パイプ一覧を表示

#ifndef TERMINAL_PIPE_H
#define TERMINAL_PIPE_H

#include "../device/device.h"

#include <QObject>
#include <QtWidgets/QTableWidget>



class TerminalPipe : public QObject{
Q_OBJECT
	
private:
	QTableWidget *m_Table;
	
	
	
	


public:
	// コンストラクタ
	TerminalPipe(QTableWidget *table);
	
	// デストラクタ
	~TerminalPipe();



public slots:
	// パイプリストをクリア
	void clearPipe(void);

	// パイプリストに追加
	void addPipe(const wchar_t *name, int size, int unit, const wchar_t *modifiers);

	


};

#endif // TERMINAL_PIPE_H
