// USB�̐���

#ifndef USB_H_
#define USB_H_

#include "../../define.h"
#include "../int.h"
#include "usb_struct.h"



/*** �f�o�C�X��� ***/
#define USB_VERSION_BCD			0x0200
#define USB_HID_BCD				0x0101
#define USB_VENDOR_ID			0x9393
#define USB_PRODUCT_ID			0x0072
#define USB_RELEASE_BCD			0x0101	// 0x0100=�u�[�g���[�_�[, 0x0101=�A�v���P�[�V����

#define USB_LANGID_ENGLISH		0x409



// FIFO�E�o�b�t�@
#define EP0_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x00000))
#define EP1_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000))
#define EP2_FIFO ((volatile char*)(AVR32_USBB_SLAVE_ADDRESS + 0x20000))

#define EP0_FIFOSIZE	64
#define EP0_BUFSIZE		512



/*** USB��� ***/

// USB��������
void USB_Init(void);

// USB���荞��
IH USB_OnUSB();

// USB���Z�b�g
void USB_OnReset(void);


// FIFO����ǂݍ���
void USB_ReadFIFO(int ep, void *buf, int size);

// FIFO�ɏ�������
void USB_WriteFIFO(int ep, const void *buf, int size);



/*** �G���h�|�C���g0 ***/

typedef enum{
	EP0_REPLY_NO_DATA,	// �f�[�^�Ȃ�
	EP0_REPLY_RECEIVE,	// �z�X�g����f�[�^����M����
	EP0_REPLY_TRANSMIT,	// �z�X�g�փf�[�^�𑗐M����
	EP0_REPLY_STALL		// ���Ή��̃��N�G�X�g
} EP0_Reply_e;

// �G���h�|�C���g0�̊��荞��
void USB_OnEP0(void);

// EP0�̃o�b�t�@�ɏ�������
void EP0_WriteBuffer(const char *buf, int size, int reqsize);

// EP0�̓]���𒆎~
void EP0_DestroyBuffer(void);

// EP0��FIFO���X�V
bool EP0_UpdateFIFO(void);

// �[�������O�X�p�P�b�g(ZLP)��Ԃ�
void EP0_ReturnZeroLengthData(void);

// STALL��Ԃ�
void EP0_SetSTALL(void);

// �A�C�h���X�e�[�g�ɑJ�� 
void EP0_SetIDLE(void);



/*** �G���h�|�C���g0 ���N�G�X�g ***/

// �x�[�V�b�N�f�B�X�N���v�^��Ԃ�
EP0_Reply_e EP0_ReplyBasicDescriptor(int wValue, int wLength);

// �A�h���X���Z�b�g
void EP0_SetAddress(int wValue);

// �R���t�B�O���[�V�������Z�b�g
void EP0_SetConfiguration(int wValue);

// HID�N���X�̃f�B�X�N���v�^��Ԃ�
EP0_Reply_e EP0_ReplyHIDDescriptor(int wValue, int wLength);



/*** �G���h�|�C���g1/2 ***/

// �G���h�|�C���g1�̊��荞��
void USB_OnEP1(void);

// �G���h�|�C���g2�̊��荞��
void USB_OnEP2(void);






#define EnableUSB()			USBB.USBCON.usbe = 1
#define DisableUSB()		USBB.USBCON.usbe = 0

#define EnableRXOUTI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_RXOUTES_MASK
#define DisableRXOUTI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_RXOUTEC_MASK
#define EnableTXINI(ep)		USBB.uecon##ep##set = AVR32_USBB_UECON0SET_TXINES_MASK
#define DisableTXINI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_TXINEC_MASK
#define EnableNAKINI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKINES_MASK
#define DisableNAKINI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKINEC_MASK
#define EnableNAKOUTI(ep)	USBB.uecon##ep##set = AVR32_USBB_UECON0SET_NAKOUTES_MASK
#define DisableNAKOUTI(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_NAKOUTEC_MASK

#define ReturnSTALL(ep)		USBB.uecon##ep##set = AVR32_USBB_UECON0SET_STALLRQS_MASK
#define ClearSTALL(ep)		USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_STALLRQC_MASK

#define AckRXSTPI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXSTPIC_MASK;
#define AckNAKINI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKINIC_MASK;
#define AckTXINI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_TXINIC_MASK;
#define AckNAKOUTI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_NAKOUTIC_MASK;
#define AckRXOUTI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_RXOUTIC_MASK;
#define AckSTALLEDI(ep)		USBB.uesta##ep##clr = AVR32_USBB_UESTA0CLR_STALLEDIC_MASK;

#define ClearFIFOCON(ep)	USBB.uecon##ep##clr = AVR32_USBB_UECON0CLR_FIFOCONC_MASK;



#endif
