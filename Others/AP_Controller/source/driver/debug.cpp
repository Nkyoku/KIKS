// �f�o�b�O�p�V���A���|�[�g

#include "debug.h"

#include <stdio.h>




// ���M�����O�o�b�t�@
typedef struct DebugTx_id{
	char Buf[DEBUG_TX_BUFSIZE];
	int Size;
} DebugTx_t;
DebugTx_t DebugTx[2] = {0};
int DebugTx_TransChannel = -1;
int DebugTx_EmptyChannel = 0;

// ��M�o�b�t�@
typedef struct DebugRx_id{
	char Buf[DEBUG_RX_BUFSIZE];
	int Next;
	int Escmode;
} DebugRx_t;
DebugRx_t DebugRx = {{0}, 0, 0};

volatile int max_transfer = 0;


// �f�o�b�O�C���^�[�t�F�[�X��������
void Debug_Init(void){
	/*DebugTx.Next = 0;
	DebugTx.Size = 0;
	DebugRx.Next = 0;
	DebugRx.Escmode = 0;*/
	
	UART2.mr	= AVR32_USART_MR_ONEBIT_MASK
				| (AVR32_USART_MR_OVER_X16 << AVR32_USART_MR_OVER)
				| (AVR32_USART_MR_PAR_NONE << AVR32_USART_MR_PAR)
				| (AVR32_USART_MR_CHRL_8 << AVR32_USART_MR_CHRL);
	UART2.brgr = F_CPU / (16 * DEBUG_BAUDRATE);
	
	DEBUG_TX_PDCA.psr	= AVR32_PDCA_PID_USART2_TX;
	//DEBUG_RX_PDCA.psr	= AVR32_PDCA_PID_USART2_RX;
	
	Int_Register(IRQ_PDCA2, (void*)Debug_OnTxPDCA, IL_HIGHEST);
	Int_Register(IRQ_USART2, (void*)Debug_OnRxPDCA, IL_HIGHEST);
	
	const static TaskDesc_t desc = {Debug_TaskInit, Debug_TaskMain, Debug_TaskExit};
	Task_Create(&desc, 1000 / F_DEBUG_TASK);
}

// ���MPDCA���荞��
IH Debug_OnTxPDCA(){
	int ch = DebugTx_TransChannel;
	//if (0 <= ch){
		if (max_transfer < DebugTx[ch].Size){
			max_transfer = DebugTx[ch].Size;
		}		
		DebugTx[ch].Size = 0;
		if (0 < DebugTx[ch ^ 1].Size){
			// �ʂ̃o�b�t�@����łȂ��Ƃ��͂���������ɑ��M����
			DEBUG_TX_PDCA.marr	= (int)DebugTx[ch ^ 1].Buf;
			DEBUG_TX_PDCA.tcrr	= DebugTx[ch ^ 1].Size;
			DebugTx_TransChannel = ch ^ 1;
			DebugTx_EmptyChannel = ch;
		}else{
			// �ʂ̃o�b�t�@����̂Ƃ��͑��M���I����
			DebugTx_TransChannel = -1;
			DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
		}
	//}else{
		// �����ւ͗��Ȃ��͂�
	//	DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	//}		
}

// ��MPDCA���荞��
IH Debug_OnRxPDCA(){
	UART2.rhr;
}

// �ꕶ�����M
void PutByte(char c){
	DEBUG_TX_PDCA.idr	= AVR32_PDCA_IDR_TRC_MASK;
	
	int ch = DebugTx_EmptyChannel;
	
	if (DebugTx[ch].Size < DEBUG_TX_BUFSIZE){
		DebugTx[ch].Buf[DebugTx[ch].Size] = c;
		DebugTx[ch].Size++;
		
		if (DebugTx_TransChannel < 0){
			// DMA���󂢂Ă�����DMA�ő��M
			DebugTx_TransChannel = ch;
			DebugTx_EmptyChannel = ch ^ 1;
			
			DEBUG_TX_PDCA.marr	= (int)DebugTx[ch].Buf;
			DEBUG_TX_PDCA.tcrr	= DebugTx[ch].Size;
			DEBUG_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
		}
	}
				
	DEBUG_TX_PDCA.ier	= AVR32_PDCA_IER_TRC_MASK;
}	



// �f�o�b�O�C���^�[�t�F�[�X�̏��������[�`��
bool Debug_TaskInit(const void *init_data){
	//UART2.ier = AVR32_USART_IER_RXRDY_MASK;
	UART2.cr = AVR32_USART_CR_RXEN_MASK | AVR32_USART_CR_TXEN_MASK;
	
	DEBUG_TX_PDCA.cr	= AVR32_PDCA_CR_TEN_MASK;
	//DEBUG_RX_PDCA.cr	= AVR32_PDCA_CR_TEN_MASK;
	
	SendCls();
	PutLine("*** Debug Interface ***");
	
	return true;
}

// �f�o�b�O�C���^�[�t�F�[�X�̃��C�����[�`��
void Debug_TaskMain(void){
	
	
	
	
	
	
}

// �f�o�b�O�C���^�[�t�F�[�X�̏I�����[�`��
void Debug_TaskExit(void){
	DEBUG_TX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	DEBUG_RX_PDCA.idr = AVR32_PDCA_IDR_TRC_MASK | AVR32_PDCA_IDR_RCZ;
	UART2.cr = 0;
	//UART2.idr = AVR32_USART_IDR_TXRDY_MASK | AVR32_USART_IER_RXRDY_MASK;
}










// ������𑗐M
void PutString(const char *s){
	for(;;){
		char c = *s++;
		if (c == '\0') break;
		PutByte(c);
	}
}

// �t�H�[�}�b�g���ꂽ������𑗂�
void PutFormat(const char *fmt, ...){
	/*va_list args;
	va_start(args, fmt);
	char buf[128];
	vsnprintf(buf, 128, fmt, args);
	PutString(buf);
	va_end(args);*/
}

// 16�i���Ń_���v����
void PutDump(const char *s, int length){
	while(0 < length){
		unsigned char d = *s++;
		char c;
		c = (d >> 4) + '0';	// ��ʂ̃j�u��
		if ('9' < c) c += ('A' - '9' - 1);
		PutByte(c);
		c = (d & 0xF) + '0';	// ���ʂ̃j�u��
		if ('9' < c) c += ('A' - '9' - 1);
		PutByte(c);
		length--;
		if (length != 0) PutByte(' ');
	}
}

// Put decimal number through UART
void PutDecimal(int n){
	char buf[11];
	//sprintf(buf, "%d", n);
	//PutString(buf);
}

// Put hexadecimal byte through UART
void PutHexBYTE(int n){
	char buf[9];
	//sprintf(buf, "%02x", n);
	//PutString(buf);
}

// Put hexadecimal word through UART
void PutHexWORD(int n){
	char buf[9];
	//sprintf(buf, "%04x", n);
	//PutString(buf);
}

// Put hexadecimal dword through UART
void PutHexDWORD(int n){
	char buf[9];
	//sprintf(buf, "%08x", n);
	//PutString(buf);
}


// CLS�R�}���h
const char CLS_Command[11] = {"\x1B" "[2J" "\x1B" "[0;0H"};




