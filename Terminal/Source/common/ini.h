// INI�t�@�C���ɃA�N�Z�X����

#pragma once

#include <Windows.h>

#include <string>



// �A�v���P�[�V�����̂���f�B���N�g��
extern std::wstring g_ApplicationDir;



class clINI{
private:
	// INI�t�@�C���̃p�X
	wchar_t m_FilePath[MAX_PATH];

public:
	// �R���X�g���N�^
	clINI(void);

	// �f�X�g���N�^
	~clINI(void);

	// INI�t�@�C�����J��
	bool Open(const wchar_t *path);
	bool Open(const wchar_t *dir, const wchar_t *name);

	// INI�t�@�C�������
	void Close(void);

	// INI�t�@�C�����當�����ǂݎ��
	void Read(const wchar_t *section, const wchar_t *key, wchar_t *dest_string, int dst_size = MAX_PATH);

	// INI�t�@�C�����琮����ǂݎ��
	void Read(const wchar_t *section, const wchar_t *key, int &dest_integer);

	// INI�t�@�C�����珬���_����ǂݎ��
	void Read(const wchar_t *section, const wchar_t *key, double &dest_double);

	// INI�t�@�C���ɕ��������������
	void Write(const wchar_t *section, const wchar_t *key, const wchar_t *sec_string);

	// INI�t�@�C���ɐ�������������
	void Write(const wchar_t *section, const wchar_t *key, int src_integer);

	// INI�t�@�C���ɏ����_������������
	void Write(const wchar_t *section, const wchar_t *key, double src_double);
};





