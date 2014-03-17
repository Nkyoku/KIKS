/**	@file
	@brief APP���[�h��DFU���[�h�̐؂�ւ�
*/

#include "../define.h"



namespace Mode{
	
	// �t���O�������Ă����APP���[�h�փW�����v
	void JumpToAPPIfNecessary(void){
		unsigned char status = RST.STATUS;
		RST.STATUS = 0x3F;
		if (status & RST_WDRF_bm){
			// ���Z�b�g�v����WDT�̂Ƃ��́A�A�v���P�[�V�����ɃW�����v
			__asm__ __volatile__("jmp 0");
			while(true);
		}
	}
	
	// DFU���[�h�ֈڍs
	NORETURN SwitchToDFU(void){
		cli();
		CCP = CCP_IOREG_gc;
		RST.CTRL = RST_SWRST_bm;	// �\�t�g�E�F�A���Z�b�g
		while(true);
	}
	
	// APP���[�h�ֈڍs
	NORETURN SwitchToAPP(void){
		cli();
		WriteProtectedIOREG(&WDT.CTRL, WDT_PER_8CLK_gc | WDT_ENABLE_bm | WDT_CEN_bm);
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		WriteProtectedIOREG(&WDT.WINCTRL, WDT_WPER_8KCLK_gc | WDT_WEN_bm | WDT_WCEN_bm);
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		__asm__ __volatile__("wdr");	// WDT���Z�b�g���̈ӂɋN����
		/*CCP = CCP_IOREG_gc;
		WDT.CTRL = WDT_PER_8CLK_gc | WDT_ENABLE_bm | WDT_CEN_bm;
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		CCP = CCP_IOREG_gc;
		WDT.WINCTRL = WDT_WPER_8KCLK_gc | WDT_WEN_bm | WDT_WCEN_bm;
		while(WDT.STATUS & WDT_SYNCBUSY_bm);
		__asm__ __volatile__("wdr");	// WDT���Z�b�g���̈ӂɋN����*/
		while(true);
	}
	
	
	
	
	
	
}
