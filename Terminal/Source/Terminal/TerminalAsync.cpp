// 非同期操作担当

#include "TerminalAsync.h"
#include "trace.h"
#include "convqstr.h"

#include <QMessageBox>





// コンストラクタ
TerminalAsync::TerminalAsync(clDeviceState *ds, QObject *parent) : m_ds(ds), QObject(parent), m_Deleted(false){
	Trace(L"ASYNC was Created");

	/* ロガー */
	m_LoggerTimer = new QTimer(this);
    connect(m_LoggerTimer, SIGNAL(timeout()), this, SLOT(onLoggingInterval()));
   // m_LoggerTimer->start(LOGGER_PERIOD);
	m_LoggerHandle = -1;

	/* コントローラ */
	m_ControllerTimer = new QTimer(this);
    connect(m_ControllerTimer, SIGNAL(timeout()), this, SLOT(onControllerInterval()));
    //m_ControllerTimer->start(CONTROLLER_PERIOD);
	m_ControllerHandle = -1;



	
}

// デストラクタ
TerminalAsync::~TerminalAsync(){
	if (m_Deleted == true) return;
	m_Deleted = true;
	
	Trace(L"ASYNC is Deleting");
}




// ファイルを読み込む
bool TerminalAsync::LoadFile(std::vector<char> &dst_vector, const wchar_t *src_path){
	bool result = false;

	dst_vector.clear();

	HANDLE hFile;
	hFile = CreateFile(src_path, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, NULL);
	if (hFile != INVALID_HANDLE_VALUE){
		LARGE_INTEGER filesize;
		if (GetFileSizeEx(hFile, &filesize) == TRUE){
			if (filesize.QuadPart <= MAX_FILESIZE){
				DWORD read;
				dst_vector.resize(filesize.QuadPart);
				if (ReadFile(hFile, &dst_vector[0], filesize.QuadPart, &read, NULL) == TRUE){
					result = true;
				}else{
					dst_vector.clear();
				}
			}
		}
		CloseHandle(hFile);
	}

	return result;
}

// ファイルに保存
bool TerminalAsync::SaveFile(const wchar_t *dst_path, const void *src_data, unsigned int src_length){
	FILE *fp = nullptr;
	if (_wfopen_s(&fp, dst_path, L"wb") == 0){
		fwrite(src_data, 1, src_length, fp);
		fclose(fp);
		return true;
	}

	return false;
}







// 転送 メモリー → ファイル
bool TerminalAsync::TransMemoryToFile(const wchar_t *dst_path, const void *src_data, unsigned int src_length){
	emit sendProgress(0);

	int result = -1;
	int handle = -1;
	try{
		// ファイルを開く
		handle = m_ds->m_dsFile->fopen(dst_path, L"cw");
		if (0 <= handle){
			unsigned int file_size = src_length;
			unsigned int file_ptr = 0;

			// 転送
			static const unsigned int unit = 16384;
			unsigned int tlen;
			while(0 < src_length){
				tlen = src_length < unit ? src_length : unit;
				result = m_ds->m_dsFile->fwrite(handle, src_data, tlen);
				if (result <= 0) break;
				src_length -= tlen;
				src_data = (const char*)src_data + tlen;

				file_ptr += tlen;
				emit sendProgress(100 * file_ptr / file_size);
			}

			// ファイルを閉じる
			m_ds->m_dsFile->fclose(handle);

			Trace("A transfar completed");
		}
	}catch(...){
		// 例外
		Trace("Received an exception");
		m_ds->m_dsFile->fclose(handle);

		result = -1;
	}

	emit sendProgress(-1);

	return 0 <= result;
}

// 転送 メモリー ← ファイル
bool TerminalAsync::TransMemoryFromFile(void *dst_data, unsigned int &dst_length, const wchar_t *src_path){
	emit sendProgress(0);

	unsigned int buf_size = dst_length;
	int result = -1;
	int handle = -1;
	try{
		dst_length = 0;

		// ファイルを開く
		handle = m_ds->m_dsFile->fopen(src_path, L"r");
		if (0 <= handle){
			unsigned int file_size = dst_length;
			unsigned int file_ptr = 0;

			// 転送
			static const unsigned int unit = 32768;
			unsigned int tlen;
			while(0 < buf_size){
				tlen = buf_size < unit ? buf_size : unit;
				result = m_ds->m_dsFile->fread(handle, dst_data, tlen);
				if (result <= 0) break;
				dst_data = (char*)dst_data + result;
				buf_size -= result;
				dst_length += result;

				file_ptr += result;
				emit sendProgress(100 * file_ptr / file_size);

				if (result < tlen) break;
			}

			// ファイルを閉じる
			m_ds->m_dsFile->fclose(handle);

			Trace("A transfar completed");
		}
	}catch(...){
		// 例外
		Trace("Received an exception");
		m_ds->m_dsFile->fclose(handle);

		result = -1;
	}

	emit sendProgress(-1);
	
	return 0 <= result;
}

