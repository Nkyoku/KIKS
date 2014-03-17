/**	@file
	@brief �L�b�J�[�^�X�N
*/

#include "kicker_task.h"
#include "driver/kicker.h"
#include "driver/gpio.h"
#include "logger.h"

#include "xprintf.h"
#include "global.h"

#include <string.h>



namespace KickerTask{
	
	/* �萔 */
	static const unsigned int PERIOD	= 200;	// �^�X�N�̎���
	
	static const unsigned int KICKER_RX_BUFSIZE	= 64;
	
	
	/* �ϐ� */
	volatile int m_TaskFlag;		// �^�X�N�̃t���O
	
	struct Rx_t{
		char Buf[KICKER_RX_BUFSIZE];
		unsigned int Next;
		bool Comment;
	} Rx;	// ��M�o�b�t�@
	
	xSemaphoreHandle m_Semaphore;	// �Z�}�t�H
	
	volatile unsigned int m_Timeout;	// �Ō�ɒʐM�������Ă���̌o�ߎ���
	volatile bool m_ChargeDisable;		// �[�d������
	
	volatile bool m_Trouble;			// ��蔭����
	volatile int m_Voltage;				// �L���p�V�^�d��
	volatile int m_Temperature;			// ���x
	
	volatile signed int m_Strength;		// �L�b�N�̋���
	
	


	// (����)�R�}���h�𑗐M
	//void IntTx(char cmd, int value);
	
	// (����)�ꕶ������
	static void IntRxPush(char c);

	// (����)�Ԓl���p�[�X
	static void IntRxParse(void);

	// �^�X�N
	void Task(void *param){
		// �Z�}�t�H�쐬
		vSemaphoreCreateBinary(m_Semaphore);
		
		m_TaskFlag = TASK_FLAG_ALIVE;
		
		unsigned int last_time = xTaskGetTickCount();
		while(true){
			// �����w��������܂Ń^�C���A�E�g�t���ő҂�
			portBASE_TYPE result;
			result = xSemaphoreTake(m_Semaphore, TASK_DELAY_MS(PERIOD));
			if (result != pdFALSE){
				// �����̗v���ŋN�����ꂽ
				int flag = m_TaskFlag;
				if (flag & TASK_FLAG_KILLREQ){
					// �^�X�N�I��
					m_TaskFlag = 0;
					vTaskDelete(NULL);
				}
				if (flag & TASK_FLAG_STOPREQ){
					// �[�d���~
					__sync_and_and_fetch(&m_TaskFlag, ~TASK_FLAG_STOPREQ);
					IntTx('c', 0);	// �Ԉ���������ŏ[�d�R�}���h�𑗂�Ə[�d����~����
				}
				if (flag & TASK_FLAG_KICKREQ){
					// �L�b�N��v��
					__sync_and_and_fetch(&m_TaskFlag, ~TASK_FLAG_KICKREQ);
					int str = m_Strength;
					if (0 < str){
						xprintf("Straight(%d)\n", str);
						IntTx('s', str);	// �X�g���[�g�L�b�N
					}else{
						xprintf("Chip(%d)\n", -str);
						IntTx('h', -str);	// �`�b�v�L�b�N
					}
				}
			}
			
			if (m_ChargeDisable == false){
				// �[�d��L����
				IntTx('c', 0x876);
			}
			
			if (IsRunning() == true){
				SetOut(PIN_nLED3, OUT_LOW);
			}else{
				SetOut(PIN_nLED3, OUT_HIGH);
			}
			
			// ��M
			const char *rxbuf;
			int rxlen = Kicker::BeginRead(&rxbuf);
			if (rxbuf != NULL){
				for(int cnt = 0; cnt < rxlen; cnt++){
					IntRxPush(*rxbuf++);
				}
				Kicker::EndRead();
			}
			
			// �o�߂������Ԃ����Z
			unsigned int now_time = xTaskGetTickCount();
			m_Timeout = __builtin_satadd_w(m_Timeout, now_time - last_time);
			last_time = now_time;
		}
	}
	
	// �L�b�N���w��
	// �����ŃX�g���[�g�A�����Ń`�b�v�L�b�N
	void Kick(int strength){
		m_Strength = strength;
		__sync_or_and_fetch(&m_TaskFlag, TASK_FLAG_KICKREQ);
		xSemaphoreGive(m_Semaphore);
	}
	
	
	
	// (����)�R�}���h�𑗐M
	void IntTx(char cmd, int value){
		{
			int len;
			char buf[10];
			xsprintf(buf, "n%d\n", (short)value);
			len = strlen(buf);
			Kicker::Transmit(buf, len);
		}
		{
			char buf[6] = {'c', cmd, cmd, cmd, cmd, '\n'};
			Kicker::Transmit(buf, 6);
		}
	}
	
	// (����)�ꕶ������
	void IntRxPush(char c){
		if (c <= 0x0A){			// LF
			if (0 < Rx.Next){
				Rx.Buf[Rx.Next++] = '\0';
				IntRxParse();
			}
			Rx.Next	= 0;
			Rx.Comment = false;
		}else if (c == '*'){	// �R�����g
			Rx.Comment = true;
		}else if (Rx.Comment == false){
			if (Rx.Next < (KICKER_RX_BUFSIZE - 1))
				Rx.Buf[Rx.Next++] = c;
		}
	}

	// (����)�Ԓl���p�[�X
	void IntRxParse(void){
		//xprintf("Rx'%s'", Rx.Buf);
		
		// �R�}���h�����Ɛ��l�ɕ���
		char *buf = Rx.Buf;
		int value = 0;
		int len = Rx.Next;
		char cmd = *buf++;
		if (1 < len){
			if (xatoi(&buf, (long*)&value) == 0)
				value = -1;
		}else{
			value = -1;
		}
		
		unsigned int timeout = 0;
		switch(cmd){
		case 'v':	// �d��
			m_Voltage = value;
			portENTER_CRITICAL();
			Logger::AddTime(xTaskGetTickCount());
			Logger::AddDataHalf(Logger::ID_CAP_VOLTAGE, value);
			portEXIT_CRITICAL();
			break;
		
		case 't':	// ���x
			m_Temperature = value;
			break;
		
		case 'k':
			xprintf("Kicker:Kicked(%d)\n", value);
			break;
		
		case 'e':
			if (value == 0){
				m_Trouble = false;	// �ُ�Ȃ�
			}else{
				m_Trouble = true;
				xprintf("Kicker:Error(%d)\n", value);
			}
			break;
		
		default:
			timeout = m_Timeout;
			break;
		}
		m_Timeout = timeout;
	}
	







	
	


}
