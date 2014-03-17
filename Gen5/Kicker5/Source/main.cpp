/**	@file
	@brief ���C��
*/



// �}�N���̃`�F�b�N
#ifdef _DFU_
#ifdef _APP_
#error Both _DFU_ and _APP_ are defined.
#endif
#endif
#ifndef _DFU_
#ifndef _APP_
#error Both _DFU_ and _APP_ are not defined.
#endif
#endif



#include "driver/mode.h"
#include "driver/clock.h"
#include "driver/gpio.h"
#include "driver/usb.h"
#include "usbif.h"
#ifdef _APP_
#include "driver/uart.h"
#include "driver/adc.h"
#include "charge.h"
#include "hostif.h"
#endif
#include "xprintf.h"



/* �萔 */
static const unsigned short DFU_TIMEOUT	= 500;		// DFU���[�h��USB�ʐM�������Ƃ���APP���[�h�Ɉڍs����܂ł̎���
static const unsigned char HEARTBEAT_PERIOD	= 5;	// �[�d�d���≷�x�𑗂����

//volatile char _cs_counter;		// �N���e�B�J���Z�N�V�����̃J�E���^

/* �O���[�o���ϐ� */
volatile unsigned long g_Tick;		// �N�����Ă���̌o�ߎ���
volatile bool g_TickFlag = false;	// �`�b�N���荞�݂����������Ƃ���true�ɂȂ�
volatile bool g_USBAlive;			// USB���ڑ���



// �`�b�N���荞��
ISR(TCD0_OVF_vect){
	static unsigned char cnt1, cnt2;
	static unsigned char per1, per2;
	
#ifdef _DFU_
	bool alive = USBC::LinkAlive();
	g_USBAlive = alive;
	
	if (alive == true){
		cnt1 = 1; per1 = 0;	// LED1 �_��
	}else{
		cnt1 = 0; per1 = 0;	// LED1 ����
	}
	per2 = 200;	// LED2 �_��
#else
	if (Charge::IsErrorOccured() == false){
		// ���퓮��
		per1 = 200;	// LED1 �_��
		if (Charge::IsCharging() == true){
			cnt2 = 1; per2 = 0;	// LED2 �_��
		}else{
			cnt2 = 0; per2 = 0;	// LED2 ����
		}
	}else{
		// �ُ퓮��
		per1 = 100;	// LED1,2 �_��
		cnt2 = cnt1;
		per2 = per1;
	}
#endif
	
	// LED�̓_������
	if (cnt1 <= (per1 >> 1)){
		SetOut(PIN_LED1, OUT_LOW);
	}else{
		SetOut(PIN_LED1, OUT_HIGH);
	}
	if (per1 <= ++cnt1){
		cnt1 = 0;
	}
	if (cnt2 <= (per2 >> 1)){
		SetOut(PIN_LED2, OUT_LOW);
	}else{
		SetOut(PIN_LED2, OUT_HIGH);
	}
	if (per2 <= ++cnt2){
		cnt2 = 0;
	}
	
	g_Tick++;
	g_TickFlag = true;
}

// ��莞�ԑ҂�
static void WaitFor(unsigned short time);



#include <avr/eeprom.h>

// ���C��
int main(void){
#ifdef _DFU_
	// ���Z�b�g�v�������ĕ���
	Mode::JumpToAPPIfNecessary();
#endif
	
	// ���荞�݂̐ݒ�
#ifdef _DFU_
	WriteProtectedIOREG(&PMIC_CTRL, PMIC_RREN_bm | PMIC_IVSEL_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm);
#else
	WriteProtectedIOREG(&PMIC_CTRL, PMIC_RREN_bm | PMIC_HILVLEN_bm | PMIC_MEDLVLEN_bm | PMIC_LOLVLEN_bm);
#endif

	
	
	
	
	// �V�X�e��������
	GPIO::Init();
	Clock::Init();
	USBC::Enable();
	
	xprintf("Debug Output\n");
	
#ifdef _APP_
	ADC::Init();
	Charge::Init();
	UART::Init();
#endif
	
	// DMA��L����
	DMA.CTRL = DMA_ENABLE_bm | DMA_DBUFMODE_CH23_gc;
	
	// �`�b�N�^�C�}�[��ݒ�
	TCD0.PER = 1000 - 1;	// 2ms
	TCD0.INTCTRLA = TC_OVFINTLVL_MED_gc;
	TCD0.CTRLA = TC_CLKSEL_DIV64_gc;
	
	// ���荞�݋���
	sei();
	
	WaitFor(50);
	
	// USB�ڑ�
	USBC::Attach();
	
	while(true){
		// ���Z�b�g�v�����m�F
		char reset_request = USBIF::ResetRequest();
		switch(reset_request){
		case USBIF::REQ_NONE:
			break;
			
		default:
			USBC::Disable();
			WaitFor(50);
			if (reset_request == USBIF::REQ_APP){
				Mode::SwitchToAPP();
			}else{
				Mode::SwitchToDFU();
			}
		}
		
#ifdef _APP_
		// �[�d����
		//ADC::Proc();
		//Charge::Proc();
#endif
		
		// �`�b�N�C�x���g
		if (g_TickFlag == true){
			g_TickFlag = false;
			
#ifdef _APP_
			// �d������
			ADC::Proc();
			Charge::Proc();
			
			// �z�X�g�Ƃ̒ʐM
			static unsigned char heartbeat_cnt = 0;
			if (HEARTBEAT_PERIOD <= ++heartbeat_cnt){
				heartbeat_cnt = 0;
				HOSTIF::SendHeartBeat();
			}
			HOSTIF::Proc();
			
			static unsigned short second = 0;
			if (500 <= ++second){
				second = 0;
				xprintf("V=%d C=%d\n", ADC::GetSupplyVoltage(), ADC::GetCapacitorVoltage());
				//xprintf("A=%d,B=%d,C=%d\n", ADCA.CH0.RES, ADCA.CH1.RES, ADCA.CH2.RES);
			}
#endif

#ifdef _DFU_
			// USB�ڑ�����莞�Ԃ���Ă��Ȃ��Ƃ��́A�����I��APP���[�h�Ɉڍs����
			static unsigned short dfu_cnt;
			if (g_USBAlive == false){
				if (DFU_TIMEOUT <= ++dfu_cnt){
					USBC::Disable();
					WaitFor(50);
					Mode::SwitchToAPP();
				}
			}else{
				dfu_cnt = 0;
			}
#endif
		}
		
		
	}
	return 0;
}



// ��莞�ԑ҂�
static void WaitFor(unsigned short time){
	// ���̊֐����Ăяo���Ƃ��͕K�����荞�݂��L���ɂȂ��Ă���
	unsigned long end;
	cli();
	end = g_Tick + time;
	sei();
	while(true){
		unsigned long now;
		cli();
		now = g_Tick;
		sei();
		if (end <= now) break;
	}
}



extern "C" void __cxa_pure_virtual(){while(true);}
