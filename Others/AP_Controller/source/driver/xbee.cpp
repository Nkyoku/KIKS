// XBee�Ƃ̒ʐM

#include "xbee.h"
#include "ui.h"
#include <stdlib.h>
#include <string.h>




// ���M�o�b�t�@
typedef struct XBeeTx_id{
	char Buf[XBEE_TX_BUFSIZE];
	int Size;
} XBeeTx_t;
XBeeTx_t XBeeTx[2] = {0};
int XBeeTx_TransBank = -1;
int XBeeTx_EmptyBank = 0;

// ��M�o�b�t�@
typedef struct XBeeRx_id{
	char Buf[XBEE_RX_BUFSIZE];
	int Size;
} XBeeRx_t;
XBeeRx_t XBeeRx = {{0}, 0};

// XBee�N���҂�
int XBee_BootupCounter = 0;



// XBee�C���^�[�t�F�[�X��������
void XBee_Init(void){
	UART1.mr	= AVR32_USART_MR_ONEBIT_MASK
				| (AVR32_USART_MR_OVER_X16 << AVR32_USART_MR_OVER)
				| (AVR32_USART_MR_PAR_NONE << AVR32_USART_MR_PAR)
				| (AVR32_USART_MR_CHRL_8 << AVR32_USART_MR_CHRL);
	UART1.brgr = F_CPU / (16 * XBEE_BAUDRATE);
	
	XBEE_TX_PDCA.psr	= AVR32_PDCA_PID_USART1_TX;
	//XBEE_RX_PDCA.psr	= AVR32_PDCA_PID_USART1_RX;
	
	Int_Register(IRQ_PDCA0, (void*)XBee_OnTxPDCA, IL_HIGHEST);
	Int_Register(IRQ_USART1, (void*)XBee_OnRxPDCA, IL_HIGHEST);
	
	const static TaskDesc_t desc = {XBee_TaskInit, XBee_TaskMain, XBee_TaskExit};
	Task_Create(&desc, 1000 / F_XBEE_TASK);
}

// ���MPDCA���荞��
IH XBee_OnTxPDCA(){
	int bank = XBeeTx_TransBank;
	//if (0 <= bank){
		XBeeTx[bank].Size = 0;
		if (0 < XBeeTx[bank ^ 1].Size){
			// �ʂ̃o���N����łȂ��Ƃ��͂���������ɑ��M����
			XBEE_TX_PDCA.marr	= (int)XBeeTx[bank ^ 1].Buf;
			XBEE_TX_PDCA.tcrr	= XBeeTx[bank ^ 1].Size;
			XBeeTx_TransBank = bank ^ 1;
			XBeeTx_EmptyBank = bank;
		}else{
			// �ʂ̃o�b�t�@����̂Ƃ��͑��M���I����
			XBeeTx_TransBank = -1;
			XBEE_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
			
			//SetLED(LED_TRC, false);
			SetOut(PORT_LED_TRC, OUT_LOW);
		}
	//}else{
		// �����ւ͗��Ȃ��͂�
	//	XBEE_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	//}		
}

// ��MPDCA���荞��
IH XBee_OnRxPDCA(){
	UART1.rhr;
}



// XBee�C���^�[�t�F�[�X�̏��������[�`��
bool XBee_TaskInit(const void *init_data){
	UART1.cr = /*AVR32_USART_CR_RXEN_MASK | */AVR32_USART_CR_TXEN_MASK;
	
	XBEE_TX_PDCA.cr	= AVR32_PDCA_CR_TEN_MASK;
	
	XBee_BootupCounter = 0;
	SetOut(PORT_X_RST, OUT_HIGH);
	SetLED(LED_IND, false);
	//SetLED(LED_TRC, false);
	SetOut(PORT_LED_TRC, OUT_LOW);
	return true;
}

// XBee�C���^�[�t�F�[�X�̃��C�����[�`��
void XBee_TaskMain(void){
	
	
	if (XBee_BootupCounter < XBEE_BOOTUP_TIME){
		XBee_BootupCounter += 1000 / F_XBEE_TASK;
		if (XBEE_BOOTUP_TIME <= XBee_BootupCounter)
			SetLED(LED_IND, true);
	}
	
	
}

// XBee�C���^�[�t�F�[�X�̏I�����[�`��
void XBee_TaskExit(void){
	XBEE_TX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	XBEE_RX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	UART1.cr = 0;
	
	SetLED(LED_IND, false);
	//SetLED(LED_TRC, false);
	SetOut(PORT_LED_TRC, OUT_LOW);
	SetOut(PORT_X_RST, OUT_LOW);
}



// ���f�[�^�𑗐M
bool XBee_SendData(const void *data, unsigned int size){
	if (XBee_BootupCounter < XBEE_BOOTUP_TIME) return false;
	
	XBEE_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	
	int bank = XBeeTx_EmptyBank;
	if (XBeeTx[bank].Size == 0){
		if (XBEE_TX_BUFSIZE < size) size = XBEE_TX_BUFSIZE;
		memcpy(XBeeTx[bank].Buf, data, size);
		XBeeTx[bank].Size = size;
		
		if (XBeeTx_TransBank < 0){
			// DMA���󂢂Ă�����DMA�ő��M
			XBeeTx_TransBank = bank;
			XBeeTx_EmptyBank = bank ^ 1;
			
			XBEE_TX_PDCA.marr	= (int)XBeeTx[bank].Buf;
			XBEE_TX_PDCA.tcrr	= XBeeTx[bank].Size;
			XBEE_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
			
			//SetLED(LED_TRC, true);
			SetOut(PORT_LED_TRC, OUT_HIGH);
		}
		
		XBEE_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
		return true;
	}else{
		XBEE_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
		return false;
	}
}

// �p�P�b�g�𑗐M
bool XBee_SendPacket(const void *data){
	
}





