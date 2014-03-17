// XBee�Ƃ̒ʐM

#ifndef XBEE_H_
#define XBEE_H_

#include "../define.h"
#include "int.h"
#include "task.h"

#include <stdarg.h>



// �萔
#define XBEE_BAUDRATE		57600
#define XBEE_TX_BUFSIZE		128
#define XBEE_RX_BUFSIZE		128

#define F_XBEE_TASK			10		// XBee�C���^�[�t�F�[�X�̃^�X�N�̕p�x

#define XBEE_BOOTUP_TIME	1000	// XBee�̋N������


#define XBEE_TX_PDCA	PDCA.channel[0]
#define XBEE_RX_PDCA	PDCA.channel[1]




// XBee�C���^�[�t�F�[�X��������
void XBee_Init(void);

// ���MPDCA���荞��
IH XBee_OnTxPDCA();

// ��MPDCA���荞��
IH XBee_OnRxPDCA();



// XBee�C���^�[�t�F�[�X�̏��������[�`��
bool XBee_TaskInit(const void *init_data);

// XBee�C���^�[�t�F�[�X�̃��C�����[�`��
void XBee_TaskMain(void);

// XBee�C���^�[�t�F�[�X�̏I�����[�`��
void XBee_TaskExit(void);



// ���f�[�^�𑗐M
bool XBee_SendData(const void *data, unsigned int size);

// �p�P�b�g�𑗐M
bool XBee_SendPacket(const void *data);








#endif
