// �}�V�����Ǘ�����N���X

#pragma once

#include <Windows.h>
#include <string>
#include <vector>

//#include "request.h"
//#include "adler32.h"




// ���샂�[�h
enum MODE_e{
	MODE_DFU,			// DFU���[�h
	MODE_APP,			// APP���[�h
};

// �o�[�W�������Ǘ�����\����
struct VERSION_t{
	int Version;
	int Revision;
	MODE_e Mode;
};






// �L�b�J�[���Ǘ�����C���^�[�t�F�[�X
class iKicker abstract{

	/* �萔�E��` */
protected:
	static const GUID INTERFACE_GUID;	// �f�o�C�X�̃C���^�[�t�F�[�XGUID


	/* �ϐ� */
public:
	HANDLE m_hDevice;	// �f�o�C�X�̃n���h��
	HANDLE m_hWinUSB;
	



	/* �����o�[ */
protected:
	// �R���X�g���N�^
	iKicker(HANDLE hdev, HANDLE husb);

public:
	// �f�X�g���N�^
	virtual ~iKicker();

	// �L�b�J�[����������
	static iKicker* Search(void);

	// �L�b�J�[���ڑ�����Ă��邩
	virtual bool IsConnected(void) = 0;

	// ���샂�[�h��ύX����
	virtual bool ChangeMode(MODE_e mode) = 0;

	// �o�[�W�������擾
	virtual bool GetVersion(VERSION_t &devinfo) = 0;

	// �f�o�b�O�o�͂��擾
	virtual bool GetString(std::wstring &text) = 0;

	// ���[�U�[�̈������������
	virtual bool UserWriteBIN(const std::wstring &file) = 0;

	// �t���b�V��������������
	virtual bool FlashWriteHEX(const std::wstring &file) = 0;
	
	// �t���b�V����ǂݏo��
	virtual bool FlashReadBIN(const std::wstring &file) = 0;




protected:
	// �f�[�^�𑗐M
	virtual bool Transmit(int cmdid, unsigned int length, const void *data, unsigned int *transfered = nullptr);
	
	// �f�[�^����M
	virtual bool Receive(int cmdid, unsigned int length, void *data, unsigned int *transfered = nullptr);




protected:
	// �n���h�����������
	static void SafeClose(HANDLE &h){
		if (h != NULL){
			CloseHandle(h);
			h = NULL;
		}
	}


};
