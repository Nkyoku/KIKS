// �R���g���[���Ƃ��Ă̓���

#include "control.h"
#include "driver/ui.h"
#include "driver/xbee.h"
#include "driver/debug.h"





// �R���g���[����������
void Control_Init(void){
	const static TaskDesc_t desc = {Control_TaskInit, Control_TaskMain, Control_TaskExit};
	Task_Create(&desc, 1000 / F_CONTROL_TASK);
}



// �R���g���[���̏��������[�`��
bool Control_TaskInit(const void *init_data){
	
	
	return true;
}

// �R���g���[���̃��C�����[�`��
int MachineID = 0;
bool KickPower = false;
bool KickMode = false;
void Control_TaskMain(void){
	int vel = 0;	// �ړ����x
	int dir = 0;	// �ړ�����
	int rot = 0;	// ��]���x
	
	const int LINEAR_SPEED	= 50;	// �P�ʒ������x
	const int TURN_SPEED	= 50;	// �P�ʉ�]���x
	
	
	// �X�C�b�`���͂���p�����[�^���Z�b�g
	
	// ��]
	if (GetSwitch(SW_ROL))	rot += TURN_SPEED;
	if (GetSwitch(SW_ROR))	rot -= TURN_SPEED;
	
	vel = LINEAR_SPEED;
	if (GetSwitch(SW_FN2)){vel /= 2;	rot /= 2;}	// ���x�̒����p
	
	// ���s�ړ�
	int vec_h = 0, vec_v = 0;
	if (GetSwitch(SW_LEFT))		vec_h -= 1;
	if (GetSwitch(SW_RIGHT))	vec_h += 1;
	if (GetSwitch(SW_UP))		vec_v += 1;
	if (GetSwitch(SW_DOWN))		vec_v -= 1;
	
	if ((vec_h != 0) || (vec_v != 0)){
		if ((vec_h == 1) && (vec_v == 0))	dir = 0;
		if ((vec_h == 1) && (vec_v == 1))	dir = 32;
		if ((vec_h == 0) && (vec_v == 1))	dir = 64;
		if ((vec_h == -1) && (vec_v == 1))	dir = 96;
		if ((vec_h == -1) && (vec_v == 0))	dir = 128;
		if ((vec_h == -1) && (vec_v == -1))	dir = 160;
		if ((vec_h == 0) && (vec_v == -1))	dir = 192;
		if ((vec_h == 1) && (vec_v == -1))	dir = 224;
	}else{
		vel = 0;
	}		
	
	// �}�V��ID
	if (GetTriggerAndReset(SW_FN1) && GetSwitch(SW_FN1))	MachineID++;
	if (MachineID < 0) MachineID = 9;
	else if (9 < MachineID) MachineID = 0;
	SetDisplay(MachineID);
	
	// �L�b�N�E�h���u��
	if (GetTriggerAndReset(SW_FN4) && GetSwitch(SW_FN4))	KickPower = !KickPower;
	SetLED(LED_DVERR, KickPower);
	SetLED(LED_DVWRN, KickMode);
	
	// �f�[�^���i�[
	unsigned char data[11] = {0}, flags1 = 0;
	data[0]	= MachineID + 1;
	data[1]	= vel;
	data[2]	= dir;
	if (rot < 0){
		flags1 |= 0x80;
		rot = -rot;
	}
	data[3] = rot;
	
	if (GetSwitch(SW_FN5))	flags1 |= 0x40;	// �h���u��
	if (GetTriggerAndReset(SW_FN6) && GetSwitch(SW_FN6)){
		flags1 |= 0x20 | 0x10;	// �m�[�}���L�b�N
		KickMode = false;
	}
	if (GetTriggerAndReset(SW_FN3) && GetSwitch(SW_FN3)){
		flags1 |= 0x20;	// �`�b�v�L�b�N
		KickMode = true;
	}
	data[4] = flags1;
		
	if (KickPower)	data[5] = 200;
	else			data[5] = 20;
	
	// �g���n�~���O������t�^
	for(int cnt = 0; cnt < 3; cnt += 1){
		int word = data[cnt * 2];
		word = (word << 8) | data[cnt * 2 + 1];
		data[cnt + 6] = CalcHamming(word);
	}

	data[9]	= 0x0D;
	data[10]= 0x0A;
	XBee_SendData(data, 11);
	PutString((char*)data);
}

// �R���g���[���̏I�����[�`��
void Control_TaskExit(void){
	
	
	
}






// �g���n�~���O�������v�Z
unsigned char CalcHamming(unsigned int word){
	static const unsigned int HammingGenTable[5] = {0xAD5B, 0x366D, 0xC78E, 0x07F0, 0xF800};
	
	unsigned char ecc = 0;
	for(int i = 0; i < 5; i++){
		ecc |= (POPCNT(word & HammingGenTable[i]) % 2) << i;
	}
	ecc |= (POPCNT((word << 8) | ecc) % 2) << 5;
	
	return ecc;
}

