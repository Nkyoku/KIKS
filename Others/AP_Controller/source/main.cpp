// ���C��

#include "main.h"

#include "define.h"
#include "driver/int.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/task.h"
#include "driver/usb/usb.h"
#include "driver/debug.h"
#include "driver/xbee.h"
#include "driver/ui.h"
#include "control.h"




bool Independent = true;
enum Generation_e{
	GN_Regacy,		// ������
	GN_NextStep,	// �V����
};
Generation_e Mode = GN_Regacy;






int main(void){
	int exit_code = EC_End;
	
	
	
	DisableGlobalInt();
	
	/* ���������� */
	
	// ���w
	GPIO_Init();
	Int_Init();
	Clock_Init();
	USB_Init();
	
	// ���w
	Task_Init();
	
	// ��w
	Debug_Init();
	UI_Init();
	XBee_Init();
	
	Control_Init();
	
	
	
	
	
	
	
	/* ���C�����[�`�� */
	exit_code = Task_Main();
	
	
	
	/* �I������ */
	
	
	
	
	
	
	
	switch(exit_code){
	case EC_Reset:
		PM.gplp[0] = 1;
		__builtin_mtdr(AVR32_DC, AVR32_DC_DBE_MASK);
		__builtin_mtdr(AVR32_DC, AVR32_DC_RES_MASK);	// �\�t�g�E�F�A���Z�b�g
		while(1);
		
	case EC_Bootloader:
		// �u�[�g���[�_�[���[�h�ֈڍs
		PM.gplp[0] = 0;
		__builtin_mtdr(AVR32_DC, AVR32_DC_DBE_MASK);
		__builtin_mtdr(AVR32_DC, AVR32_DC_RES_MASK);	// �\�t�g�E�F�A���Z�b�g
		while(1);
		
	default:
		while(1);
	}		
	
	return 0;
}
	