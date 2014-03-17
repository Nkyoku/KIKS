/**	@file
	@brief USBのデバイスインターフェース
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
	
	// リセット要求
	enum RESET_REQ_e{
		REQ_NONE	= 0,
		REQ_DFU		= 1,
		REQ_APP		= 2,
	};
	
	extern volatile char m_ResetRequest;
	
	
	
	
	
	
	// リセット要求があるか？
	static inline char ResetRequest(void){ 
		return m_ResetRequest;
	}
	
#ifdef _APP_
	// デバッグ出力をする
	void PutDebugOut(char c);
#endif
	
	
	// USB経由でレポートの送信を要求された
	bool HIDGetReportRequest(unsigned char id, unsigned short &len, char *data);
	
	// USB経由でレポートを受信した
	void HIDSetReportRequest(unsigned char id, unsigned short len, const char *data);
	
	
	
	
	
}


#endif
