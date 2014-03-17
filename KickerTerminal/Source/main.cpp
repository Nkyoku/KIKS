// �v���O���}�[

#include <stdio.h>
#include <locale.h>
#include <conio.h>
#include <Windows.h>
#include <Shlwapi.h>
#include <string>

#include "kicker/kicker.h"




iKicker *Kicker;		// �f�o�C�X






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



// ���C��
int wmain(int num_of_arg, wchar_t *arg[]){
	_wsetlocale(LC_ALL, L"");

	bool CloseAtExit = false;
	bool result = false;

	do{
		// �R�}���h���C���̉��
		if (num_of_arg < 2){
			_putws(
				L"�R�}���h���C���I�v�V����\n"
				L"\t'-o �f�o�b�O�o�͂�\�����܂��B' \n"
				L"\t'-a [�҂�����(ms)]' �A�v���P�[�V�������[�h�ɐ؂�ւ��܂��B\n"
				L"\t'-b [�҂�����(ms)]' �u�[�g���[�_�[���[�h�ɐ؂�ւ��܂��B\n"
				L"\t'-f [HEX�t�@�C��]' �t���b�V�������������܂��B\n"
				L"\t'-d [BIN�t�@�C��]' �t���b�V�����_���v���܂��B\n"
				L"\t'-u [BIN�t�@�C��]' ���[�U�[�̈�����������܂��B\n"
				L"\t'-s' �R�}���h�������ɂ����ɃR���\�[������܂��B\n"
				L"\t     ���̃I�v�V�����ƈꏏ�Ɏw�肵�܂��B"
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
				case 'o':	// �f�o�b�O�o�͂�\��
					sw = Switch_DebugOutput;
					break;
				case 'a':	// �A�v���P�[�V�������[�h�ɐ؂�ւ�
					sw = Switch_ApplicationMode;
					break;
				case 'b':	// �u�[�g���[�_�[���[�h�ɐ؂�ւ�
					sw = Switch_BootloaderMode;
					break;
				case L'f':	// �t���b�V���������[�̏�������
					sw = Switch_ProgramFlash;
					break;
				case L'd':	// �t���b�V���������[�̃_���v
					sw = Switch_DumpFlash;
					break;
				case L'u':	// ���[�U�[�̈�̏�������
					sw = Switch_ProgramUser;
					break;
				case L's':	// �������Ɏ����I�ɏI��
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
					wait_time = _wtoi(arg[cnt]);	// �㑱�̑҂�����(ms)
					break;
				case Switch_ProgramFlash:
				case Switch_DumpFlash:
				case Switch_ProgramUser:
					filepath = arg[cnt];	// �㑱�̃t�@�C���p�X
					break;
				default:
					error = true;
					break;
				}
			}
			
			if (error == true) break;
		}

		if ((error == true) || (sw == Switch_Default)){
			_putws(L"�R�}���h���C���I�v�V�������s���ł��B");
			break;
		}

		// �t�@�C���p�X����g���q�̕��������o��
		if (filepath != nullptr){
			extention = PathFindExtension(filepath);
		}

		// �f�o�C�X���J���ăR�}���h�����s
		Kicker = iKicker::Search();
		if ((Kicker == nullptr) || (Kicker->IsConnected() == false)){
			_putws(L"�f�o�C�X�Ɛڑ��ł��܂���B");
			break;
		}
		
		// ����\��
		VERSION_t version;
		Kicker->GetVersion(version);
		wprintf(L"��%d���� ���r�W����%c ", version.Version, L'A' + version.Revision - 1);
		if (version.Mode == MODE_APP){
			_putws(L"APP���[�h");
		}else{
			_putws(L"DFU���[�h");
		}

		switch(sw){
		case Switch_DebugOutput:
			{
				_putws(L"�f�o�b�O�o�͂�\�����܂��BESC�L�[�Œ��f���܂��B");
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
			_putws(L"�A�v���P�[�V�������[�h�ɐ؂�ւ��܂��B");
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
			_putws(L"�u�[�g���[�_�[���[�h�ɐ؂�ւ��܂��B");
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
			_putws(L"�t���b�V���������[�̏����������s���܂��B");
			if ((extention == nullptr) || (_wcsnicmp(extention, L".hex", 5) != 0)){
				_putws(L"�g���q��'.hex'�ł͂���܂��񂪂�낵���ł����H");
				if (!YesOrNo())
					break;
			}
			result = Kicker->FlashWriteHEX(filepath);
			break;

		case Switch_DumpFlash:
			_putws(L"�t���b�V���������[���_���v���܂��B");
			result = Kicker->FlashReadBIN(filepath);
			break;

		case Switch_ProgramUser:
			_putws(L"���[�U�[�̈�̏����������s���܂��B");
			if ((extention == nullptr) || (_wcsnicmp(extention, L".bin", 5) != 0)){
				_putws(L"�g���q��'.bin'�ł͂���܂��񂪂�낵���ł����H");
				if (!YesOrNo())
					break;
			}
			result = Kicker->UserWriteBIN(filepath);
			break;
		}

		if (result == true){
			_putws(L"����ɏI�����܂����B");
		}else{
			_putws(L"�G���[���������܂����B");
		}
	}while(false);
	if (Kicker != nullptr){
		if (Kicker->IsConnected())
			_putws(L"�f�o�C�X��ؒf���܂����B");
		delete Kicker;
	}

	if ((CloseAtExit == false) || (result == false)){
		_putws(L"\nEnter�L�[�������ďI�����܂��B");
		
		wchar_t c;
		wscanf_s(L"%c", &c);
	}
	
	return (result == false) ? 1 : 0;
}
