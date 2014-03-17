// Intel-HEX�t�@�C����ǂݍ���

//#include "hexload.h"

#include <stdio.h>
#include <string.h>
#include <Windows.h>
#include <Shlwapi.h>
#pragma comment(lib, "shlwapi.lib")



// 16�i�̕�����𐔒l�ɕϊ�
unsigned int HexToInt(const wchar_t *string, wchar_t **next_ptr, unsigned int place){
	if (string == nullptr) return 0;

	bool err = false;
	unsigned int ret = 0;
	if ((0 < place) && (place <= 8)){
		for(unsigned int cnt = 0; cnt < place; cnt++){
			wchar_t c = string[cnt];
			if ((('0' <= c) && (c <= '9')) || (('A' <= c) && (c <= 'F'))){
				ret <<= 4;
				if (c <= '9'){
					ret |= c - '0';
				}else{
					ret |= c - 'A' + 10;
				}
			}else{
				err = true;
				break;
			}
			(*next_ptr)++;
		}
	}else{
		err = true;
	}
	if (err == true){
		if (next_ptr != nullptr) *next_ptr = nullptr;
		return 0;
	}
	return ret;
}



// Intel-HEX�t�@�C����ǂݍ���Ńo�b�t�@�Ɋi�[
bool LoadIntelHEX(const wchar_t *filepath, char *buf, char *used, unsigned int size, unsigned int start_address){
	FILE *fp;

	// �t�@�C�����J��
	_wfopen_s(&fp, filepath, L"r,ccs=UNICODE");
	if (fp == NULL) return false;

	// �o�b�t�@��0xFF�ŏ�����
	memset(buf, 0xFF, size);
	if (used != nullptr)
		memset(used, 0, size);

	// Intel-Hex���f�R�[�h
	bool err = false;
	unsigned int ext_address = 0;
	for(int cnt = 0; cnt < 10000; cnt++){
		wchar_t line[128];
		wchar_t *ptr;

		ptr = fgetws(line, 128, fp);
		if (ptr == nullptr){err = true; break;}
		if (*ptr++ != ':'){err = true; break;}

		unsigned int length, offset, type;
		length	= HexToInt(ptr, &ptr, 2);
		offset	= HexToInt(ptr, &ptr, 4);
		type	= HexToInt(ptr, &ptr, 2);
		if (type == 0){
			// �f�[�^
			unsigned int address = ext_address + offset - start_address;
			for(unsigned int cnt = 0; cnt < length; cnt++){
				if (address < 0) continue;
				if (size <= address) break;//{err = true; break;}
				buf[address] = HexToInt(ptr, &ptr, 2);
				if (used != nullptr)
					used[address] = 1;
				address++;
			}
			//if (err == true)
			//	break;
		}else if (type == 1){
			// �G���h
			break;
		}else if (type == 4){
			// �g�����j�A�A�h���X
			ext_address = HexToInt(ptr, &ptr, 4) << 16;
		}
	}
	fclose(fp);

	return !err;
}





