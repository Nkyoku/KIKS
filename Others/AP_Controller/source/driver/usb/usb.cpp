// USB�̐���

#include "usb.h"
#include "../debug.h"

#include <string.h>

#include "usb_desc.cpp"





/*
	�g�p����G���h�|�C���g
	EP0	-> �R���g���[���]��
	EP1	-> HID�C���^���v�gOUT(�z�X�g���f�o�C�X)
	EP2	-> HID�C���^���v�gIN(�z�X�g���f�o�C�X)
*/



// �X�e�[�g�}�V��
typedef enum{
	US_DETACHED = 0,	// �͂�����Ă���
	US_DEFAULT,			// ���Z�b�g�ς�
	US_ADDRESS,			// �A�h���X�t�^�ς�
	US_CONFIGURED		// �R���t�B�O���[�V�����ς�
} USB_STATE_e;
volatile USB_STATE_e USB_State = US_DETACHED;
volatile bool USB_Suspended = false;

// �]���̏��
typedef enum{
	UTR_IDLE = 0,	// SETUP�p�P�b�g�E�]���҂�
	UTR_STALL,		// �X�g�[����
	UTR_WRITE,		// �z�X�g����f�o�C�X�ւ̓]��
	UTR_READ		// �f�o�C�X����z�X�g�ւ̓]��
} UTR_STATE_e;

// EP0�̏��
volatile struct EP0_id{
	UTR_STATE_e state;
	char buf[EP0_BUFSIZE];
	int offset;
	int size;
	bool zlp;
} EP0;







/*** USB��� ***/

// USB��������
void USB_Init(void){
	USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK;
	USBB.udcon	= AVR32_USBB_UDCON_DETACH_MASK;	// �v���A�b�v��R��؂藣��
	
	USBB.usbcon	= AVR32_USBB_USBCON_UIMOD_MASK | AVR32_USBB_USBCON_VBUSHWC_MASK | AVR32_USBB_USBCON_OTGPADE_MASK
				| AVR32_USBB_USBCON_USBE_MASK;
	
	USBB.udinteclr = 0xFFFFFFFF;
	Int_Register(IRQ_USBB, (void*)USB_OnUSB, IL_HIGH);
	
	USBB.udinteset	= AVR32_USBB_UDINTESET_SUSPES_MASK | AVR32_USBB_UDINTESET_EORSTES_MASK;
	USBB.udcon		= 0;	// �v���A�b�v��R��ڑ�
	
	USBB.udintclr = AVR32_USBB_UDINTCLR_SUSPC_MASK;
}

// USB���荞��
IH USB_OnUSB(){
	int irq = USBB.udint;
	
	if (USB_Suspended == false){
		// �E�F�[�N�A�b�v��
		
		if (irq & AVR32_USBB_UDINT_EP0INT_MASK){
			// �G���h�|�C���g0
			USB_OnEP0();
		}else if (irq & AVR32_USBB_UDINT_EP1INT_MASK){
			// �G���h�|�C���g1
			USB_OnEP1();
		} else if (irq & AVR32_USBB_UDINT_EP2INT_MASK){
			// �G���h�|�C���g2
			USB_OnEP2();
		} else if (irq & AVR32_USBB_UDINT_SUSP_MASK){
			// �T�X�y���h
			USBB.UDINTCLR.suspc = 1;
			USBB.UDINTESET.wakeupes = 1;
		
			USB_Suspended = true;
		
			PutLine("Suspend");
		}
	}else{
		// �T�X�y���h��
		
		if (irq & AVR32_USBB_UDINT_WAKEUP_MASK){
			// �E�F�[�N�A�b�v
			USBB.UDINTCLR.wakeupc = 1;
			USBB.UDINTECLR.wakeupec = 1;
		
			USB_Suspended = false;
		
			PutLine("Wakeup");
		}
	}
	
	if (irq & AVR32_USBB_UDINT_EORST_MASK){
		USB_OnReset();
	}
}

