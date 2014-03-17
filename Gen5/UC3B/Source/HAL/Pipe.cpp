/**	@file
	@brief パイプ
*/

#include "Pipe.h"

#include "../driver/mcuflash.h"
#include "../driver/spartan6.h"
#include "../controller.h"
#include "../logger.h"
#include "../main_task.h"



using namespace BTT;



/* パイプの一覧 */
extern const clPipe pipeList[] = {
	// プロセッサ
	{&MCUFlash::Info, MCUFlash::Open, MCUFlash::Close, MCUFlash::Write, MCUFlash::Read, MCUFlash::Seek, (unsigned int*)&MCUFlash::Pointer},
	
	
	
	
#ifdef _DFU_



#endif

#ifdef _APP_
	// FPGA
	{&FPGA::Conf::Info, FPGA::Conf::Open, FPGA::Conf::Close, FPGA::Conf::Write, DefPipe::Read, DefPipe::Seek, (unsigned int*)&DefPipe::Pointer},
	
	// コプロセッサ
	{&MainTask::Cop::Info, MainTask::Cop::Open, MainTask::Cop::Close, MainTask::Cop::Write, DefPipe::Read, DefPipe::Seek, (unsigned int*)&MainTask::Cop::Pointer},
	
	// コントローラ
	{&Controller::Info, Controller::Open, Controller::Close, Controller::Write, DefPipe::Read, DefPipe::Seek, (unsigned int*)&DefPipe::Pointer},
	
	// ロガー
	{&Logger::Info, Logger::Open, Logger::Close, Logger::Write, Logger::Read, DefPipe::Seek, (unsigned int*)&DefPipe::Pointer},
	
#endif
	
	
};

/* パイプリストの項目数 */
extern const unsigned int pipeListLength = sizeof(pipeList) / sizeof(clPipe);



/* 何もしないパイプ */
namespace DefPipe{
	// シークポインタ
	extern const signed int Pointer = 0;
	
	// 常に成功する開く
	bool AlwaysOpen(void){
		return true;
	}
	
	// 常に失敗する開く
	bool Open(void){
		return false;
	}
	
	// 閉じる
	void Close(void){
	}
	
	// 常に失敗する書き込み
	bool Write(const void *data, unsigned int len, unsigned int &written){
		return false;
	}
	
	// 常に失敗する読み込み
	bool Read(void *data, unsigned int len, unsigned int &read){
		return false;
	}
	
	// 常に失敗するシーク
	bool Seek(unsigned int addr){
		return false;
	}
}

