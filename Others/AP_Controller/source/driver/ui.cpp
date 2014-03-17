// �X�C�b�`�ELED�̐���

#include "ui.h"
#include "debug.h"



volatile int SwitchFlags = 0;		// �X�C�b�`�̌��݂̉������
volatile int SwitchTriggers = 0;	// �O�t���[���ɃX�C�b�`�𑖍����Ă��牟����Ԃ��ω�������

volatile int LEDFlags = 0;				// LED�̓_�����
volatile char LEDSegments[2] = {0, 0};	// 7�Z�O�����gLED�̓_�����






// ���[�U�[�C���^�[�t�F�[�X�̏�����
void UI_Init(void){
	const static TaskDesc_t desc = {NULL, UI_TaskMain, UI_TaskExit};
	Task_Create(&desc, 1000 / F_UI_TASK);
}



// UI�̃��C�����[�`��
void UI_TaskMain(void){
	static bool toggle = false;
	SetLED(LED_PWR, toggle);
	
	/*SetLED(LED_IND, toggle);
	SetLED(LED_TRC, !toggle);
	SetLED(LED_ERR, !toggle);
	
	if (toggle){
		SetDisplay(39);
	}else{
		SetDisplay(72);
	}
	
	SetLED(LED_DV1, toggle);
	SetLED(LED_DV2, toggle);
	SetLED(LED_DV3, toggle);
	SetLED(LED_DV4, !toggle);
	SetLED(LED_DV5, !toggle);
	SetLED(LED_DV6, !toggle);
	SetLED(LED_DVERR, toggle);
	SetLED(LED_DVWRN, !toggle);*/
	
	toggle = !toggle;
	
	// �\�����X�V
	UI_Update();
}

// UI�̏I�����[�`��
void UI_TaskExit(void){
	// LED�S����
	ClearLEDs();
	UI_UpdateLED();
}







// �V�t�g���W�X�^��8�r�b�g�܂킷(����)
void RotateSR(char *out1_, char *out2_){
	char out1 = 0, out2 = 0;
	SetOut(PORT_SR_DO, OUT_LOW);
	for(unsigned int cnt = 8; 0 < cnt; cnt--){
		SetOut(PORT_SR_CLK, OUT_LOW);
		
		int i = GetIn(PORT_SR_DI1);
		int j = GetIn(PORT_SR_DI2);
		out1 <<= 1;
		out2 <<= 1;
		out1 |= (i == IN_HIGH) ? 0x1 : 0x0;
		out2 |= (j == IN_HIGH) ? 0x1 : 0x0;
		
		SetOut(PORT_SR_CLK, OUT_HIGH);
		NOP();
		NOP();
	}
	SetOut(PORT_SR_CLK, OUT_LOW);
	
	*out1_ = out1;
	*out2_ = out2;
}
// �V�t�g���W�X�^��8�r�b�g�܂킷(�o��)
void RotateSR(char in){
	for(unsigned int cnt = 0; cnt < 8; cnt++){
		SetOut(PORT_SR_DO, (in & 0x80) ? OUT_HIGH : OUT_LOW);
		SetOut(PORT_SR_CLK, OUT_HIGH);
		SetOut(PORT_SR_CLK, OUT_LOW);
		in <<= 1;
	}
}

// LED�\���𑦎��X�V�E�X�C�b�`���͏�Ԃ��X�V
void UI_Update(void){
	/* �X�C�b�`�𑖍��ELED�̕\�� */
	int sw_flags;
	int led_flags = LEDFlags;
	
	sw_flags  =	(GetIn(PORT_SW5) == IN_LOW) ? (1 << SW_ROL) : 0;
	sw_flags |=	(GetIn(PORT_SW13) == IN_LOW) ? (1 << SW_FN7) : 0;
	
	SetOut(PORT_LED_PWR, (led_flags & (1 << LED_PWR)) ? OUT_HIGH : OUT_LOW);
	//SetOut(PORT_LED_TRC, (led_flags & (1 << LED_TRC)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_IND, (led_flags & (1 << LED_IND)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_ERR, (led_flags & (1 << LED_ERR)) ? OUT_HIGH : OUT_LOW);
	
	// �V�t�g���W�X�^�̑���
	SetOut(PORT_SR_CL, OUT_LOW);
	SetOut(PORT_SR_CL, OUT_HIGH);
	
	char in1, in2;
	RotateSR(&in1, &in2);
	RotateSR(LEDSegments[1]);
	RotateSR(LEDSegments[0]);
	RotateSR(led_flags);
	
	/* �X�C�b�`�̃r�b�g�̕��בւ� */
	sw_flags |= ((~in2 & 0xF0) << 8) | in1;
	SwitchTriggers |= sw_flags ^ SwitchFlags;
	SwitchFlags = sw_flags;
}

// LED�\���̂ݍX�V
void UI_UpdateLED(void){
	int led_flags = LEDFlags;
	
	SetOut(PORT_LED_PWR, (led_flags & (1 << LED_PWR)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_TRC, (led_flags & (1 << LED_TRC)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_IND, (led_flags & (1 << LED_IND)) ? OUT_HIGH : OUT_LOW);
	SetOut(PORT_LED_ERR, (led_flags & (1 << LED_ERR)) ? OUT_HIGH : OUT_LOW);
	
	SetOut(PORT_SR_CL, OUT_LOW);
	SetOut(PORT_SR_CL, OUT_HIGH);
	
	RotateSR(LEDSegments[1]);
	RotateSR(LEDSegments[0]);
	RotateSR(led_flags);
}




// 7�Z�OLED�̕ϊ��e�[�u��
const char AsciiToSegmentTableHigh[10] = {
	CONV_SEG_TO_OUT1(0b1111110),	// 0
	CONV_SEG_TO_OUT1(0b0110000),	// 1
	CONV_SEG_TO_OUT1(0b1101101),	// 2
	CONV_SEG_TO_OUT1(0b1111001),	// 3
	CONV_SEG_TO_OUT1(0b0110011),	// 4
	CONV_SEG_TO_OUT1(0b1011011),	// 5
	CONV_SEG_TO_OUT1(0b1011111),	// 6
	CONV_SEG_TO_OUT1(0b1110000),	// 7
	CONV_SEG_TO_OUT1(0b1111111),	// 8
	CONV_SEG_TO_OUT1(0b1111011)		// 9
};
const char AsciiToSegmentTableLow[10] = {
	CONV_SEG_TO_OUT2(0b1111110),	// 0
	CONV_SEG_TO_OUT2(0b0110000),	// 1
	CONV_SEG_TO_OUT2(0b1101101),	// 2
	CONV_SEG_TO_OUT2(0b1111001),	// 3
	CONV_SEG_TO_OUT2(0b0110011),	// 4
	CONV_SEG_TO_OUT2(0b1011011),	// 5
	CONV_SEG_TO_OUT2(0b1011111),	// 6
	CONV_SEG_TO_OUT2(0b1110000),	// 7
	CONV_SEG_TO_OUT2(0b1111111),	// 8
	CONV_SEG_TO_OUT2(0b1111011)		// 9
};

// 7�Z�OLED�ɐ�����\��
void SetDisplay(unsigned char num){
	unsigned char high = (num / 10) % 10;
	unsigned char low = num % 10;
	LEDSegments[0] = AsciiToSegmentTableHigh[high];
	LEDSegments[1] = AsciiToSegmentTableLow[low];
}


