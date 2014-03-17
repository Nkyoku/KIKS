/**	@file
	@brief FPGA Spartan-6の制御
*/

#include "spartan6.h"
#include "gpio.h"
#include "spi.h"

#include "FreeRTOS.h"
#include "task.h"

#include "xprintf.h"



namespace FPGA{
	
	
	
	FPGA_STATE_e State;		// ステート
	


	// 制御用の変数を初期化
	void Init(void){
		SetOut(PIN_FPGA_nPROG, OUT_HIGH);	// PROG_BをHigh
	}
	
	// FPGAをリセット
	void Reset(void){
		portENTER_CRITICAL();
		
		// パイプが使用中でなかったらリセット
		//SetDir(PIN_FPGA_AUX0, DIR_IN);		// M0ピンに繋がっているのでHi-Zにする
		//SetDir(PIN_FPGA_AUX1, DIR_IN);		// MOSIピンに繋がっているのでHi-Zにする
		
		SetOut(PIN_FPGA_nPROG, OUT_LOW);	// PROG_BをLow
		SetDir(PIN_FPGA_nINIT, DIR_OUT);	// INIT_BをLow
		
		State = FSTATE_NoConf;
		
		for(int cnt = 20; 0 < cnt; cnt--){	// ウェイト
			NOP();
		}
		
		SetOut(PIN_FPGA_nPROG, OUT_HIGH);	// PROG_BをHigh
		
		portEXIT_CRITICAL();
	}
	
	
	
	// コンフィギュレーション関連
	namespace Conf{
		
		// パイプ情報
		extern const BTT::PIPE_INFO_t Info = {
			"BITSTREAM", 0, 1, BTT::WRITABLE
		};
		
		// 開く
		bool Open(void){
			bool result = false;
			portENTER_CRITICAL();
			if (State != FSTATE_Config){
				// コンフィギュレーションを開始
				if (SPI::Open() == true){
					Reset();
					SetDir(PIN_FPGA_nINIT, DIR_IN);		// INIT_BをHigh
					SPI::Close();
					State = FSTATE_Config;
					
					result = true;
					
					xputs("Conf:open\n");
				}
			}
			portEXIT_CRITICAL();
			return result;
		}
		
		// 閉じる
		void Close(void){
			if (State != FSTATE_Config){
				// パイプを開いたはずなのにいつの間にかコンフィギュレーションが中断させられてた
				
			}else{
				// こちらが正常
				if (SPI::Open() == false) return
				
				portENTER_CRITICAL();
				
				if (GetIn(PIN_FPGA_DONE) == IN_LOW){
					// コンフィギュレーションが完了していない
					Reset();
					
					xputs("Conf:unfinished\n");
				}else{
					// コンフィギュレーションが完了した
					State = FSTATE_Running;
					//SetDir(PIN_FPGA_AUX0, DIR_OUT);		// M0ピンはもう駆動してよい
					//SetDir(PIN_FPGA_AUX1, DIR_OUT);		// MOSIピンはもう駆動してよい
					
					xputs("Conf:finished\n");
				}
				
				SPI::Close();
				
				portEXIT_CRITICAL();
			}
		}
		
		// 書き込み
		bool Write(const void *data, unsigned int len, unsigned int &written){
			// ポインタとサイズの確認
			if (State != FSTATE_Config) return false;
			
			written = len;
			//xprintf("Conf:write(%d)\n", len);
			
			if (GetIn(PIN_FPGA_DONE) == IN_LOW){
				// コンフィギュレーションはまだ終わってない
				
				// 送信
				if (SPI::Open() == false) return false;
				
				SetOut(PIN_FPGA_CONF, OUT_HIGH);
				Barrier();
				if (len & 1){
					// 奇数
					SPI::SetMode(SPI::MODE_8BIT);
					SPI::SetupTxDMA(data, len);
				}else{
					// 偶数
					SPI::SetMode(SPI::MODE_16BIT);
					SPI::SetupTxDMA(data, len / 2);
				}
				SPI::StartDMA();
				SPI::WaitTxDMA();
				SPI::StopDMA();
				Barrier();		
				SetOut(PIN_FPGA_CONF, OUT_LOW);
				
				SPI::Close();
			}
			
			return true;
		}
		
		
	}
	
	

	
	
	// データを書き込む
	bool Write(int address, short data){
		if (State != FSTATE_Running) return false;
		
		bool result = SPI::Open();
		if (result == true){
			unsigned short packet[3];
			packet[0] = 0x4000 | (address & 0x1FFF);
			packet[1] = 1;
			packet[2] = data;
			
			SetOut(PIN_FPGA_nCS,OUT_LOW);
			Barrier();
			SPI::SetMode(SPI::MODE_16BIT);
			SPI::SetupTxDMA(packet, 3);
			SPI::StartDMA();
			SPI::WaitTxDMA();
			SPI::StopDMA();
			Barrier();
			SetOut(PIN_FPGA_nCS, OUT_HIGH);
			
			SPI::Close();
		}
		return result;
	}
	bool Write(int address, const void *data, int length, bool noinc){
		if (State != FSTATE_Running) return false;
		
		bool result = SPI::Open();
		if (result == true){
			unsigned short header[2];
			address &= 0x1FFF;
			if (noinc == false){
				address |= 0x6000;
			}else{
				address |= 0x4000;
			}
			header[0] = address;
			header[1] = length;
			
			SetOut(PIN_FPGA_nCS, OUT_LOW);
			Barrier();
			SPI::SetMode(SPI::MODE_16BIT);
			SPI::SetupTxDMA(header, 2);
			SPI::SetupTxDMA(data, length);
			SPI::StartDMA();
			SPI::WaitTxDMA();
			SPI::StopDMA();
			Barrier();
			SetOut(PIN_FPGA_nCS, OUT_HIGH);
			
			SPI::Close();
		}
		return result;
	}
	
	// データを読み込む
	bool Read(int address, void *data, int length, bool noinc){
		if (State != FSTATE_Running) return false;
		
		bool result = SPI::Open();
		if (result == true){
			unsigned short header[2];
			address &= 0x1FFF;
			if (noinc == false){
				address |= 0xA000;
			}else{
				address |= 0x8000;
			}
			header[0] = address;
			header[1] = length;
			
			// DMA受信は不安定なので、データの受信はCPUが直接行う
			SetOut(PIN_FPGA_nCS, OUT_LOW);
			Barrier();
			SPI::SetMode(SPI::MODE_16BIT);
			AVR32_SPI.rdr;
			AVR32_SPI.tdr = header[0];
			while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
			AVR32_SPI.rdr;
			AVR32_SPI.tdr = header[1];
			while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
			AVR32_SPI.rdr;
			while(0 < length){
				AVR32_SPI.tdr = 0xFFFF;
				while((AVR32_SPI.sr & AVR32_SPI_SR_RDRF_MASK) == 0);
				*(short*)data = AVR32_SPI.rdr;
				data = (short*)data + 1;
				length--;
			}
			SetOut(PIN_FPGA_nCS, OUT_HIGH);

			SPI::Close();
		}
		return result;
	}
	
	
	
	
	
	
}