// 転送 メモリー ← ファイル全体
bool TerminalAsync::TransMemoryFromFileAll(std::vector<char> &dst_vector, const wchar_t *src_path){
	emit sendProgress(0);

	dst_vector.clear();
	int result = -1;
	int handle = -1;
	try{
		// ファイルを開く
		handle = m_ds->m_dsFile->fopen(src_path, L"r");
		if (0 <= handle){
			unsigned int file_size = m_ds->m_dsFile->fsize(handle);
			unsigned int file_ptr = 0;

			dst_vector.resize(file_size, 0x00);

			// 転送
			static const unsigned int unit = 32768;
			char buf[unit];
			unsigned int tlen;
			while(true){
				result = m_ds->m_dsFile->fread(handle, buf, unit);
				if (result <= 0) break;

				memcpy(&dst_vector[file_ptr], buf, result);

				file_ptr += result;
				emit sendProgress(100 * file_ptr / file_size);
			}

			// ファイルを閉じる
			m_ds->m_dsFile->fclose(handle);

			Trace("A transfar completed");
		}
	}catch(...){
		// 例外
		Trace("Received an exception");
		m_ds->m_dsFile->fclose(handle);

		result = -1;
	}
	
	emit sendProgress(-1);

	return 0 <= result;
}

// 転送 ファイル → ファイル
bool TerminalAsync::TransFileToFile(const wchar_t *dst_path, const wchar_t *src_path){
	// 転送元ファイルを開く
	std::vector<char> buf;
	if (LoadFile(buf, src_path) == true){
		// 転送する
		return TransMemoryToFile(dst_path, &buf[0], buf.size());
	}
	return false;
}

// 転送 ファイル ← ファイル全体
bool TerminalAsync::TransFileFromFileAll(const wchar_t *dst_path, const wchar_t *src_path){
	// 転送元ファイルから読み込む
	std::vector<char> buf;
	if (TransMemoryFromFileAll(buf, src_path) == true){
		// 保存する
		return SaveFile(dst_path, &buf[0], buf.size());
	}
	return false;
}

// 転送 メモリー → パイプ
bool TerminalAsync::TransMemoryToPipe(const wchar_t *dst_pipe, const void *src_data, unsigned int src_length, bool progress){
	if (progress == true){
		emit sendProgress(0);
	}

	int result = -1;
	int handle = -1;
	try{
		// パイプを開く
		handle = m_ds->m_dsPipe->popen(dst_pipe, L"w");
		if (0 <= handle){
			unsigned int pipe_size = src_length;
			unsigned int pipe_ptr = 0;

			// 転送
			static const unsigned int unit = 16384;
			unsigned int tlen;
			while(0 < src_length){
				tlen = src_length < unit ? src_length : unit;
				result = m_ds->m_dsPipe->pwrite(handle, src_data, tlen);
				if (result < 0) break;
				src_length -= tlen;
				src_data = (const char*)src_data + tlen;

				pipe_ptr += tlen;
				if (progress == true){
					emit sendProgress(100 * pipe_ptr / pipe_size);
				}
			}

			// パイプを閉じる
			m_ds->m_dsPipe->pclose(handle);

			Trace("A transfar completed");
		}
	}catch(...){
		// 例外
		Trace("Received an exception");
		m_ds->m_dsPipe->pclose(handle);

		result = -1;
	}

	if (progress == true){
		emit sendProgress(-1);
	}

	return 0 <= result;
}

