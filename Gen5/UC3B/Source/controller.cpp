/**	@file
	@brief 内蔵フラッシュの制御
*/



#include "controller.h"

#include "FreeRTOS.h"
#include "task.h"

#include <string.h>






namespace Controller{
	
	// 操作状態
	ControllerState_t m_State;
	
	
	
	// パイプ情報
	extern const BTT::PIPE_INFO_t Info = {
		"CONTROLLER", 0, sizeof(ControllerState_t), BTT::WRITABLE
	};
	
	// 開く
	bool Open(void){
		return true;
	}
	
	// 閉じる
	void Close(void){
		m_State.Enabled = 0;
	}
	
	// 書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written){
		if (10 <= len){
			written = 10;
			const ControllerState_t *state = (const ControllerState_t*)data;
			portENTER_CRITICAL();
			m_State.Velocity	= __builtin_bswap_16(state->Velocity);
			m_State.Direction	= __builtin_bswap_16(state->Direction);
			m_State.Rotation	= __builtin_bswap_16(state->Rotation);
			m_State.Dribble		= __builtin_bswap_16(state->Dribble);
			m_State.Kick		= __builtin_bswap_16(state->Kick);
			m_State.Enabled		= 1;
			portEXIT_CRITICAL();
		}else{
			written = 0;
		}
		return true;
	}
	
	
	
	// 操作状態を読み取る
	bool GetState(ControllerState_t &state){
		bool result = m_State.Enabled;
		if (result == true){
			portENTER_CRITICAL();
			memcpy(&state, &m_State, sizeof(ControllerState_t));
			m_State.Enabled = 0;
			portEXIT_CRITICAL();
		}
		return result;
	}
	
	
	
}
