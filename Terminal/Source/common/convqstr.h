// char, wchar_tとQStringの変換

#pragma once

#include <QString>
#include <string>

// wchar_t→QString
#define WCharToQString(text) QString::fromUtf16((const unsigned short*)(text))
	
// char→QString
#define CharToQString(text) QString::fromLocal8Bit(text)

// QString→std::string
inline std::string QStringToString(const QString &qstr){
	QByteArray buf = qstr.toLocal8Bit();
	std::string str = buf.constData();
	return str;
}

// QString→std::wstring
#define QStringToWString(qstr) ((qstr).toStdWString())

// std::string→QString
#define StringToQString(str) QString::fromLocal8Bit(str.c_str())

// std::wstring→QString
#define WStringToQString(wstr) QString::fromUtf16((const unsigned short*)(wstr.c_str()))