// USB���Z�b�g
void USB_OnReset(void){
	// ���Z�b�g
	USBB.UDINTCLR.eorstc = 1;
		
	USB_State = US_DEFAULT;
	
	// �G���h�|�C���g�̏�����
	USBB.uerst	= AVR32_USBB_UERST_EPRST0_MASK | AVR32_USBB_UERST_EPRST1_MASK | AVR32_USBB_UERST_EPRST2_MASK;
	USBB.uerst	= AVR32_USBB_UERST_EPEN0_MASK | AVR32_USBB_UERST_EPEN1_MASK | AVR32_USBB_UERST_EPEN2_MASK;
		
	USBB.uecfg0	= (AVR32_USBB_UECFG0_EPTYPE_CONTROL << AVR32_USBB_UECFG0_EPTYPE)
				| AVR32_USBB_UECFG0_EPDIR_MASK
		        | (AVR32_USBB_UECFG0_EPSIZE_64 << AVR32_USBB_UECFG0_EPSIZE)
				| AVR32_USBB_UECFG0_ALLOC_MASK;
	USBB.uecon0set	= AVR32_USBB_UECON0_RXSTPE_MASK
					| AVR32_USBB_UECON0_STALLEDE_MASK;
	
	USBB.uecfg1 = (AVR32_USBB_UECFG1_EPTYPE_BULK << AVR32_USBB_UECFG1_EPTYPE)
		        | (AVR32_USBB_UECFG1_EPSIZE_64 << AVR32_USBB_UECFG1_EPSIZE) | (AVR32_USBB_UECFG1_EPBK_DOUBLE << AVR32_USBB_UECFG1_EPBK)
				| AVR32_USBB_UECFG1_ALLOC_MASK;
	USBB.uecon1set = AVR32_USBB_UECON1_RXOUTE_MASK;
	
	USBB.uecfg2 = (AVR32_USBB_UECFG2_EPTYPE_BULK << AVR32_USBB_UECFG2_EPTYPE)
				| AVR32_USBB_UECFG2_EPDIR_MASK
		        | (AVR32_USBB_UECFG2_EPSIZE_64 << AVR32_USBB_UECFG2_EPSIZE) | (AVR32_USBB_UECFG2_EPBK_DOUBLE << AVR32_USBB_UECFG2_EPBK)
				| AVR32_USBB_UECFG2_ALLOC_MASK;
	
	USBB.udinteset	= AVR32_USBB_UDINTESET_EP0INTES_MASK | AVR32_USBB_UDINTESET_EP1INTES_MASK | AVR32_USBB_UDINTESET_EP2INTES_MASK;
	EP0.state = UTR_IDLE;
		
	PutLine("Reset");
}



// FIFO����ǂݍ���
void USB_ReadFIFO(int ep, void *buf_, int size){
	char *FIFO = (char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * ep);
	char *buf = (char*)buf_;
	while(0 < size){
		*buf++ = *FIFO++;
		size--;
	}
}

// FIFO�ɏ�������
void USB_WriteFIFO(int ep, const void *buf_, int size){
	char *FIFO = (char*)(AVR32_USBB_SLAVE_ADDRESS + 0x10000 * ep);
	const char *buf = (const char*)buf_;
	while(0 < size){
		*FIFO++ = *buf++;
		size--;
	}
}



/*** �G���h�|�C���g0 ***/

