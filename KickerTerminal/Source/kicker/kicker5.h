// ��6���ナ�r�W����A�̃L�b�J�[���Ǘ�����N���X

#pragma once

#include "kicker6A.h"



class clKicker5 : public clKicker6A{
	friend class iKicker;

	/* �萔 */
protected:
	static const int USB_REV	= 0x0501;
	
	
	
	/* �����o�[�ϐ� */
	


	

	/* ���\�b�h */
protected:
	// USB�̏����r����
	static bool Compare(int usb_vid, int usb_pid, int usb_rev);

protected:
	// �R���X�g���N�^
	clKicker5(HANDLE hdev, HANDLE husb);

public:
	// �f�X�g���N�^
	virtual ~clKicker5();
	
	// �o�[�W�������擾
	virtual bool GetVersion(VERSION_t &version) override;
	
	// ���[�U�[�̈������������
	virtual bool UserWriteBIN(const std::wstring &file) override;

};
