/**	@file
	@brief �N���b�N�Ǘ�
*/

#ifndef CLOCK_H_
#define CLOCK_H_

#include "../define.h"

#include <stddef.h>
#include <avr/pgmspace.h>

namespace Clock{

	// �N���b�N�̏�����
	static inline void Init(void){
		// ����32MHz���U���48MHz�Ŕ��U�����邽�߂̃L�����u���[�V�����l��ǂݍ���
		char rc32m_cala, rc32m_calb;
		NVM.CMD = NVM_CMD_READ_CALIB_ROW_gc;
		rc32m_cala = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBRCOSCA));
		rc32m_calb = pgm_read_byte(offsetof(NVM_PROD_SIGNATURES_t, USBRCOSC));
		NVM.CMD = NVM_CMD_NO_OPERATION_gc;
		DFLLRC32M.CALA = rc32m_cala;
		DFLLRC32M.CALB = rc32m_calb;
		DFLLRC32M.COMP1 = 0x80;
		DFLLRC32M.COMP2 = 0xBB;		// 0xB71B <= 48000 <= 48MHz / 1kHz
		
		// ����32kHz���U��Ɠ���32MHz���U����N��
		OSC.CTRL = OSC_RC32KEN_bm | OSC_RC32MEN_bm | OSC_RC2MEN_bm;
		while(~OSC.STATUS & OSC_RC32KRDY_bm);
		while(~OSC.STATUS & OSC_RC32MRDY_bm);
		
		// ���U���PLL�̐ݒ�
		OSC.DFLLCTRL = OSC_RC32MCREF_USBSOF_gc | OSC_RC2MCREF_RC32K_gc;
		DFLLRC2M.CTRL = DFLL_ENABLE_bm;
		DFLLRC32M.CTRL = DFLL_ENABLE_bm;
		OSC.PLLCTRL = OSC_PLLSRC_RC2M_gc | (16 << OSC_PLLFAC_gp);	// 16�{ �����Ȃ�
		
		// PLL���N��
		OSC.CTRL = OSC_PLLEN_bm | OSC_RC32KEN_bm | OSC_RC32MEN_bm | OSC_RC2MEN_bm;
		while(~OSC.STATUS & OSC_PLLRDY_bm);
		
		// �N���b�N���̐؂�ւ�
		CLK.USBCTRL = CLK_USBPSDIV_1_gc | CLK_USBSRC_RC32M_gc | CLK_USBSEN_bm;	// RC32M 48MHz
		WriteProtectedIOREG(&CLK.CTRL, CLK_SCLKSEL_PLL_gc);	// PLL 32MHz
	}

}

#endif
