// IO�|�[�g�̐���

#include "gpio.h"


// IO�|�[�g�̏�����
void GPIO_Init(void){
	__builtin_mtsr(AVR32_CPUCR, __builtin_mfsr(AVR32_CPUCR) | AVR32_CPUCR_LOCEN_MASK);
	
	GPIOM.port[0].puer	= (0b11110001 << 20) | (0b1011000111 << 10) | 0b1110000111;	// �v���A�b�v
	GPIOM.port[0].pmr1	= (0b00000011 << 20) | (0b0000000001 << 10) | 0b1000000000;	// �y���t�F�����I��1
	GPIOM.port[0].pmr0	= (0b00000000 << 20) | (0b0000000000 << 10) | 0b0000000000;	// �y���t�F�����I��0
	//GPIOM.port[0].gper	= (0b00011011 << 20) | (0b0000000001 << 10) | 0b1000000000
	GPIOM.port[0].gper	= (0b11100100 << 20) | (0b1111111110 << 10) | 0b0111111111;	// GPIO���y���t�F������
	GPIO.port[0].ovr	= (0b00001010 << 20) | (0b0010010001 << 10) | 0b0000000000;	// �o�͒l
	GPIO.port[0].oder	= (0b00001110 << 20) | (0b0010111001 << 10) | 0b0001111000;	// ����
}











