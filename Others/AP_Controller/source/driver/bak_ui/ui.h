// �X�C�b�`�ELED�̐���

#ifndef UI_H_
#define UI_H_

#include "../define.h"
#include "gpio.h"
#include "int.h"



// �O���[�o���ϐ�
extern volatile int SwitchFlags;
extern volatile int SwitchTriggers;

extern volatile int LEDFlags;
extern volatile char LEDSegments[2];



// �萔
#define F_UI	50		// UI��50Hz���ƂɃf�[�^���X�V����



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






// ���[�U�[�C���^�[�t�F�[�X�̏�����
void UI_Init(void);

// ���荞�݃��[�`��
IH UI_OnTimer();

// �V�t�g���W�X�^��8�r�b�g�܂킷(���o��)
void RotateSR(char in, char *out1, char *out2);
// �V�t�g���W�X�^��8�r�b�g�܂킷(�o�͂̂�)
void RotateSR(char in);

// LED�\���𑦎��X�V�E�X�C�b�`���͏�Ԃ��X�V
void UI_Update(void);


// LED�\�����X�V
inline void SetLED(int led, bool on);
inline void SetLED(int led, bool on){
	if (on == true)
		LEDFlags |= 1 << led;
	else
		LEDFlags &= ~(1 << led);
}

// 7�Z�OLED�ɐ�����\��
void SetDisplay(unsigned char num);

// LED��S����
inline void ClearLEDs(void);
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




#endif
