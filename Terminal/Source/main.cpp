// メイン

#include "Terminal.h"
#include "convqstr.h"

#include <QApplication>

#include <string>



// アプリケーションのあるディレクトリ
std::wstring g_ApplicationDir;



int main(int argc, char *argv[]){
	QApplication a(argc, argv);
	g_ApplicationDir = QStringToWString(a.applicationDirPath());
	Terminal w;
	return a.exec();
}