// �G���h�|�C���g0�̊��荞��
void USB_OnEP0(void){
	int status = USBB.uesta0;
	int mask = USBB.uecon0;
	
	if (status & AVR32_USBB_UESTA0_RXSTPI_MASK){
		// SETUP
		EP0_Reply_e reply = EP0_REPLY_STALL;
		
		USB_DeviceRequest_t req;
		USB_ReadFIFO(0, &req, 8);
		AckRXSTPI(0);
		
		req.wValue = SWAP16(req.wValue);
		req.wIndex = SWAP16(req.wIndex);
		req.wLength = SWAP16(req.wLength);
		
		PutString("SETUP[");
		PutHexBYTE(req.bmRequestType); PutByte(' ');
		PutHexBYTE(req.bRequest); PutByte(' ');
		PutHexWORD(req.wValue); PutByte(' ');
		PutDecimal(req.wIndex); PutByte(' ');
		PutDecimal(req.wLength);
		PutString("] ");
		
		int type = req.bmRequestType & 0x60;
		int target = req.bmRequestType & 0x1F;
		switch(type){
		case USB_DRQ_TYPE_BASIC:
			// �W�����N�G�X�g
			switch(target){
			case USB_DRQ_TARGET_DEVICE:
				// �f�o�C�X
				switch(req.bRequest){
				case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
					reply = EP0_REPLY_NO_DATA;
					break;
					
				case USB_DRQ_RQ_SET_ADDRESS:		// Set Address
					EP0_SetAddress(req.wValue);
					reply = EP0_REPLY_NO_DATA;
					break;
					
				case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
					reply = EP0_ReplyBasicDescriptor(req.wValue, req.wLength);
					break;
					
				case USB_DRQ_RQ_SET_CONFIGURATION:	// Set Configration
					EP0_SetConfiguration(req.wValue);
					reply = EP0_REPLY_NO_DATA;
					break;
				}
				break;
				
			case USB_DRQ_TARGET_INTERFACE:
				// �C���^�[�t�F�[�X
				switch(req.bRequest){
				case USB_DRQ_RQ_GET_DESCRIPTOR:		// Get Descriptor
					reply = EP0_ReplyHIDDescriptor(req.wValue, req.wLength);
					break;
				}
				break;
				
			case USB_DRQ_TARGET_ENDPOINT:
				// �G���h�|�C���g
				switch(req.bRequest){
				case USB_DRQ_RQ_CLEAR_FEATURE:		// Clear Feature
					{
						int ep = req.wIndex & 0xF;
						if ((0 <= ep) && (ep <= 7))
							// ���̃f�[�^�p�P�b�g��DATA0�ɂ���
							*(&USBB.uecon0set + ep) = AVR32_USBB_UECON0SET_RSTDTS_MASK;
					}					
					reply = EP0_REPLY_NO_DATA;
					break;
				}
				break;
			}
			break;
			
		case USB_DRQ_TYPE_CLASS:
			// �N���X���N�G�X�g
			
			break;
		}
			
		// �Ԏ�������
		switch(reply){
		case EP0_REPLY_TRANSMIT:
			EP0_UpdateFIFO();
			break;
			
		case EP0_REPLY_NO_DATA:
			EP0_ReturnZeroLengthData();
			EnableTXINI(0);
			EP0.state = UTR_WRITE;
			break;
			
		//case EP0_REPLY_STALL:
		default:
			EP0_SetSTALL();
			PutString("Stall ");
			break;
		}
		PutReturn();
		return;
	}
	if ((mask & AVR32_USBB_UECON0_NAKOUTE_MASK) && (status & AVR32_USBB_UESTA0_NAKOUTI_MASK)){
		// OUT�p�P�b�g��NAK���ꂽ (IN�]����STATUS)
		AckNAKOUTI(0);
		if (EP0.state == UTR_READ){
			DisableNAKOUTI(0);
			EP0_DestroyBuffer();
			status = USBB.uesta0;
		}
	}
	if ((mask & AVR32_USBB_UECON0_TXINE_MASK) && (status & AVR32_USBB_UESTA0_TXINI_MASK)){
		// IN�p�P�b�g (�f�o�C�X����z�X�g)
		if (EP0.state == UTR_READ){
			bool result = EP0_UpdateFIFO();
			if (result == false){
				DisableTXINI(0);
			}
		}
		if (EP0.state == UTR_WRITE){
			EP0_SetIDLE();
			
			if (USB_State == US_DEFAULT){
				int address = (USBB.udcon & AVR32_USBB_UDCON_UADD_MASK) >> AVR32_USBB_UDCON_UADD;
				if (address != 0){
					USBB.udcon |= AVR32_USBB_UDCON_ADDEN_MASK;
					USB_State = US_ADDRESS;
				}
			}
		}
	}
	if ((mask & AVR32_USBB_UECON0_RXOUTE_MASK) && (status & AVR32_USBB_UESTA0_RXOUTI_MASK)){
		// OUT�p�P�b�g (�z�X�g����f�o�C�X)
		if (EP0.state == UTR_WRITE){
			AckRXOUTI(0);
		}
		if (EP0.state == UTR_READ){
			AckRXOUTI(0);
			EP0_SetIDLE();
		}
	}
	if (status & AVR32_USBB_UESTA0_STALLEDI_MASK){
		// STALL����
		AckSTALLEDI(0);
		EP0_SetIDLE();
	}
	
}

