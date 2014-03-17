// パイプ一覧を表示

#include "TerminalPipe.h"
#include "trace.h"
#include "convqstr.h"

#include <QString>
#include <QFileIconProvider>



// コンストラクタ
TerminalPipe::TerminalPipe(QTableWidget *table) : m_Table(table){
	// カラムの設定
	m_Table->setRowCount(0);
	m_Table->setColumnCount(4);

	//QFileIconProvider icon_provider;
	QTableWidgetItem *item0 = new QTableWidgetItem(WCharToQString(L"パイプ"));
	//item0->setIcon(icon_provider.icon(QFileIconProvider::Network));
	m_Table->setHorizontalHeaderItem(0, item0);
	m_Table->setHorizontalHeaderItem(1, new QTableWidgetItem(WCharToQString(L"サイズ")));
	m_Table->setHorizontalHeaderItem(2, new QTableWidgetItem(WCharToQString(L"単位")));
	m_Table->setHorizontalHeaderItem(3, new QTableWidgetItem(WCharToQString(L"アクセス修飾子")));

	m_Table->setColumnWidth(0, 150);
	m_Table->setColumnWidth(1, 75);
	m_Table->setColumnWidth(2, 75);


}
	
// デストラクタ
TerminalPipe::~TerminalPipe(){

}

// パイプリストをクリア
void TerminalPipe::clearPipe(void){
	//m_Table->clearContents();
	m_Table->setRowCount(0);

}

// パイプリストに追加
void TerminalPipe::addPipe(const wchar_t *name, int size, int unit, const wchar_t *modifiers){
	int row_count = m_Table->rowCount();

	// 行を追加
	m_Table->insertRow(row_count);

	// 内容を設定
	m_Table->setRowHeight(row_count, 20);

	m_Table->setItem(row_count, 0, new QTableWidgetItem(WCharToQString(name)));
	m_Table->setItem(row_count, 1, new QTableWidgetItem(QString::number(size)));
	m_Table->setItem(row_count, 2, new QTableWidgetItem(QString::number(unit)));
	m_Table->setItem(row_count, 3, new QTableWidgetItem(WCharToQString(modifiers)));
	//m_Table->item(row_count, 0)->setTextAlignment(Qt::AlignLeft | Qt::AlignVCenter);
	m_Table->item(row_count, 1)->setTextAlignment(Qt::AlignRight | Qt::AlignVCenter);
	m_Table->item(row_count, 2)->setTextAlignment(Qt::AlignRight | Qt::AlignVCenter);
	m_Table->item(row_count, 3)->setTextAlignment(Qt::AlignRight | Qt::AlignVCenter);

	QFileIconProvider icon_provider;
	m_Table->item(row_count, 0)->setIcon(icon_provider.icon(QFileIconProvider::Network));
}







