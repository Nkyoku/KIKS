/**	@file
	@brief USB関係の構造体
*/

#ifndef USB_STRUCT_H_
#define USB_STRUCT_H_

#include "../define.h"



/*** デバイスリクエスト ***/
typedef struct{
	unsigned char bmRequestType;
	unsigned char bRequest;
	unsigned short wValue;
	unsigned short wIndex;
	unsigned short wLength;
} PACK USB_DeviceRequest_t;



#define USB_DRQ_DIR_HOST_TO_DEVICE		0x00
#define USB_DRQ_DIR_DEVICE_TO_HOST		0x80

#define USB_DRQ_TYPE_BASIC				0x00
#define USB_DRQ_TYPE_CLASS				0x20
#define USB_DRQ_TYPE_VENDOR				0x40

#define USB_DRQ_TARGET_DEVICE			0x00
#define USB_DRQ_TARGET_INTERFACE		0x01
#define USB_DRQ_TARGET_ENDPOINT			0x02
#define USB_DRQ_TARGET_OTHER			0x03

#define USB_DRQ_RQ_GET_STATUS			0
#define USB_DRQ_RQ_CLEAR_FEATURE		1
#define USB_DRQ_RQ_SET_FEATURE			3
#define USB_DRQ_RQ_SET_ADDRESS			5
#define USB_DRQ_RQ_GET_DESCRIPTOR		6
#define USB_DRQ_RQ_SET_DESCRIPTOR		7
#define USB_DRQ_RQ_GET_CONFIGURATION	8
#define USB_DRQ_RQ_SET_CONFIGURATION	9
#define USB_DRQ_RQ_GET_INTERFACE		10
#define USB_DRQ_RQ_SET_INTERFACE		11
#define USB_DRQ_RQ_SYNC_FRAME			12
#define USB_DRQ_RQ_HID_GET_REPORT		1
#define USB_DRQ_RQ_HID_SET_REPORT		9

#define USB_DESC_DEVICE					0x01
#define USB_DESC_CONFIGURATION			0x02
#define USB_DESC_STRING					0x03
#define USB_DESC_INTERFACE				0x04
#define USB_DESC_ENDPOINT				0x05
#define USB_DESC_HID					0x21
#define USB_DESC_HID_REPORT				0x22





/*** デバイス ディスクリプタ ***/
typedef struct DeviceDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short bcdUSB;
	unsigned char bDeviceClass;
	unsigned char bDeviceSubClass;
	unsigned char bDeviceProtocol;
	unsigned char bMaxPacketSize0;
	unsigned short idVendor;
	unsigned short idProduct;
	unsigned short bcdDevice;
	unsigned char iManufacturer;
	unsigned char iProduct;
	unsigned char iSerialNumber;
	unsigned char bNumConfigurations;
} PACK DeviceDescriptor_t;

/*** コンフィグレーション ディスクリプタ ***/
typedef struct ConfigurationDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short wTotalLength;
	unsigned char bNumInterfaces;
	unsigned char bConfigurationValue;
	unsigned char iConfiguration;
	unsigned char bmAttributes;
	unsigned char bMaxPower;
} PACK ConfigurationDescriptor_t;

/*** IAD ディスクリプタ  ***/
typedef struct IADescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bFirstInterface;
	unsigned char bInterfaceCount;
	unsigned char bFunctionClass;
	unsigned char bFunctionSubClass;
	unsigned char bFunctionProtocol;
	unsigned char iFunction;
} PACK IADescriptor_t;

/*** インターフェース ディスクリプタ  ***/
typedef struct InterfaceDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bInterfaceNumber;
	unsigned char bAlternateSetting;
	unsigned char bNumEndpoints;
	unsigned char bInterfaceClass;
	unsigned char bInterfaceSubClass;
	unsigned char bInterfaceProtocol;
	unsigned char iInterface;
} PACK InterfaceDescriptor_t;

/*** エンドポイント ディスクリプタ  ***/
typedef struct EndpointDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned char bEndpointAddress;
	unsigned char bmAttributes;
	unsigned short wMaxPacketSize;
	unsigned char bInterval;
} PACK EndpointDescriptor_t;

/*** ストリング ディスクリプタ  ***/
typedef struct StringDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	union{
		unsigned short *wLANGID;
		unsigned short *bString;
	};
} PACK StringDescriptor_t;

/*** HID クラス ディスクリプタ  ***/
typedef struct HIDClassDescriptor_id{
	unsigned char bLength;
	unsigned char bDescriptorType;
	unsigned short bcdHID;
	unsigned char bCountryCode;
	unsigned char bNumClassDescriptors;
	unsigned char bClassDescriptorType;
	unsigned short wClassDescriptorLength;
} PACK HIDClassDescriptor_t;



#endif
