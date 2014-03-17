/**	@file
	@brief USB�̃f�o�C�X�C���^�[�t�F�[�X
*/

#ifndef USBIF_H_
#define USBIF_H_







namespace USBIF{
	
	
	enum CMDID_e{
		CMDID_GET_NAME		= 1,
		CMDID_RESET			= 2,
		CMDID_STRING		= 3,
		CMDID_SET_PAGE		= 10,
		CMDID_READ			= 11,
		CMDID_WRITE			= 12,
		CMDID_WRITE_EEPROM	= 13,
	};
	
	// ���Z�b�g�v��
	enum RESET_REQ_e{
		REQ_NONE	= 0,
		REQ_DFU		= 1,
		REQ_APP		= 2,
	};
	
	extern volatile char m_ResetRequest;
	
	
	
	
	
	
	// ���Z�b�g�v�������邩�H
	static inline char ResetRequest(void){ 
		return m_ResetRequest;
	}
	
#ifdef _APP_
	// �f�o�b�O�o�͂�����
	void PutDebugOut(char c);
#endif
	
	
	// USB�o�R�Ń��|�[�g�̑��M��v�����ꂽ
	bool HIDGetReportRequest(unsigned char id, unsigned short &len, char *data);
	
	// USB�o�R�Ń��|�[�g����M����
	void HIDSetReportRequest(unsigned char id, unsigned short len, const char *data);
	
	
	
	
	
}


#endif