// EP0�̃o�b�t�@�ɏ�������
void EP0_WriteBuffer(const char *buf, int size, int reqsize){
	volatile char *dst = EP0.buf;
	if (EP0_BUFSIZE < reqsize) reqsize = EP0_BUFSIZE;
	if (EP0_BUFSIZE < size) size = EP0_BUFSIZE;
	
	EP0.zlp = false;
	if (size < reqsize){
		if ((size % EP0_FIFOSIZE) == 0) EP0.zlp = true;
	}else{
		size = reqsize;
	}		
	EP0.size = size;
	
	memcpy((void*)dst, buf, size);
	/*while(0 < size--){		// Copy data
		*dst++ = *buf++;
	}*/
	
	EP0.offset = 0;
	EP0.state = UTR_READ;
	
	EnableTXINI(0);
	EnableRXOUTI(0);
	EnableNAKOUTI(0);
	
	AckNAKOUTI(0);
	AckRXOUTI(0);
}

// EP0�̓]���𒆎~
void EP0_DestroyBuffer(void){
	EP0.size = 0;
	EP0.zlp = false;
}
	
// EP0��FIFO���X�V
bool EP0_UpdateFIFO(void){
	int size = EP0.size;
	if (size <= 0){
		if (EP0.zlp == true){
			EP0.zlp = false;
			EP0_ReturnZeroLengthData();
		}
		return false;
	}
	if (EP0_FIFOSIZE < size) size = EP0_FIFOSIZE;
	USB_WriteFIFO(0, (void*)(EP0.buf + EP0.offset), size);
	EP0.offset += size;
	EP0.size -= size;
	
	AckTXINI(0);	// Reply IN
	
	if ((EP0.size == 0) && (EP0.zlp == false))
		return false;
	else
		return true;
}

// �[�������O�X�p�P�b�g(ZLP)��Ԃ�
void EP0_ReturnZeroLengthData(void){
	AckTXINI(0);	// Reply IN
}

// STALL��Ԃ�
void EP0_SetSTALL(void){
	EP0.state = UTR_STALL;
	DisableRXOUTI(0);
	DisableTXINI(0);
	DisableNAKINI(0);
	DisableNAKOUTI(0);
	ReturnSTALL(0);
}

// �A�C�h���X�e�[�g�ɑJ�� 
void EP0_SetIDLE(void){
	EP0.state = UTR_IDLE;
	DisableRXOUTI(0);
	DisableTXINI(0);
	DisableNAKINI(0);
	DisableNAKOUTI(0);
}



/*** �G���h�|�C���g0 ���N�G�X�g ***/

