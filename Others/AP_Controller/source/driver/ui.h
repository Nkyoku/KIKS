// �X�C�b�`�ELED�̐���

#ifndef UI_H_
#define UI_H_

#include "../define.h"
#include "gpio.h"
#include "int.h"
#include "task.h"



// �O���[�o���ϐ�
extern volatile int SwitchFlags;
extern volatile int SwitchTriggers;

extern volatile int LEDFlags;
extern volatile char LEDSegments[2];



// �萔
#define F_UI_TASK	50		// UI��50Hz���ƂɃf�[�^���X�V����



#define LED_DV1		0
#define LED_DV2		1
#define LED_DV3		2
#define LED_DV4		3
#define LED_DV5		6
#define LED_DV6		7
#define LED_DVERR	4
#define LED_DVWRN	5

#define LED_PWR		8
#define LED_TRC		9
#define LED_IND		10
#define LED_ERR		11



#define SW_LEFT		12
#define SW_UP		13
#define SW_RIGHT	15
#define SW_DOWN		14
#define SW_ROL			8
#define SW_ROR		2
#define SW_FN1		6
#define SW_FN2		4
#define SW_FN3		7
#define SW_FN4		5
#define SW_FN5		1
#define SW_FN6		0
#define SW_FN7			9
#define SW_FN8		3



// ���[�U�[�C���^�[�t�F�[�X�̏�����
void UI_Init(void);



// UI�̃��C�����[�`��
void UI_TaskMain(void);

// UI�̏I�����[�`��
void UI_TaskExit(void);



// �V�t�g���W�X�^��8�r�b�g�܂킷(����)
void RotateSR(char *out1, char *out2);
// �V�t�g���W�X�^��8�r�b�g�܂킷(�o��)
void RotateSR(char in);

// LED�\���𑦎��X�V�E�X�C�b�`���͏�Ԃ��X�V
void UI_Update(void);

// LED�\���̂ݍX�V
void UI_UpdateLED(void);


// LED�\�����X�V
inline void SetLED(int led, bool on){
	if (on == true)
		LEDFlags |= 1 << led;
	else
		LEDFlags &= ~(1 << led);
}

// 7�Z�OLED�ɐ�����\��
void SetDisplay(unsigned char num);

// LED��S����
inline void ClearLEDs(void){
	LEDFlags = 0;
	LEDSegments[0] = 0;
	LEDSegments[1] = 0;
}

#define CONV_SEG_TO_OUT1(s)							\
			( (((s) & 0x80) ? 0x01 : 0x00)	/* DP */\
			| (((s) & 0x40) ? 0x20 : 0x00)	/* a */	\
			| (((s) & 0x20) ? 0x10 : 0x00)	/* b */	\
			| (((s) & 0x10) ? 0x02 : 0x00)	/* c */	\
			| (((s) & 0x08) ? 0x04 : 0x00)	/* d */	\
			| (((s) & 0x04) ? 0x08 : 0x00)	/* e */	\
			| (((s) & 0x02) ? 0x40 : 0x00)	/* f */	\
			| (((s) & 0x01) ? 0x80 : 0x00)	/* g */	\
			)

#define CONV_SEG_TO_OUT2(s)							\
			( (((s) & 0x80) ? 0x10 : 0x00)	/* DP */\
			| (((s) & 0x40) ? 0x02 : 0x00)	/* a */	\
			| (((s) & 0x20) ? 0x01 : 0x00)	/* b */	\
			| (((s) & 0x10) ? 0x20 : 0x00)	/* c */	\
			| (((s) & 0x08) ? 0x40 : 0x00)	/* d */	\
			| (((s) & 0x04) ? 0x80 : 0x00)	/* e */	\
			| (((s) & 0x02) ? 0x04 : 0x00)	/* f */	\
			| (((s) & 0x01) ? 0x08 : 0x00)	/* g */	\
			)



// �X�C�b�`�̏�Ԃ��擾
inline bool GetSwitch(int sw);
inline bool GetSwitch(int sw){
	return (SwitchFlags & (1 << sw)) ? true : false;
}
// �g���K�[���擾
inline bool GetTrigger(int sw);
inline bool GetTrigger(int sw){
	return (SwitchTriggers & (1 << sw)) ? true : false;
}
// �g���K�[���擾���ă��Z�b�g
inline bool GetTriggerAndReset(int sw);
inline bool GetTriggerAndReset(int sw){
	bool ret = (SwitchTriggers & (1 << sw)) ? true : false;
	SwitchTriggers &= ~(1 << sw);
	return ret;
}







#endif
