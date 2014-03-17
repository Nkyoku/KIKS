// INI�t�@�C���ɃA�N�Z�X����

#include "ini.h"

#include <stdio.h>
#include <stdlib.h>



// �R���X�g���N�^
clINI::clINI(void){
	return;		// �������Ȃ�
}

// �f�X�g���N�^
clINI::~clINI(void){
	Close();
}

// INI�t�@�C�����J��(�t���p�X)
bool clINI::Open(const wchar_t *path){
	int result;
	result = wcsncpy_s(m_FilePath, MAX_PATH, path, MAX_PATH);
	if (result != 0){
		m_FilePath[0] = L'\0';
	}
	return result == 0;
}

// INI�t�@�C�����J��(�f�B���N�g��+�t�@�C����)
bool clINI::Open(const wchar_t *dir, const wchar_t *name){
	int result;
	result = _wmakepath_s(m_FilePath, MAX_PATH, nullptr, dir, name, nullptr);
	if (result != 0){
		m_FilePath[0] = L'\0';
	}
	return result == 0;
}

// INI�t�@�C�������
void clINI::Close(void){
	// �������Ȃ�
}

// INI�t�@�C�����當�����ǂݎ��
void clINI::Read(const wchar_t *section, const wchar_t *key, wchar_t *dest_string, int dst_size){
	if (m_FilePath[0] != L'\0'){
		int result;
		result = GetPrivateProfileString(section, key, L"", dest_string, dst_size, m_FilePath);
		if (0 <= result){
			// ����
			return;
		}
	}
	dest_string[0] = L'\0';
}

// INI�t�@�C�����琮����ǂݎ��
void clINI::Read(const wchar_t *section, const wchar_t *key, int &dest_integer){
	if (m_FilePath[0] != L'\0'){
		dest_integer = GetPrivateProfileInt(section, key, 0, m_FilePath);
	}else{
		dest_integer = 0;
	}
}

// INI�t�@�C�����珬���_����ǂݎ��
void clINI::Read(const wchar_t *section, const wchar_t *key, double &dest_double){
	if (m_FilePath[0] != L'\0'){
		int result;
		wchar_t buf[32];
		result = GetPrivateProfileString(section, key, L"", buf, sizeof(buf), m_FilePath);
		if (0 <= result){
			// ����
			dest_double = _wtof(buf);
		}else{
			dest_double = 0.0;
		}
	}else{
		dest_double = 0.0;
	}
}

// INI�t�@�C���ɕ��������������
void clINI::Write(const wchar_t *section, const wchar_t *key, const wchar_t *sec_string){
	if (m_FilePath[0] != L'\0'){
		WritePrivateProfileString(section, key, sec_string, m_FilePath);
	}
}
#include "trace.h"
// INI�t�@�C���ɐ�������������
void clINI::Write(const wchar_t *section, const wchar_t *key, int src_integer){
	if (m_FilePath[0] != L'\0'){
		wchar_t buf[13];
		_itow_s(src_integer, buf, 10);
		Write(section, key, buf);
	}
}

// INI�t�@�C���ɏ����_������������
void clINI::Write(const wchar_t *section, const wchar_t *key, double src_double){
	if (m_FilePath[0] != L'\0'){
		wchar_t buf[32];
		swprintf_s(buf, L"%.6e", src_double);
		Write(section, key, buf);
	}
}



