/*-----------------------------------------------------------------------*/
/* Low level disk I/O module skeleton for FatFs     (C)ChaN, 2013        */
/*-----------------------------------------------------------------------*/
/* If a working storage control module is available, it should be        */
/* attached to the FatFs via a glue function rather than modifying it.   */
/* This is an example of glue functions to attach various exsisting      */
/* storage control module to the FatFs module with a defined API.        */
/*-----------------------------------------------------------------------*/

#include "diskio.h"		/* FatFs lower layer API */
#include "../driver/mcuflash.h"
#include "../driver/mx25l6445e.h"
#include "../driver/time.h"

#include "xprintf.h"

/* Definitions of physical drive number for each media */
#define ONBOARD1	0



#define DEBUG_MESSAGE	0
#if DEBUG_MESSAGE
#define xdebug	xprintf
#else
void xdebug(const char *fmt, ...){}
#endif



/*-----------------------------------------------------------------------*/
/* Inidialize a Drive                                                    */
/*-----------------------------------------------------------------------*/

extern "C" DSTATUS disk_initialize(
	BYTE pdrv				/* Physical drive nmuber (0..) */
)
{
	//DSTATUS stat;
	//int result;
	
	switch(pdrv){
	case ONBOARD1:
		//xdebug("disk_init()\n");
		if (SPIFlash::IsImplemented() == false){
			// SPIフラッシュの代わりに内蔵フラッシュを使う
			return 0;//STA_NODISK;
		}else{
			// SPIフラッシュ
			return 0;
		}
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Get Disk Status                                                       */
/*-----------------------------------------------------------------------*/

extern "C" DSTATUS disk_status(
	BYTE pdrv		/* Physical drive nmuber (0..) */
)
{
	//DSTATUS stat;
	//int result;
	
	switch(pdrv){
	case ONBOARD1:
		//xdebug("disk_stat()\n");
		if (SPIFlash::IsImplemented() == false){
			// SPIフラッシュの代わりに内蔵フラッシュを使う
			return 0;//STA_NODISK;
		}else{
			// SPIフラッシュ
			return 0;
		}
	}
	return STA_NOINIT;
}



/*-----------------------------------------------------------------------*/
/* Read Sector(s)                                                        */
/*-----------------------------------------------------------------------*/

extern "C" DRESULT disk_read (
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE *buff,		/* Data buffer to store read data */
	DWORD sector,	/* Sector address (LBA) */
	BYTE count		/* Number of sectors to read (1..128) */
)
{
	//DRESULT res;
	//int result;
	
	switch(pdrv){
	case ONBOARD1:
		//xdebug("disk_read(%X,%d)\n", sector, count);
		if (SPIFlash::IsImplemented() == false){
			// 内蔵フラッシュ
			do{
				bool result;
				unsigned int readbytes;
				if (MCUFlash::Open() == false) break;
				if (MCUFlash::Seek(MCUFlash::FF_START - MCUFlash::APP_START + MCUFlash::PAGE_SIZE * sector) == false) break;
				result = MCUFlash::Read(buff, MCUFlash::PAGE_SIZE * count, readbytes);
				MCUFlash::Close();
				if (result == false) break;
				return RES_OK;
			}while(false);
			return RES_ERROR;
		}else{
			// SPIフラッシュ
			if (SPIFlash::Read(SPIFlash::SECTOR_SIZE * sector, buff, SPIFlash::SECTOR_SIZE * (unsigned int)count)){
				return RES_OK;
			}
		}
	}
	return RES_PARERR;
}



/*-----------------------------------------------------------------------*/
/* Write Sector(s)                                                       */
/*-----------------------------------------------------------------------*/

#if _USE_WRITE
extern "C" DRESULT disk_write (
	BYTE pdrv,			/* Physical drive nmuber (0..) */
	const BYTE *buff,	/* Data to be written */
	DWORD sector,		/* Sector address (LBA) */
	BYTE count			/* Number of sectors to write (1..128) */
)
{
	//DRESULT res;
	//int result;
	
	switch(pdrv){
	case ONBOARD1:
		//xdebug("disk_write(%X,%d)\n", sector, count);
		if (SPIFlash::IsImplemented() == false){
			// 内蔵フラッシュ
			do{
				bool result;
				signed int num = (unsigned int)count;
				unsigned int writtenbytes;
				if (MCUFlash::Open() == false) break;
				if (MCUFlash::Seek(MCUFlash::FF_START - MCUFlash::APP_START + MCUFlash::PAGE_SIZE * sector) == false) break;
				result = MCUFlash::Write(buff, MCUFlash::PAGE_SIZE * count, writtenbytes);
				MCUFlash::Close();
				if (result == false) break;
				return RES_OK;
			}while(false);
			return RES_ERROR;
		}else{
			// SPIフラッシュ
			signed int num = (unsigned int)count;
			bool result = false;
			while(0 < num--){
				result = SPIFlash::SectorWrite(sector, buff);
				if (result == false) break;
				buff += SPIFlash::SECTOR_SIZE;
				sector++;
			}
			if (result == true){
				return RES_OK;
			}
		}
	}
	return RES_PARERR;
}
#endif


/*-----------------------------------------------------------------------*/
/* Miscellaneous Functions                                               */
/*-----------------------------------------------------------------------*/

#if _USE_IOCTL
extern "C" DRESULT disk_ioctl(
	BYTE pdrv,		/* Physical drive nmuber (0..) */
	BYTE cmd,		/* Control code */
	void *buff		/* Buffer to send/receive control data */
)
{
	//DRESULT res;
	//int result;
	
	switch(pdrv){
	case ONBOARD1:
		if (SPIFlash::IsImplemented() == false){
			// 内蔵フラッシュ
			bool result = true;
			switch(cmd){
			case CTRL_SYNC:
				break;
			
			case GET_SECTOR_COUNT:
				*(DWORD*)buff = MCUFlash::FF_SIZE / MCUFlash::PAGE_SIZE;
				break;
				
			case GET_SECTOR_SIZE:
				*(WORD*)buff = MCUFlash::PAGE_SIZE;
				break;
				
			case GET_BLOCK_SIZE:
				*(WORD*)buff = 1;
				break;
				
			case CTRL_ERASE_SECTOR:
				break;
				
			default:
				result = false;
			}
			if (result == true){
				return RES_OK;
			}
		}else{
			// SPIフラッシュ
			bool result = true;
			switch(cmd){
			case CTRL_SYNC:
				//xdebug("ioctrl_sync()\n");
				result = SPIFlash::Wait();
				break;
			
			case GET_SECTOR_COUNT:
				//xdebug("ioctrl_sector_count()\n");
				*(DWORD*)buff = SPIFlash::FLASH_SIZE / SPIFlash::SECTOR_SIZE;
				break;
				
			case GET_SECTOR_SIZE:
				//xdebug("ioctrl_sector_size()\n");
				*(WORD*)buff = SPIFlash::SECTOR_SIZE;
				break;
				
			case GET_BLOCK_SIZE:
				//xdebug("ioctrl_block_size()\n");
				*(WORD*)buff = 1;
				break;
				
			case CTRL_ERASE_SECTOR:
				{
					/*unsigned int start = ((DWORD*)buff)[0];
					unsigned int end = ((DWORD*)buff)[1];
					xprintf("ioctrl_erase_sector(%X to %X)\n", start, end);
					while(start <= end){
						result = SPIFlash::EraseSector(SPIFlash::SECTOR_SIZE * start);
						if (result == false) break;
						start++;
					}*/
				}
				break;
				
			default:
				result = false;
			}
			if (result == true){
				return RES_OK;
			}
		}
	}
	return RES_PARERR;
}
#endif



/* RTC function */
extern "C" DWORD get_fattime(void){
	return Time::GetCalender(NULL);
}
