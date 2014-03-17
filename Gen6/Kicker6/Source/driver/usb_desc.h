/**	@file
	@brief USBディスクリプタ
*/

#include <avr/pgmspace.h>



/*** デバイス情報 ***/
#define USB_VERSION_BCD			0x0200
#define USB_VENDOR_ID			0x16C0
#define USB_PRODUCT_ID			0x05DF
#define USB_RELEASE_BCD			0x0601
#define USB_HID_BCD				0x0111

#define USB_LANGID_ENGLISH		0x409



// デバイス ディスクリプタ
static const DeviceDescriptor_t DeviceDescriptor PROGMEM = {
	18,					// bLength
	0x01,				// bDescriptorType
	USB_VERSION_BCD,	// bcdUSB
	0x00,				// bDeviceClass
	0x00,				// bDeviceSubClass
	0x00,				// bDeviceProtocol
	64,					// bMaxPacketSize0
	USB_VENDOR_ID,		// idVendor
	USB_PRODUCT_ID,		// idProduct
	USB_RELEASE_BCD,	// bcdDevice
	1,					// iManufacturer
	2,					// iProduct
	3,					// iSerialNumber
	1					// bNumConfigurations
};

/*// HIDレポートディスクリプタ
const unsigned char HIDReportDescriptor[] = {
	0x06, 0xFF, 0xFF,	// USAGE_PAGE (Vendor Defined Page 1)
	0x09, 0x01,			// USAGE (Vendor Usage 1)
	0xA1, 0x01,			// COLLECTION (Application)
	
		0x09, 0x02,			// USAGE (Vender defined)
		0x09, 0x03,			// USAGE (Vender defined)
		0x15, 0x00,			// LOGICAL_MINIMUM (0)
		0x26, 0xFF, 0x00,	// LOGICAL_MAXIMUM (255)
		0x75, 0x08,			// REPORT_SIZE (8)
		0x95, 0x40,			// REPORT_COUNT (64)
		0x81, 0x02,			// INPUT (Data, Var, Abs)
		
		0x09, 0x04,			// USAGE (Vender defined)
		0x09, 0x05,			// USAGE (Vender defined)
		0x15, 0x00,			// LOGICAL_MINIMUM (0)
		0x26, 0xFF, 0x00,	// LOGICAL_MAXIMUM (255)
		0x75, 0x08,			// REPORT_SIZE (8)
		0x95, 0x40,			// REPORT_COUNT (64)
		0x91, 0x02,			// OUTPUT (Data, Var, Abs)
		
		0x09, 0x06,			// USAGE (Vender defined)
		0x09, 0x07,			// USAGE (Vender defined)
		0x15, 0x00,			// LOGICAL_MINIMUM (0)
		0x26, 0xFF, 0x00,	// LOGICAL_MAXIMUM (255)
		0x75, 0x08,			// REPORT_SIZE (8)
		0x95, 0x08,			// REPORT_COUNT (64)
		0xB1, 0x02,			// FEATURE (Data, Var, Abs, Buf)
		
	0xC0				// END_COLLECTION
};*/

// コンフィグレーション+インターフェース+エンドポイント ディスクリプタ
static const struct USBDescriptors_t{
	ConfigurationDescriptor_t	Configuration;
	InterfaceDescriptor_t		Interface;
	//HIDClassDescriptor_t		HIDClass;
} PACK ConfigurationDescriptor PROGMEM = {
	{	// コンフィグレーション ディスクリプタ
		9,				// bLength
		0x02,			// bDescriptorType
		sizeof(USBDescriptors_t),	// wTotalLength
		1,				// bNumInterfaces
		1,				// bConfigurationValue
		0,				// iConfiguration
		0x80,			// bmAttributes (Bus Powered)
		25				// bMaxPower (50mA)
	},
	{	// インターフェース ディスクリプタ
		9,				// bLength
		0x04,			// bDescriptorType
		0,				// bInterfaceNumber
		0,				// bAlternateSetting
		0,				// bNumEndpoints
		0xFF,			// bInterfaceClass (Vendor)
		0x00,			// bInterfaceSubClass
		0x00,			// bInterfaceProtocol
		0				// iInterface
	},
	/*{	// HIDクラス ディスクリプタ
		9,				// bLength
		0x21,			// bDescriptorType;
		USB_HID_BCD,	// bcdHID;
		0x00,			// bCountryCode;
		1,				// bNumClassDescriptors;
		0x22,			// bClassDescriptorType;
		sizeof(HIDReportDescriptor)	// wClassDescriptorLength;
	}*/
};








// ストリング ディスクリプタ0 (LANGID)
static const char StringDescriptor0[] PROGMEM = {
	4,					// bLength
	0x03,				// bDescriptorType
	0x09, 0x04			// wLANGID
						// 0x409 English only
};

// ストリング ディスクリプタ1 (Manufacturer)
static const char StringDescriptor1[] PROGMEM = {
	10,					// bLength
	0x03,				// bDescriptorType
	'K', 0x00,			// bString
	'I', 0x00,			// "KIKS"
	'K', 0x00,
	'S', 0x00
};

// ストリング ディスクリプタ2 (Product)
static const char StringDescriptor2[] PROGMEM = {
	44,					// bLength
	0x03,				// bDescriptorType
	'K', 0x00,			// bString
	'I', 0x00,			// "KIKS SSL Gen.6 Kicker"
	'K', 0x00,
	'S', 0x00,
	' ', 0x00,
	'S', 0x00,
	'S', 0x00,
	'L', 0x00,
	' ', 0x00,
	'G', 0x00,
	'e', 0x00,
	'n', 0x00,
	'.', 0x00,
	'6', 0x00,
	' ', 0x00,
	'K', 0x00,
	'i', 0x00,
	'c', 0x00,
	'k', 0x00,
	'e', 0x00,
	'r', 0x00,
};

// ストリング ディスクリプタ3 (Serial Number)
static const char StringDescriptor3[] PROGMEM = {
	10,					// bLength
	0x03,				// bDescriptorType
	'0', 0x00,			// bString
	'6', 0x00,			// "0601"
	'0', 0x00,
	'1', 0x00
};

// ストリング ディスクリプタのテーブル
static const char *StringDescriptors[4] = {
	StringDescriptor0,
	StringDescriptor1,
	StringDescriptor2,
	StringDescriptor3
};



