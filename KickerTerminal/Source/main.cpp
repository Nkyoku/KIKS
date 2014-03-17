// プログラマー

#include <stdio.h>
#include <locale.h>
#include <conio.h>
#include <Windows.h>
#include <Shlwapi.h>
#include <string>

#include "kicker/kicker.h"




iKicker *Kicker;		// デバイス






static void print_bool(bool p){
	if (p == true)	wprintf(L"true\n");
	else			wprintf(L"false\n");
}

static bool YesOrNo(void){
	wchar_t c;
	wprintf(L"(Y/N) > ");
	wscanf_s(L"%c", &c);
	fflush(stdin);
	return (towlower(c) == L'y');
}



// メイン
int wmain(int num_of_arg, wchar_t *arg[]){
	_wsetlocale(LC_ALL, L"");

	bool CloseAtExit = false;
	bool result = false;

	do{
		// コマンドラインの解析
		if (num_of_arg < 2){
			_putws(
				L"コマンドラインオプション\n"
				L"\t'-o デバッグ出力を表示します。' \n"
				L"\t'-a [待ち時間(ms)]' アプリケーションモードに切り替えます。\n"
				L"\t'-b [待ち時間(ms)]' ブートローダーモードに切り替えます。\n"
				L"\t'-f [HEXファイル]' フラッシュを書き換えます。\n"
				L"\t'-d [BINファイル]' フラッシュをダンプします。\n"
				L"\t'-u [BINファイル]' ユーザー領域を書き換えます。\n"
				L"\t'-s' コマンド成功時にすぐにコンソールを閉じます。\n"
				L"\t     他のオプションと一緒に指定します。"
				);
			break;
		}

		enum Switch_e{
			Switch_Default,
			Switch_DebugOutput,
			Switch_ApplicationMode,
			Switch_BootloaderMode,
			Switch_ProgramFlash,
			Switch_DumpFlash,
			Switch_ProgramUser,
		};
		Switch_e sw = Switch_Default;
		const wchar_t *filepath = L"";
		const wchar_t *extention = nullptr;
		//wchar_t partition = 0;
		int wait_time = 0;

		bool error = false;

		for(int cnt = 1; cnt < num_of_arg; cnt++){
			if (arg[cnt][0] == L'-'){
				switch(arg[cnt][1]){
				case 'o':	// デバッグ出力を表示
					sw = Switch_DebugOutput;
					break;
				case 'a':	// アプリケーションモードに切り替え
					sw = Switch_ApplicationMode;
					break;
				case 'b':	// ブートローダーモードに切り替え
					sw = Switch_BootloaderMode;
					break;
				case L'f':	// フラッシュメモリーの書き換え
					sw = Switch_ProgramFlash;
					break;
				case L'd':	// フラッシュメモリーのダンプ
					sw = Switch_DumpFlash;
					break;
				case L'u':	// ユーザー領域の書き換え
					sw = Switch_ProgramUser;
					break;
				case L's':	// 成功時に自動的に終了
					CloseAtExit = true;
					break;
				default:
					error = true;
					break;
				}
			}else{
				switch(sw){
				case Switch_ApplicationMode:
				case Switch_BootloaderMode:
					wait_time = _wtoi(arg[cnt]);	// 後続の待ち時間(ms)
					break;
				case Switch_ProgramFlash:
				case Switch_DumpFlash:
				case Switch_ProgramUser:
					filepath = arg[cnt];	// 後続のファイルパス
					break;
				default:
					error = true;
					break;
				}
			}
			
			if (error == true) break;
		}

		if ((error == true) || (sw == Switch_Default)){
			_putws(L"コマンドラインオプションが不正です。");
			break;
		}

		// ファイルパスから拡張子の部分を取り出す
		if (filepath != nullptr){
			extention = PathFindExtension(filepath);
		}

		// デバイスを開いてコマンドを実行
		Kicker = iKicker::Search();
		if ((Kicker == nullptr) || (Kicker->IsConnected() == false)){
			_putws(L"デバイスと接続できません。");
			break;
		}
		
		// 情報を表示
		VERSION_t version;
		Kicker->GetVersion(version);
		wprintf(L"第%d世代 リビジョン%c ", version.Version, L'A' + version.Revision - 1);
		if (version.Mode == MODE_APP){
			_putws(L"APPモード");
		}else{
			_putws(L"DFUモード");
		}

		switch(sw){
		case Switch_DebugOutput:
			{
				_putws(L"デバッグ出力を表示します。ESCキーで中断します。");
				result = true;
				std::wstring debug_out;
				int error_count = 0;
				while(true){
					bool escape = false;
					while(_kbhit()){
						if (_getch() == 0x1B){
							escape = true;
							break;
						}
					}
					if (escape == true) break;

					if (Kicker->GetString(debug_out) == true){
						error_count = 0;
					}else{
						error_count++;
					}
					if (10 <= error_count){
						result = false;
						break;
					}
					wprintf(debug_out.c_str());
					Sleep(50);
				}
			}
			break;

		case Switch_ApplicationMode:
			_putws(L"アプリケーションモードに切り替えます。");
			if (version.Mode == MODE_APP){
				result = true;
			}else{
				result = Kicker->ChangeMode(MODE_APP);
			}
			if (result == true){
				Sleep(wait_time);
			}
			break;
		case Switch_BootloaderMode:
			_putws(L"ブートローダーモードに切り替えます。");
			if (version.Mode == MODE_DFU){
				result = true;
			}else{
				result = Kicker->ChangeMode(MODE_DFU);
			}
			if (result == true){
				Sleep(wait_time);
			}
			break;

		case Switch_ProgramFlash:
			_putws(L"フラッシュメモリーの書き換えを行います。");
			if ((extention == nullptr) || (_wcsnicmp(extention, L".hex", 5) != 0)){
				_putws(L"拡張子が'.hex'ではありませんがよろしいですか？");
				if (!YesOrNo())
					break;
			}
			result = Kicker->FlashWriteHEX(filepath);
			break;

		case Switch_DumpFlash:
			_putws(L"フラッシュメモリーをダンプします。");
			result = Kicker->FlashReadBIN(filepath);
			break;

		case Switch_ProgramUser:
			_putws(L"ユーザー領域の書き換えを行います。");
			if ((extention == nullptr) || (_wcsnicmp(extention, L".bin", 5) != 0)){
				_putws(L"拡張子が'.bin'ではありませんがよろしいですか？");
				if (!YesOrNo())
					break;
			}
			result = Kicker->UserWriteBIN(filepath);
			break;
		}

		if (result == true){
			_putws(L"正常に終了しました。");
		}else{
			_putws(L"エラーが発生しました。");
		}
	}while(false);
	if (Kicker != nullptr){
		if (Kicker->IsConnected())
			_putws(L"デバイスを切断しました。");
		delete Kicker;
	}

	if ((CloseAtExit == false) || (result == false)){
		_putws(L"\nEnterキーを押して終了します。");
		
		wchar_t c;
		wscanf_s(L"%c", &c);
	}
	
	return (result == false) ? 1 : 0;
}