// �x�[�V�b�N�f�B�X�N���v�^��Ԃ�
EP0_Reply_e EP0_ReplyBasicDescriptor(int wValue, int wLength){
	int type = (wValue >> 8) & 0xFF;
	int index = wValue & 0xFF;
	switch(type){
	case USB_DESC_DEVICE:
		// �f�o�C�X�f�B�X�N���v�^��Ԃ�
		PutString("GetDeviceDesc() ");
		EP0_WriteBuffer((char*)&DeviceDescriptor, sizeof(DeviceDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_CONFIGURATION:
		// �R���t�B�O���[�V�����f�B�X�N���v�^����Ԃ�
		PutFormat("GetConfDesc(%d) ", index);
		EP0_WriteBuffer((char*)&ConfigurationDescriptor, sizeof(ConfigurationDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_STRING:
		// �X�g�����O�f�B�X�N���v�^��Ԃ�
		PutFormat("GetStringDesc(%d) ", index);
		{
			const char *buf;
			if (index == 0)			buf = StringDescriptor0;	// LANGID
			else if (index == 1)	buf = StringDescriptor1;	// Manufacturer
			else if (index == 2)	buf = StringDescriptor2;	// Product
			else if (index == 3){	// �V���A���ԍ�
				// �V���A���ԍ���AVR32�̊e�`�b�v�����ŗL�̔ԍ���Ԃ�
				short sn[31];
				sn[0] = (sizeof(sn) << 8) | 0x03;
				for(int cnt = 0; cnt < 15; cnt++){
					char hex = ((volatile char*)0x80800204)[cnt];	// ���j�[�NID�̊i�[�ꏊ
					char c;
					c = ((hex >> 4) & 0xF) + '0';	// ��ʃj�u��
					if ('9' < c) c += ('A' - '9' - 1);
					sn[1 + cnt * 2] = c << 8;
					c = (hex & 0xF) + '0';			// ���ʃj�u��
					if ('9' < c) c += ('A' - '9' - 1);
					sn[1 + cnt * 2 + 1] = c << 8;
				}
				EP0_WriteBuffer((char*)sn, sizeof(sn), wLength);
				return EP0_REPLY_TRANSMIT;
			}else{
				break;
			}				
			EP0_WriteBuffer(buf, buf[0], wLength);
		}
		return EP0_REPLY_TRANSMIT;
	}
	return EP0_REPLY_STALL;	// �v�����ꂽ�f�X�N���v�^�������Ă��Ȃ��̂ŃX�g�[����Ԃ�
}

// �A�h���X���Z�b�g
void EP0_SetAddress(int wValue){
	int address = wValue & 0x7F;
	USBB.udcon = (USBB.udcon & ~AVR32_USBB_UDCON_UADD_MASK) | (address << AVR32_USBB_UDCON_UADD);
	PutFormat("SetAddress(%d) ", address);
}

// �R���t�B�O���[�V�������Z�b�g
void EP0_SetConfiguration(int wValue){
	PutFormat("SetConf(%d) ", wValue);
	if (wValue == 1)
		USB_State = US_CONFIGURED;
	else
		USB_State = US_ADDRESS;
}

// HID�N���X�̃f�B�X�N���v�^��Ԃ�
EP0_Reply_e EP0_ReplyHIDDescriptor(int wValue, int wLength){
	int type = (wValue >> 8) & 0xFF;
	int index = wValue & 0xFF;
	switch(type){
	case USB_DESC_HID:
		PutString("GetHIDDesc() ");
		EP0_WriteBuffer((char*)&ConfigurationDescriptor.HIDClass, sizeof(ConfigurationDescriptor.HIDClass), wLength);
		return EP0_REPLY_TRANSMIT;
		
	case USB_DESC_HID_REPORT:
		PutFormat("GetHIDReportDesc(%d) ", index);
		EP0_WriteBuffer(HIDReportDescriptor, sizeof(HIDReportDescriptor), wLength);
		return EP0_REPLY_TRANSMIT;
	}
	return EP0_REPLY_STALL;	// �v�����ꂽ�f�X�N���v�^�������Ă��Ȃ��̂ŃX�g�[����Ԃ�
}





/*** �G���h�|�C���g1/2 ***/

// �G���h�|�C���g1(HID�C���^���v�gOUT)�̊��荞��
void USB_OnEP1(void){
	int status = USBB.uesta1 & USBB.uecon1;
	
	if (status & AVR32_USBB_UESTA1_RXOUTI_MASK){
		// OUT�p�P�b�g (�z�X�g����f�o�C�X)
		
		AckRXOUTI(1);
		
		int byte = USBB.UESTA1.byct;
		char data[64];
		USB_ReadFIFO(1, data, byte);
		
		PutString("OUT[");
		PutDump(data, byte);
		PutLine("]");
		
		ClearFIFOCON(1);
		
		
	}
	
}

// �G���h�|�C���g2(HID�C���^���v�gIN)�̊��荞��
void USB_OnEP2(void){
	int status = USBB.uesta2 & USBB.uecon2;
	
	if (status & AVR32_USBB_UESTA2_TXINI_MASK){
		// IN�p�P�b�g (�f�o�C�X����z�X�g)
		
		DisableTXINI(2);
		
	}
	
}



