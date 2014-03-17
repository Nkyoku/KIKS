// ���b�Z�[�W

#pragma once



#define SPLIT_GROUP(m)		((m) & 0xFF00)
#define SPLIT_MESSAGE(m)	((m) & 0xFF)



// ���b�Z�[�W�O���[�v
enum MGRP_e{
	MGRP_GENERAL	= 1 << 8,	// ���
	MGRP_FIRMWARE	= 2 << 8,	// �t�@�[���E�F�A
	MGRP_CONFIG		= 3 << 8,	// �R���t�B�O���[�V����
	MGRP_MOTCOP		= 4 << 8,	// ���[�^�[�R�v���Z�b�T
	MGRP_FLASH		= 5 << 8,	// �t���b�V���������[
	MGRP_PLOT		= 6 << 8,	// �v���b�g
	MGRP_SIGNAL		= 7 << 8,	// �M���ϑ�
	
	
	MGRP_PDI		= 72 << 8,	// (�B)PDI
	
};

// ���M���b�Z�[�WID
enum MTX_e{

	MTX_GENERAL_WRITE		= 1,	// �f�[�^��]������
	MTX_GENERAL_RUNPACKET	= 10,	// ����ݒ�𖳐��p�P�b�g�`���ő��M
	MTX_GENERAL_RUNSETTING	= 11,	// ����ݒ�𐶂ő���

	MTX_FIRMWARE_BEGIN		= 1,	// �]�����J�n����
	MTX_FIRMWARE_END		= 2,	// �]�����I������
	MTX_FIRMWARE_WRITE		= 3,	// ��������
	MTX_FIRMWARE_READ		= 4,	// �ǂݍ���

	MTX_CONFIG_BEGIN		= 1,	// �R���t�B�O���J�n����
	MTX_CONFIG_END			= 2,	// �R���t�B�O���I������
	MTX_CONFIG_WRITE		= 3,	// �]������

	MTX_MOTCOP_BEGIN		= 1,	// �]�����J�n����
	MTX_MOTCOP_END			= 2,	// �]�����I������
	MTX_MOTCOP_WRITE		= 3,	// �]������

	MTX_FLASH_BEGIN			= 1,	// �������݂��J�n����
	MTX_FLASH_END			= 2,	// �������݂��I������
	MTX_FLASH_WRITE			= 3,	// ��������
	MTX_FLASH_READ			= 4,	// �ǂݍ���
	MTX_FLASH_ERASE			= 5,	// 4KB�Z�N�^�[�E64KB�u���b�N����������

	MTX_PLOT_GET			= 1,	// �v���b�g�f�[�^��v������
	
	MTX_SIGNAL_START		= 1,	// �ϑ����J�n
	MTX_SIGNAL_STOP			= 2,	// �ϑ����~
	MTX_SIGNAL_GET			= 3,	// �ϑ��f�[�^�𑗐M��v��
	
	


	MTX_PDI_BEGIN			= 1,	// PDI�������݂��J�n
	MTX_PDI_END				= 2,	// PDI�������݂��I��
	MTX_PDI_WRITE			= 3,	// ��������
	MTX_PDI_READ			= 4,	// �ǂݏo��
	
	
};

// ��M���b�Z�[�WID
enum MRX_e{



	MRX_FIRMWARE_COMPLETE	= 101,	// ����̊�����ʒm����
	MRX_FIRMWARE_READ		= 102,	// �ǂݍ��񂾃f�[�^��Ԃ�

	MRX_CONFIG_COMPLETE		= 101,	// ����̊�����ʒm����

	MRX_MOTCOP_COMPLETE		= 101,	// ����̊�����ʒm����

	MRX_FLASH_COMPLETE		= 101,	// ����̊�����ʒm����
	MRX_FLASH_READ			= 102,	// �ǂݍ��񂾃f�[�^��Ԃ�

	MRX_PLOT_OUTPUT			= 101,	// �o�͒l�̃v���b�g��Ԃ�
	MRX_PLOT_INPUT			= 102,	// ���͒l�̃v���b�g��Ԃ�
	
	MRX_SIGNAL_STATUS		= 101,	// �ϑ��̏�Ԃ�ʒm����
	MRX_SIGNAL_CHANNEL		= 102,	// �Ԃ��ϑ��f�[�^�̃`�����l����ʒm����
	MRX_SIGNAL_DATA			= 103,	// �ϑ��f�[�^��Ԃ�
	
	MRX_PDI_STATUS			= 101,	// ��Ԃ�ʒm����
	MRX_PDI_COMPLETE		= 102,	// ����̊�����ʒm����
	MRX_PDI_READ			= 103,	// �ǂݏo�����f�[�^��Ԃ�
	
};







