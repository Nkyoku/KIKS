/**	@file
	@brief USB�̐���
*/

#ifndef USB_H_
#define USB_H_

#include "../define.h"
#include "usb_struct.h"



namespace USBC{
	
	static const unsigned short USB_EP0_PKTLENGTH	= 64;	// �p�P�b�g�̒���
	static const unsigned short USB_EP0_FIFOLENGTH	= 256;	// FIFO�̒���
	
	
	
	
	// USB��L��������
	void Enable(void);
	
	// USB�𖳌�������
	void Disable(void);
	
	// USB��ڑ�����
	void Attach(void);
	
	// �����N���A�N�e�B�u���H
	// SOF�̎������x���ĂԂ���
	bool LinkAlive(void);
	
	// ���Z�b�g
	void Reset(void);
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// EP0 �R���g���[���G���h�|�C���g
	namespace EP0{
		// ������ �A�C�h���X�e�[�g�ֈڍs
		void Init(void);
		
		
		
		
		
		
		// SETUP�p�P�b�g�̏���
		bool ReceivedSETUP(void);
		
		// NACK���ꂽOUT�p�P�b�g�̏���
		void ReceivedNAKOUT(void);

		// OUT�p�P�b�g�̏���
		void ReceivedOUT(void);
		
		// NACK���ꂽIN�p�P�b�g�̏���
		void ReceivedNAKIN(void);
		
		// IN�p�P�b�g�̏���
		void ReceivedIN(void);
		
		// ���N�G�X�g���I������
		void EndOfRequest(void);
		
		
		// �X�g�[����Ԃ�
		void SetStall(void);
		
		// IN�]���̃o�b�t�@�֏�������
		void WriteInBuffer(const void *buf, unsigned short size, char flags = 0);
		//void WriteInBuffer(const void *buf, unsigned short size, bool flash = false);
		
		// OUT�]����STATUS��Ԃ��p�ӂ�����
		void SetupOutStatus(void);
		
		// IN�]����STATUS���󂯎��p�ӂ�����
		void SetupInStatus(void);
		
		
		// IN�]����DATA��Ԃ��p�ӂ�����
		bool SetupInData(void);
		
		// OUT�]����DATA���󂯎��p�ӂ�����
		bool SetupOutData(void);
		
		

		
	}









	

	/*#define USB_SetSTALL(ep_ctrl)		ep_ctrl.CTRL |= USB_EP_STALL_bm;
	#define USB_ResetSTALL(ep_ctrl)		ep_ctrl.CTRL &= ~USB_EP_STALL_bm;

	#define USB_ClearOVF(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_OVF_bm;
	#define USB_ClearUNF(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_UNF_bm;
	#define USB_ClearSTALLED(ep_ctrl)	ep_ctrl.STATUS &= ~USB_EP_STALLF_bm;
	#define USB_ClearTRNCOMPL(ep_ctrl)	ep_ctrl.STATUS &= ~USB_EP_TRNCOMPL0_bm;
	#define USB_ClearSETUP(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_SETUP_bm;
	#define USB_SetNACK(ep_ctrl)		ep_ctrl.STATUS |= USB_EP_BUSNACK0_bm;
	#define USB_ClearNACK(ep_ctrl)		ep_ctrl.STATUS &= ~USB_EP_BUSNACK0_bm;*/





}




// Load and Clear
#define lac(addr, msk) \
   __asm__ __volatile__ ( \
         "ldi r24, %1" "\n\t" \
		 "lac Z, r24" "\n\t" \
         ::"z" (addr), "M" (msk):"r24")
// Load and Set
#define las(addr, msk) \
   __asm__ __volatile__ ( \
         "ldi r24, %1" "\n\t" \
		 "las Z, r24" "\n\t" \
         ::"z" (addr), "M" (msk):"r24")//


	
#endif