// 転送 メモリー ← パイプ全体
bool TerminalAsync::TransMemoryFromPipeAll(std::vector<char> &dst_vector, const wchar_t *src_pipe, bool progress){
	if (progress == true){
		emit sendProgress(0);
	}

	dst_vector.clear();
	int result = -1;
	int handle = -1;
	try{
		// パイプを開く
		handle = m_ds->m_dsPipe->popen(src_pipe, L"r");
		if (0 <= handle){
			unsigned int pipe_size = m_ds->m_dsPipe->psize(handle);
			unsigned int pipe_ptr = 0;

			dst_vector.resize(pipe_size, 0x00);

			// 転送
			static const unsigned int unit = 32768;
			char buf[unit];
			unsigned int tlen;
			while(true){
				result = m_ds->m_dsPipe->pread(handle, buf, unit);
				if (result <= 0) break;

				memcpy(&dst_vector[pipe_ptr], buf, result);

				pipe_ptr += result;
				if (progress == true){
					emit sendProgress(100 * pipe_ptr / pipe_size);
				}
			}

			// パイプを閉じる
			m_ds->m_dsPipe->pclose(handle);

			Trace("A transfar completed");
		}
	}catch(...){
		// 例外
		Trace("Received an exception");
		m_ds->m_dsPipe->pclose(handle);

		result = -1;
	}
	
	if (progress == true){
		emit sendProgress(-1);
	}

	return 0 <= result;
}







// ファイルをデバイスへ転送
void TerminalAsync::transfarToDevice(std::wstring *dst_path, std::wstring *src_path){
	Trace(L"transferTo '%s' <- '%s'", dst_path->c_str(), src_path->c_str());
	
	emit setExclusiveState(true);

	//unsigned int start = timeGetTime();
	TransFileToFile(dst_path->c_str(), src_path->c_str());
	//Trace(L"Time elapsed %dms", timeGetTime() - start);
	
	emit setExclusiveState(false);

	delete dst_path;
	delete src_path;
}

// ファイルをデバイスから転送
void TerminalAsync::transfarFromDevice(std::wstring *dst_path, std::wstring *src_path){
	Trace(L"transferFrom '%s' <- '%s'", dst_path->c_str(), src_path->c_str());

	emit setExclusiveState(true);

	//unsigned int start = timeGetTime();
	TransFileFromFileAll(dst_path->c_str(), src_path->c_str());
	//Trace(L"Time elapsed %dms", timeGetTime() - start);

	emit setExclusiveState(false);

	delete dst_path;
	delete src_path;
}



// アクセスパネルの操作
void TerminalAsync::onAccessOperation(char letter, std::wstring *path){
	emit setExclusiveState(true);

	switch(letter){
	case 'p':	// プロセッサ書き込み
		{
			std::vector<char> buf;
			if (m_ds->LoadProcessorFirmware(buf, path->c_str()) == true){
				if (TransMemoryToPipe(clDeviceState::PIPE_NAME_PROCESSOR, &buf[0], buf.size()) == false){
					emit showWarningConst(L"Async", L"パイプライトに失敗しました。");
				}
			}else{
				emit showWarningConst(L"Async", L"ファームウェアが開けないか、データが不正です。");
			}
		}
		break;

	case 'P':	// プロセッサ読み出し
		{
			std::vector<char> buf;
			if (TransMemoryFromPipeAll(buf, clDeviceState::PIPE_NAME_PROCESSOR, true) == true){
				if (SaveFile(path->c_str(), &buf[0], buf.size()) == false){
					emit showWarningConst(L"Async", L"ファームウェアの保存に失敗しました。");
				}
			}else{
				emit showWarningConst(L"Async", L"パイプリードに失敗しました。");
			}
		}
		break;

	case 'b':	// ビットストリーム転送
		{
			std::vector<char> buf;
			if (LoadFile(buf, path->c_str()) == true){
				if (TransMemoryToPipe(clDeviceState::PIPE_NAME_BITSTREAM, &buf[0], buf.size()) == false){
					emit showWarningConst(L"Async", L"パイプライトに失敗しました。");
				}
			}else{
				emit showWarningConst(L"Async", L"ビットストリームが開けないか、データが不正です。");
			}
		}
		break;

	case 'B':	// ビットストリーム書き込み
		if (TransFileToFile(clDeviceState::FILE_PATH_BITSTREAM, path->c_str()) == false){
			emit showWarningConst(L"Async", L"ビットストリームの書き込みに失敗しました。");
		}
		break;

	case 'c':	// コプロセッサ転送
		{
			std::vector<char> buf;
			if (m_ds->LoadCoprocessorFirmware(buf, path->c_str()) == true){
				if (TransMemoryToPipe(clDeviceState::PIPE_NAME_COPROCESSOR, &buf[0], buf.size()) == false){
					emit showWarningConst(L"Async", L"パイプライトに失敗しました。");
				}
			}else{
				emit showWarningConst(L"Async", L"コプロセッサのファームウェアが開けないか、データが不正です。");
			}
		}
		break;

	case 'C':	// コプロセッサ書き込み
		{
			std::vector<char> buf;
			if (m_ds->LoadCoprocessorFirmware(buf, path->c_str()) == true){
				if (TransMemoryToFile(clDeviceState::FILE_PATH_COPROCESSOR, &buf[0], buf.size()) == false){
					emit showWarningConst(L"Async", L"コプロセッサのファームウェアの書き込みに失敗しました。");
				}
			}else{
				emit showWarningConst(L"Async", L"コプロセッサのファームウェアが開けないか、データが不正です。");
			}
		}
		break;
	}

	emit setExclusiveState(false);

	delete path;
}







