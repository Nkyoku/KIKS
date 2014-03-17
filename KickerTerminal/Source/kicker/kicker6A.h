// ��6���ナ�r�W����A�̃L�b�J�[���Ǘ�����N���X

#pragma once

#include "kicker.h"

#include <Windows.h>

#include <deque>
#include <algorithm>



class clKicker6A : public iKicker{
	friend class iKicker;

	/* �萔 */
protected:
	static const int USB_VID	= 0x16C0;
	static const int USB_PID	= 0x05DF;
	static const int USB_REV	= 0x0601;

	//static const int TIMEOUT	= 1000;		// �R���g���[���]���̃^�C���A�E�g����[ms]

	// �R�}���h�ꗗ
	enum CMDID_e{
		CMDID_GET_NAME		= 1,
		CMDID_RESET			= 2,
		CMDID_STRING		= 3,
		CMDID_SET_PAGE		= 10,
		CMDID_READ			= 11,
		CMDID_WRITE			= 12,
		CMDID_WRITE_EEPROM	= 13,
	};

	

	// �t�@�[���E�F�A
	static const int XMEGA_PAGE_SIZE	= 256;			// �y�[�W�T�C�Y
	static const int XMEGA_APP_SIZE		= 32 * 1024;	// �A�v���P�[�V�����̈�̃T�C�Y
	static const int XMEGA_APP_PAGES	= XMEGA_APP_SIZE / XMEGA_PAGE_SIZE;
	static const unsigned int XMEGA_APP_START	= 0x00000000;

	static const int XMEGA_EEPROM_PAGE_SIZE	= 32;		// EEPROM�̃y�[�W�T�C�Y
	static const int XMEGA_EEPROM_SIZE	= 1024;			// EEPROM�̃T�C�Y
	static const int XMEGA_EEPROM_PAGES	= XMEGA_EEPROM_SIZE / XMEGA_EEPROM_PAGE_SIZE;


	/* �����o�[�ϐ� */
protected:
	MODE_e m_Mode;
	
	


	

	/* ���\�b�h */
protected:
	// USB�̏����r����
	static bool Compare(int usb_vid, int usb_pid, int usb_rev);

protected:
	// �R���X�g���N�^
	clKicker6A(HANDLE hdev, HANDLE husb);

public:
	// �f�X�g���N�^
	virtual ~clKicker6A();

	// �f�o�C�X���ڑ�����Ă��邩
	virtual bool IsConnected(void) override;

	// ���샂�[�h��ύX����
	virtual bool ChangeMode(MODE_e mode) override;

	// �o�[�W�������擾
	virtual bool GetVersion(VERSION_t &devinfo) override;
	
	// �f�o�b�O�o�͂��擾
	virtual bool GetString(std::wstring &text) override;

	// ���[�U�[�̈������������
	virtual bool UserWriteBIN(const std::wstring &file) override;

	// �t���b�V��������������
	virtual bool FlashWriteHEX(const std::wstring &file) override;
	
	// �t���b�V����ǂݏo��
	virtual bool FlashReadBIN(const std::wstring &file) override;











};
