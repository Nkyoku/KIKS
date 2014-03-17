/**	@file
	@brief USBディスクリプタ
*/



/*** デバイス情報 ***/
#define USB_VERSION_BCD			0x0200
#define USB_VENDOR_ID			0x16C0
#define USB_PRODUCT_ID			0x27D8
#define USB_RELEASE_BCD			0x0501

#define USB_LANGID_ENGLISH		0x409



// デバイス ディスクリプタ
static const DeviceDescriptor_t DeviceDescriptor = {
	18,					// bLength
	0x01,				// bDescriptorType
	SWAP16(USB_VERSION_BCD),	// bcdUSB
	0xEF,				// bDeviceClass
	0x02,				// bDeviceSubClass
	0x01,				// bDeviceProtocol
	64,					// bMaxPacketSize0
	SWAP16(USB_VENDOR_ID),		// idVendor
	SWAP16(USB_PRODUCT_ID),		// idProduct
	SWAP16(USB_RELEASE_BCD),	// bcdDevice
	1,					// iManufacturer
	2,					// iProduct
	3,					// iSerialNumber
	1					// bNumConfigurations
};

// コンフィグレーション+IA+インターフェース+エンドポイント ディスクリプタ
static const struct{
	ConfigurationDescriptor_t	Configuration;
	IADescriptor_t				IAD;
	InterfaceDescriptor_t		Interface;
	EndpointDescriptor_t		Endpoint1;
	EndpointDescriptor_t		Endpoint2;
	EndpointDescriptor_t		Endpoint3;
	EndpointDescriptor_t		Endpoint4;
} PACK ConfigurationDescriptor = {
	{	// コンフィグレーション ディスクリプタ
		9,				// bLength
		0x02,			// bDescriptorType
		SWAP16(54),		// wTotalLength
		1,				// bNumInterfaces
		1,				// bConfigurationValue
		1,				// iConfiguration
		0xC0,			// bmAttributes (Self Powered)
		25				// bMaxPower (50mA)
	},
	{	// インターフェース アソシエーション ディスクリプタ
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
		4,				// bNumEndpoints
		0xFF,			// bInterfaceClass (Vendor)
		0xFF,			// bInterfaceSubClass
		0x00,			// bInterfaceProtocol
		2				// iInterface
	},
	{	// エンドポイント1 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x81,			// bEndpointAddress (EP1, IN)
		0x02,			// bmAttributes (Bulk)
		SWAP16(64),		// wMaxPacketSize
		0				// bInterval
	},
	{	// エンドポイント2 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x02,			// bEndpointAddress (EP2, OUT)
		0x02,			// bmAttributes (Bulk)
		SWAP16(64),		// wMaxPacketSize
		0				// bInterval
	},
	{	// エンドポイント3 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x83,			// bEndpointAddress (EP3, IN)
		0x02,			// bmAttributes (Bulk)
		SWAP16(64),		// wMaxPacketSize
		0				// bInterval
	},
	{	// エンドポイント4 ディスクリプタ
		7,				// bLength
		0x05,			// bDescriptorType
		0x04,			// bEndpointAddress (EP4, OUT)
		0x02,			// bmAttributes (Bulk)
		SWAP16(64),		// wMaxPacketSize
		0				// bInterval
	}
};








// ストリング ディスクリプタ0 (LANGID)
static const char StringDescriptor0[] = {
	4,					// bLength
	0x03,				// bDescriptorType
	0x09, 0x04			// wLANGID
					// 0x409 English only
};

// ストリング ディスクリプタ1 (Manufacturer)
static const char StringDescriptor1[] = {
	10,					// bLength
	0x03,				// bDescriptorType
	'K', 0x00,			// bString
	'I', 0x00,			// "KIKS"
	'K', 0x00,
	'S', 0x00
};

// ストリング ディスクリプタ2 (Product)
static const char StringDescriptor2[] = {
	30,					// bLength
	0x03,				// bDescriptorType
	'K', 0x00,			// bString
	'I', 0x00,			// "KIKS SSL Gen.5"
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
	'5', 0x00,
};

// ストリング ディスクリプタ3 (Serial Number)
static const char StringDescriptor3[] = {
	24,					// bLength
	0x03,				// bDescriptorType
	'K', 0x00,			// bString
	'I', 0x00,			// "KIKS SN0000"
	'K', 0x00,
	'S', 0x00,
	' ', 0x00,
	'S', 0x00,
	'N', 0x00,
	'0', 0x00,
	'0', 0x00,
	'0', 0x00,
	'0', 0x00
};


