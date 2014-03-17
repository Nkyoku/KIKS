// USBディスクリプタ

#include "usb.h"



// デバイス ディスクリプタ
const DeviceDescriptor_t DeviceDescriptor = {
	18,					// bLength
	0x01,				// bDescriptorType
	SWAP16(USB_VERSION_BCD),	// bcdUSB
	0xEF,				// bDeviceClass
	0x02,				// bDeviceSubClass
	0x01,				// bDeviceProtocol
	EP0_FIFOSIZE,		// bMaxPacketSize0
	SWAP16(USB_VENDOR_ID),		// idVendor
	SWAP16(USB_PRODUCT_ID),		// idProduct
	SWAP16(USB_RELEASE_BCD),	// bcdDevice
	1,					// iManufacturer
	2,					// iProduct
	3,					// iSerialNumber
	1					// bNumConfigurations
};

// HIDレポートディスクリプタ
const char HIDReportDescriptor[] = {
	0x06, 0x00, 0xFF,	// USAGE_PAGE (Vendor Defined Page 1)
	0x09, 0x01,			// USAGE (Vendor Usage 1)
	0xA1, 0x01,			// COLLECTION (Application)
		0x15, 0x00,			// LOGICAL_MINIMUM (0)
		0x26, 0xFF, 0x00,	// LOGICAL_MAXIMUM (255)
		0x75, 0x08,			// REPORT_SIZE (8)
		0x95, 0x08,			// REPORT_COUNT (8)
		
		0x09, 0x00,			// USAGE (Undefined)
		0xB2, 0x02, 0x01,	// FEATURE (Data, Var, Abs, Buf)
		
		0x75, 0x08,			// REPORT_SIZE (8)
		0x95, 0x40,			// REPORT_COUNT (64)
		
		0x09, 0x00,			// USAGE (Undefined)
		0x81, 0x02,			// INPUT (Data, Var, Abs)
		
		0x09, 0x00,			// USAGE (Undefined)
		0x91, 0x02,			// OUTPUT (Data, Var, Abs)
	0xC0				// END_COLLECTION
};

// コンフィグレーション+インターフェース+HID+エンドポイント ディスクリプタ
const struct{
	ConfigurationDescriptor_t	Configuration;
	IADDescriptor_t				IAD;
	InterfaceDescriptor_t		Interface;
	HIDClassDescriptor_t		HIDClass;
	EndpointDescriptor_t		Endpoint1;
	EndpointDescriptor_t		Endpoint2;
} PACK ConfigurationDescriptor = {
	{	// コンフィグレーション ディスクリプタ
		9,				// bLength
		0x02,			// bDescriptorType
		SWAP16(49),		// wTotalLength
		1,				// bNumInterfaces
		1,				// bConfigurationValue
		1,				// iConfiguration
		0x80,			// bmAttributes (Bus Powered)
		75				// bMaxPower (150mA)
	},
	{	// IAD ディスクリプタ
		8,				// bLength
		0x0B,			// bDescriptorType
		0,				// bFirstInterface
		1,				// bInterfaceCount
		0x00,			// bFunctionClass
		0x00,			// bFunctionSubClass
		0x00,			// bFunctionProtocol
		3				// iFunction
	},
	{	// インターフェース ディスクリプタ
		9,				// bLength
		0x04,			// bDescriptorType
		0,				// bInterfaceNumber
		0,				// bAlternateSetting
		2,				// bNumEndpoints
		0x03,			// bInterfaceClass
		0x00,			// bInterfaceSubClass
		0,				// bInterfaceProtocol
		2				// iInterface
	},
	{	// HIDクラス ディスクリプタ
		9,				// bLength
		0x21,			// bDescriptorType;
		SWAP16(USB_HID_BCD),	// bcdHID;
		0x00,			// bCountryCode;
		1,				// bNumClassDescriptors;
		0x22,			// bClassDescriptorType;
		SWAP16(sizeof(HIDReportDescriptor))	// wClassDescriptorLength;
	},
	{	// エンドポイント1 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x01,			// bEndpointAddress (EP1, IN)
		0x03,			// bmAttributes (Interrupt)
		SWAP16(64),		// wMaxPacketSize
		1				// bInterval
	},
	{	// エンドポイント2 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x82,			// bEndpointAddress (EP2, OUT)
		0x03,			// bmAttributes (Interrupt)
		SWAP16(64),		// wMaxPacketSize
		1				// bInterval
	}
};








// ストリング ディスクリプタ0 (LANGID)
const char StringDescriptor0[] = {
	4,					// bLength
	0x03,				// bDescriptorType
	0x09, 0x04			// wLANGID
					// 0x409 English only
};

// ストリング ディスクリプタ1 (Manufacturer)
const char StringDescriptor1[] = {
	12,					// bLength
	0x03,				// bDescriptorType
	'F', 0x00,			// bString
	'u', 0x00,			// "Fujii"
	'j', 0x00,
	'i', 0x00,
	'i', 0x00
};

// ストリング ディスクリプタ1 (Product)
const char StringDescriptor2[] = {
	34,					// bLength
	0x03,				// bDescriptorType
	'M', 0x00,			// bString
	'e', 0x00,			// "Mermai Processor"
	'r', 0x00,
	'm', 0x00,
	'a', 0x00,
	'i', 0x00,
	' ', 0x00,
	'P', 0x00,
	'r', 0x00,
	'o', 0x00,
	'c', 0x00,
	'e', 0x00,
	's', 0x00,
	's', 0x00,
	'o', 0x00,
	'r', 0x00
};