// 一定周期で呼び出される
void TerminalAsync::onLoggingInterval(void){
	if (m_LoggerHandle < 0){
		// パイプが開かれていない
		m_LoggerTimer->stop();
	}else{
		try{
			if (m_LoggerList.empty() == false){
				// リストを送信
				m_ds->m_dsPipe->pwrite(m_LoggerHandle, &m_LoggerList[0], m_LoggerList.size());
				m_LoggerList.clear();

				Trace(L"LoggingList was updated");
			}else{
				// ログを読み取る
				unsigned short buf[16384];
				int read;
				read = m_ds->m_dsPipe->pread(m_LoggerHandle, buf, sizeof(buf));
				read = read / 2;
				if (0 < read){
					// 送信用のバッファにコピー
					unsigned short *send_buf = new unsigned short[read];
					/*for(int cnt = 0; cnt < read; cnt++){
						send_buf[cnt] = _byteswap_ushort(buf[cnt]);
					}*/
					memcpy(send_buf, buf, read * 2);
					
					// 送信
					emit sendLog(send_buf, read);
				}
			}
		}catch(...){
			Trace("Received an exception");

			m_ds->m_dsPipe->pclose(m_LoggerHandle);
			m_LoggerHandle = -1;
			m_LoggerTimer->stop();

			emit sendLoggingError();
		}
	}
}

// ロギングする項目を設定
void TerminalAsync::setLoggingList(char *list, unsigned int size){
	if ((list == nullptr) || (size == 0)){
		// ロギング停止
		if (0 <= m_LoggerHandle){
			// パイプを閉じる
			m_ds->m_dsPipe->pclose(m_LoggerHandle);
			m_LoggerHandle = -1;
			m_LoggerTimer->stop();

			Trace(L"Logger was closed");
		}


	}else{
		// ロギング開始
		m_LoggerList.resize(size);
		memcpy(&m_LoggerList[0], list, size);
		delete [] list;

		if (m_LoggerHandle < 0){
			// パイプを開く
			m_LoggerHandle = m_ds->m_dsPipe->popen(clDeviceState::PIPE_NAME_LOGGER, L"rw");
		}

		if (m_LoggerTimer->isActive() == false){
			m_LoggerTimer->start(LOGGER_PERIOD);

			Trace(L"Logger was started");
		}
	}
}







// 一定周期で呼び出される
void TerminalAsync::onControllerInterval(void){
	/*if (m_ControllerHandle < 0){
		// パイプが開かれていない
		m_ControllerTimer->stop();
	}else{
		emit requestControllerState();
	}*/

	emit requestControllerState();
}

// コントローラをセットする
void TerminalAsync::setControllerState(ControllerState_t *state){
	if (state != nullptr){
		if (state->Enabled != 0){
			if (m_ControllerHandle < 0){
				// パイプを開く
				m_ControllerHandle = m_ds->m_dsPipe->popen(clDeviceState::PIPE_NAME_CONTROLLER, L"w");
				m_ControllerTimer->start(CONTROLLER_PERIOD);

				Trace(L"Controller was started");
			}
			try{
				m_ds->m_dsPipe->pwrite(m_ControllerHandle, state, sizeof(ControllerState_t));
			}catch(...){
				Trace("Received an exception");

				m_ds->m_dsPipe->pclose(m_ControllerHandle);
				m_ControllerHandle = -1;
				m_ControllerTimer->stop();
			}
		}
		delete state;
	}else{
		if (0 <= m_ControllerHandle){
			// パイプを閉じる
			m_ds->m_dsPipe->pclose(m_ControllerHandle);
			m_ControllerHandle = -1;
			m_ControllerTimer->stop();

			Trace(L"Controller was closed");
		}
	}
}


