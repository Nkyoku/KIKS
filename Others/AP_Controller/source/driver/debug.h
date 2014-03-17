// �f�o�b�O�p�V���A���|�[�g

#ifndef DEBUG_H_
#define DEBUG_H_

#include "../define.h"
#include "int.h"
#include "task.h"

#include <stdarg.h>



// �萔
#define DEBUG_BAUDRATE		38400
#define DEBUG_TX_BUFSIZE	512
#define DEBUG_RX_BUFSIZE	128

#define F_DEBUG_TASK		1		// �f�o�b�O�C���^�[�t�F�[�X�̃^�X�N�̕p�x(�g��Ȃ��̂�1Hz)



#define DEBUG_TX_PDCA	PDCA.channel[2]
#define DEBUG_RX_PDCA	PDCA.channel[3]




// �f�o�b�O�C���^�[�t�F�[�X��������
void Debug_Init(void);

// ���MPDCA���荞��
IH Debug_OnTxPDCA();

// ��MPDCA���荞��
IH Debug_OnRxPDCA();

// �ꕶ�����M
void PutByte(char c);



// �f�o�b�O�C���^�[�t�F�[�X�̏��������[�`��
bool Debug_TaskInit(const void *init_data);

// �f�o�b�O�C���^�[�t�F�[�X�̃��C�����[�`��
void Debug_TaskMain(void);

// �f�o�b�O�C���^�[�t�F�[�X�̏I�����[�`��
void Debug_TaskExit(void);



// ���s�𑗐M
inline void PutReturn(void){
	//PutByte(0x0D);
	PutByte(0x0A);
}

// ������𑗐M
void PutString(const char *s);

// ��s�̕�����𑗂�
inline void PutLine(const char *s){
	PutString(s);
	PutReturn();
}	

// �t�H�[�}�b�g���ꂽ������𑗂�
void PutFormat(const char *fmt, ...);

// 16�i���Ń_���v����
void PutDump(const char *s, int length);

// Put decimal number through UART
void PutDecimal(int n);

// Put hexadecimal byte through UART
void PutHexBYTE(int n);

// Put hexadecimal word through UART
void PutHexWORD(int n);

// Put hexadecimal dword through UART
void PutHexDWORD(int n);


// CLS�R�}���h�𑗐M
extern const char CLS_Command[];
inline void SendCls(void){
	PutString(CLS_Command);
}



#endif
