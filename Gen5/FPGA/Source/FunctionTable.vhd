--!	@file
--!	@brief 関数テーブル



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package FunctionTable_pkg is
	component FunctionTable is
		port(
			CLK_IN		: in	std_logic;
			DATA_EN		: in	std_logic;
			DATA_DONE	: out	std_logic;
			DATA_SEL	: in	std_logic_vector(1 downto 0);
			DATA_PTR	: in	std_logic_vector(15 downto 0);
			DATA_OUT	: out	std_logic_vector(15 downto 0)
		);
	end component;
	
	component CountingShifter is
		port(
			CLK_IN		: in	std_logic;
			DATA_EN		: in	std_logic;
			DATA_DONE	: out	std_logic;
			DATA_IN		: in	std_logic_vector(31 downto 0);
			DATA_OUT	: out	std_logic_vector(31 downto 0);
			DATA_SA		: out	std_logic_vector(5 downto 0)
		);
	end component;
	
	component IterationalShifter is
		port(
			CLK_IN		: in	std_logic;
			DATA_EN		: in	std_logic;
			DATA_DONE	: out	std_logic;
			DATA_SA		: in	std_logic_vector(5 downto 0);
			DATA_IN		: in	std_logic_vector(31 downto 0);
			DATA_OUT	: out	std_logic_vector(31 downto 0)
		);
	end component;
	
end FunctionTable_pkg;



---- FunctionTable --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FunctionTable is
	port(
	-- クロック入力
		CLK_IN		: in	std_logic;
		
	-- データ選択・出力
		DATA_EN		: in	std_logic;
		DATA_DONE	: out	std_logic;
		DATA_SEL	: in	std_logic_vector(1 downto 0);
		DATA_PTR	: in	std_logic_vector(15 downto 0);
		DATA_OUT	: out	std_logic_vector(15 downto 0)
	);
end;

architecture RTL of FunctionTable is
	
	component FUNCDSP
		port(
			clk	: in	std_logic;
			ce	: in	std_logic;
			a	: in	std_logic_vector(15 downto 0);
			b	: in	std_logic_vector(8 downto 0);
			c	: in	std_logic_vector(24 downto 0);
			d	: in	std_logic_vector(15 downto 0);
			p	: out	std_logic_vector(25 downto 0)
		);
	end component;
	
	--   0- 255	対数テーブル
	-- 256- 511	指数テーブル
	-- 512- 767	サインテーブル
	-- 768-1023	アークサインテーブル
	subtype FUNC_TABLE_WORD is std_logic_vector(15 downto 0);
	type FUNC_TABLE_TYPE is array (0 to 1023) of FUNC_TABLE_WORD;
	constant FUNC_TABLE : FUNC_TABLE_TYPE := (
			X"0000", X"0070", X"00DF", X"014D", X"01B9", X"0224", X"028E", X"02F6", X"035D", X"03C2", X"0426", X"0489", X"04EB", X"054B", X"05AA", X"0607",
			X"0663", X"06BE", X"0718", X"0771", X"07C8", X"081E", X"0872", X"08C6", X"0918", X"0969", X"09B9", X"0A08", X"0A55", X"0AA2", X"0AED", X"0B37",
			X"0B80", X"0BC7", X"0C0E", X"0C53", X"0C98", X"0CDB", X"0D1D", X"0D5E", X"0D9E", X"0DDD", X"0E1B", X"0E58", X"0E93", X"0ECE", X"0F08", X"0F40",
			X"0F78", X"0FAE", X"0FE4", X"1018", X"104C", X"107E", X"10B0", X"10E0", X"1110", X"113E", X"116C", X"1198", X"11C4", X"11EF", X"1219", X"1241",
			X"1269", X"1290", X"12B6", X"12DC", X"1300", X"1323", X"1346", X"1367", X"1388", X"13A8", X"13C7", X"13E5", X"1402", X"141E", X"143A", X"1455",
			X"146E", X"1487", X"14A0", X"14B7", X"14CD", X"14E3", X"14F8", X"150C", X"151F", X"1532", X"1543", X"1554", X"1564", X"1574", X"1582", X"1590",
			X"159D", X"15A9", X"15B4", X"15BF", X"15C9", X"15D2", X"15DB", X"15E3", X"15EA", X"15F0", X"15F5", X"15FA", X"15FE", X"1602", X"1604", X"1606",
			X"1608", X"1608", X"1608", X"1607", X"1606", X"1604", X"1601", X"15FD", X"15F9", X"15F4", X"15EF", X"15E8", X"15E2", X"15DA", X"15D2", X"15C9",
			X"15C0", X"15B6", X"15AB", X"159F", X"1593", X"1587", X"1579", X"156C", X"155D", X"154E", X"153E", X"152E", X"151D", X"150B", X"14F9", X"14E7",
			X"14D3", X"14BF", X"14AB", X"1496", X"1480", X"146A", X"1453", X"143C", X"1424", X"140B", X"13F2", X"13D8", X"13BE", X"13A3", X"1388", X"136C",
			X"1350", X"1333", X"1315", X"12F7", X"12D8", X"12B9", X"1299", X"1279", X"1258", X"1237", X"1215", X"11F3", X"11D0", X"11AD", X"1189", X"1165",
			X"1140", X"111A", X"10F5", X"10CE", X"10A7", X"1080", X"1058", X"1030", X"1007", X"0FDD", X"0FB3", X"0F89", X"0F5E", X"0F33", X"0F07", X"0EDB",
			X"0EAE", X"0E81", X"0E53", X"0E25", X"0DF7", X"0DC8", X"0D98", X"0D68", X"0D38", X"0D07", X"0CD6", X"0CA4", X"0C72", X"0C3F", X"0C0C", X"0BD8",
			X"0BA4", X"0B70", X"0B3B", X"0B05", X"0AD0", X"0A9A", X"0A63", X"0A2C", X"09F4", X"09BC", X"0984", X"094B", X"0912", X"08D9", X"089F", X"0864",
			X"0829", X"07EE", X"07B3", X"0777", X"073A", X"06FD", X"06C0", X"0682", X"0644", X"0606", X"05C7", X"0588", X"0548", X"0508", X"04C8", X"0487",
			X"0446", X"0404", X"03C2", X"0380", X"033D", X"02FA", X"02B7", X"0273", X"022F", X"01EA", X"01A5", X"0160", X"011A", X"00D4", X"008D", X"0047",
			
			X"0000", X"FFB1", X"FF63", X"FF16", X"FEC9", X"FE7D", X"FE31", X"FDE5", X"FD9B", X"FD50", X"FD06", X"FCBD", X"FC74", X"FC2B", X"FBE3", X"FB9C",
			X"FB55", X"FB0F", X"FAC9", X"FA83", X"FA3E", X"F9FA", X"F9B6", X"F973", X"F930", X"F8ED", X"F8AB", X"F86A", X"F829", X"F7E9", X"F7A9", X"F76A",
			X"F72B", X"F6ED", X"F6AF", X"F672", X"F635", X"F5F9", X"F5BE", X"F582", X"F548", X"F50E", X"F4D5", X"F49C", X"F463", X"F42B", X"F3F4", X"F3BD",
			X"F387", X"F351", X"F31C", X"F2E8", X"F2B4", X"F280", X"F24D", X"F21B", X"F1E9", X"F1B8", X"F187", X"F157", X"F128", X"F0F9", X"F0CA", X"F09D",
			X"F06F", X"F043", X"F017", X"EFEB", X"EFC0", X"EF96", X"EF6C", X"EF43", X"EF1A", X"EEF2", X"EECA", X"EEA4", X"EE7D", X"EE57", X"EE32", X"EE0E",
			X"EDEA", X"EDC7", X"EDA4", X"ED82", X"ED60", X"ED3F", X"ED1F", X"ECFF", X"ECE0", X"ECC2", X"ECA4", X"EC86", X"EC6A", X"EC4E", X"EC32", X"EC17",
			X"EBFD", X"EBE4", X"EBCB", X"EBB2", X"EB9B", X"EB84", X"EB6D", X"EB57", X"EB42", X"EB2E", X"EB1A", X"EB07", X"EAF4", X"EAE2", X"EAD1", X"EAC0",
			X"EAB0", X"EAA1", X"EA92", X"EA84", X"EA76", X"EA6A", X"EA5E", X"EA52", X"EA47", X"EA3D", X"EA34", X"EA2B", X"EA23", X"EA1C", X"EA15", X"EA0F",
			X"EA09", X"EA05", X"EA01", X"E9FD", X"E9FB", X"E9F9", X"E9F7", X"E9F7", X"E9F7", X"E9F8", X"E9F9", X"E9FB", X"E9FE", X"EA02", X"EA06", X"EA0B",
			X"EA11", X"EA17", X"EA1E", X"EA26", X"EA2F", X"EA38", X"EA42", X"EA4D", X"EA58", X"EA64", X"EA71", X"EA7F", X"EA8D", X"EA9C", X"EAAC", X"EABD",
			X"EACE", X"EAE0", X"EAF3", X"EB06", X"EB1A", X"EB2F", X"EB45", X"EB5C", X"EB73", X"EB8B", X"EBA4", X"EBBD", X"EBD8", X"EBF3", X"EC0F", X"EC2B",
			X"EC49", X"EC67", X"EC86", X"ECA5", X"ECC6", X"ECE7", X"ED09", X"ED2C", X"ED50", X"ED74", X"ED99", X"EDBF", X"EDE6", X"EE0E", X"EE36", X"EE5F",
			X"EE89", X"EEB4", X"EEE0", X"EF0C", X"EF3A", X"EF68", X"EF97", X"EFC6", X"EFF7", X"F028", X"F05B", X"F08E", X"F0C1", X"F0F6", X"F12C", X"F162",
			X"F199", X"F1D1", X"F20A", X"F244", X"F27F", X"F2BA", X"F2F6", X"F334", X"F372", X"F3B0", X"F3F0", X"F431", X"F472", X"F4B5", X"F4F8", X"F53C",
			X"F581", X"F5C7", X"F60E", X"F655", X"F69E", X"F6E7", X"F732", X"F77D", X"F7C9", X"F816", X"F864", X"F8B3", X"F902", X"F953", X"F9A5", X"F9F7",
			X"FA4A", X"FA9F", X"FAF4", X"FB4A", X"FBA1", X"FBF9", X"FC52", X"FCAC", X"FD07", X"FD63", X"FDBF", X"FE1D", X"FE7C", X"FEDB", X"FF3C", X"FF9D",
			
			X"0000", X"0092", X"0124", X"01B6", X"0248", X"02DA", X"036C", X"03FE", X"0490", X"0521", X"05B3", X"0644", X"06D5", X"0766", X"07F7", X"0887",
			X"0918", X"09A8", X"0A38", X"0AC7", X"0B56", X"0BE5", X"0C74", X"0D02", X"0D90", X"0E1E", X"0EAB", X"0F38", X"0FC4", X"1050", X"10DC", X"1167",
			X"11F1", X"127C", X"1305", X"138E", X"1417", X"149F", X"1527", X"15AE", X"1634", X"16BA", X"173F", X"17C3", X"1847", X"18CB", X"194D", X"19CF",
			X"1A50", X"1AD1", X"1B50", X"1BCF", X"1C4D", X"1CCB", X"1D48", X"1DC3", X"1E3E", X"1EB9", X"1F32", X"1FAA", X"2022", X"2099", X"210F", X"2184",
			X"21F8", X"226B", X"22DD", X"234E", X"23BE", X"242D", X"249B", X"2508", X"2574", X"25DF", X"2649", X"26B2", X"271A", X"2780", X"27E6", X"284A",
			X"28AD", X"2910", X"2970", X"29D0", X"2A2F", X"2A8C", X"2AE8", X"2B43", X"2B9C", X"2BF5", X"2C4C", X"2CA1", X"2CF6", X"2D49", X"2D9A", X"2DEB",
			X"2E3A", X"2E88", X"2ED4", X"2F1F", X"2F68", X"2FB0", X"2FF7", X"303C", X"3080", X"30C2", X"3103", X"3142", X"3180", X"31BC", X"31F7", X"3230",
			X"3268", X"329E", X"32D2", X"3305", X"3336", X"3366", X"3394", X"33C1", X"33EB", X"3414", X"343C", X"3462", X"3486", X"34A8", X"34C9", X"34E8",
			X"3505", X"3520", X"353A", X"3552", X"3568", X"357D", X"358F", X"35A0", X"35AF", X"35BC", X"35C7", X"35D1", X"35D8", X"35DE", X"35E2", X"35E4",
			X"35E4", X"35E2", X"35DE", X"35D9", X"35D1", X"35C7", X"35BC", X"35AE", X"359F", X"358E", X"357A", X"3565", X"354D", X"3534", X"3518", X"34FB",
			X"34DB", X"34BA", X"3496", X"3470", X"3448", X"341E", X"33F2", X"33C4", X"3394", X"3362", X"332D", X"32F7", X"32BE", X"3283", X"3246", X"3207",
			X"31C6", X"3182", X"313C", X"30F4", X"30AA", X"305E", X"3010", X"2FBF", X"2F6C", X"2F17", X"2EBF", X"2E66", X"2E0A", X"2DAB", X"2D4B", X"2CE8",
			X"2C83", X"2C1C", X"2BB3", X"2B47", X"2AD9", X"2A68", X"29F5", X"2980", X"2909", X"288F", X"2813", X"2795", X"2714", X"2691", X"260C", X"2584",
			X"24FA", X"246E", X"23DF", X"234E", X"22BA", X"2224", X"218C", X"20F1", X"2054", X"1FB4", X"1F13", X"1E6E", X"1DC8", X"1D1F", X"1C73", X"1BC5",
			X"1B15", X"1A62", X"19AD", X"18F5", X"183B", X"177F", X"16C0", X"15FE", X"153B", X"1474", X"13AC", X"12E1", X"1213", X"1143", X"1071", X"0F9C",
			X"0EC4", X"0DEB", X"0D0E", X"0C30", X"0B4E", X"0A6B", X"0985", X"089C", X"07B1", X"06C4", X"05D4", X"04E1", X"03EC", X"02F5", X"01FB", X"00FF",
			
			X"0000", X"FFA3", X"FF46", X"FEE9", X"FE8C", X"FE2F", X"FDD2", X"FD75", X"FD18", X"FCBB", X"FC5E", X"FC01", X"FBA4", X"FB48", X"FAEB", X"FA8E",
			X"FA31", X"F9D5", X"F978", X"F91B", X"F8BF", X"F862", X"F806", X"F7A9", X"F74D", X"F6F1", X"F695", X"F639", X"F5DC", X"F580", X"F525", X"F4C9",
			X"F46D", X"F411", X"F3B6", X"F35A", X"F2FF", X"F2A3", X"F248", X"F1ED", X"F192", X"F137", X"F0DC", X"F081", X"F027", X"EFCC", X"EF72", X"EF18",
			X"EEBD", X"EE63", X"EE09", X"EDB0", X"ED56", X"ECFD", X"ECA3", X"EC4A", X"EBF1", X"EB98", X"EB3F", X"EAE7", X"EA8E", X"EA36", X"E9DE", X"E986",
			X"E92E", X"E8D7", X"E87F", X"E828", X"E7D1", X"E77A", X"E723", X"E6CD", X"E677", X"E621", X"E5CB", X"E575", X"E520", X"E4CA", X"E475", X"E421",
			X"E3CC", X"E378", X"E324", X"E2D0", X"E27C", X"E229", X"E1D6", X"E183", X"E130", X"E0DE", X"E08C", X"E03A", X"DFE9", X"DF98", X"DF47", X"DEF6",
			X"DEA6", X"DE56", X"DE06", X"DDB6", X"DD67", X"DD18", X"DCCA", X"DC7C", X"DC2E", X"DBE1", X"DB93", X"DB47", X"DAFA", X"DAAE", X"DA62", X"DA17",
			X"D9CC", X"D982", X"D937", X"D8EE", X"D8A4", X"D85B", X"D813", X"D7CB", X"D783", X"D73C", X"D6F5", X"D6AE", X"D668", X"D623", X"D5DE", X"D599",
			X"D555", X"D512", X"D4CF", X"D48C", X"D44A", X"D409", X"D3C8", X"D387", X"D347", X"D308", X"D2C9", X"D28B", X"D24D", X"D210", X"D1D4", X"D198",
			X"D15D", X"D122", X"D0E8", X"D0AF", X"D076", X"D03E", X"D007", X"CFD1", X"CF9B", X"CF66", X"CF31", X"CEFE", X"CECB", X"CE99", X"CE68", X"CE37",
			X"CE08", X"CDD9", X"CDAB", X"CD7E", X"CD51", X"CD26", X"CCFC", X"CCD2", X"CCAA", X"CC82", X"CC5C", X"CC36", X"CC12", X"CBEE", X"CBCC", X"CBAB",
			X"CB8B", X"CB6C", X"CB4E", X"CB31", X"CB16", X"CAFC", X"CAE3", X"CACB", X"CAB5", X"CAA0", X"CA8C", X"CA7A", X"CA6A", X"CA5A", X"CA4D", X"CA41",
			X"CA36", X"CA2E", X"CA27", X"CA21", X"CA1E", X"CA1C", X"CA1C", X"CA1E", X"CA22", X"CA28", X"CA31", X"CA3B", X"CA48", X"CA57", X"CA68", X"CA7C",
			X"CA92", X"CAAB", X"CAC6", X"CAE5", X"CB06", X"CB2A", X"CB52", X"CB7C", X"CBAA", X"CBDB", X"CC10", X"CC49", X"CC86", X"CCC7", X"CD0C", X"CD55",
			X"CDA4", X"CDF7", X"CE4F", X"CEAD", X"CF10", X"CF7A", X"CFE9", X"D060", X"D0DE", X"D163", X"D1F1", X"D287", X"D327", X"D3D1", X"D485", X"D546",
			X"D613", X"D6EF", X"D7DA", X"D8D7", X"D9E7", X"DB0D", X"DC4C", X"DDA8", X"DF26", X"E0CD", X"E2A5", X"E4BD", X"E727", X"EA06", X"ED9D", X"F297"
		);
	
	-- 信号
	signal lerp_ce_ff0		: std_logic := '0';
	signal lerp_ce_ff1		: std_logic := '0';
	signal lerp_ce			: std_logic;
	signal lerp_addr0		: unsigned(9 downto 0) := "0000000000";
	signal lerp_addr1		: unsigned(9 downto 0) := "0000000000";
	signal lerp_data0		: std_logic_vector(15 downto 0) := X"0000";
	signal lerp_data1		: std_logic_vector(15 downto 0) := X"0000";
	signal lerp_interpol	: std_logic_vector(7 downto 0);
	signal lerp_offset		: std_logic_vector(15 downto 0);
	signal lerp_temp		: std_logic_vector(25 downto 0);
	
begin
	
	lerp_ce <= DATA_EN or lerp_ce_ff0;
	DATA_DONE <= lerp_ce_ff1;
	
	-- アドレス計算
	lerp_addr0 <= unsigned(DATA_SEL) & unsigned(DATA_PTR(15 downto 8));
	lerp_addr1 <= unsigned(DATA_SEL) & (unsigned(DATA_PTR(15 downto 8)) + 1);
	
	-- 補間計算
	lerp_offset <= std_logic_vector(unsigned(lerp_data0) + unsigned(DATA_PTR));
	lerp_interpol <= std_logic_vector(DATA_PTR(7 downto 0));
	
	-- 出力
	DATA_OUT <= lerp_temp(23 downto 8);
	
	process(CLK_IN)
	begin
		if (rising_edge(CLK_IN)) then
			lerp_ce_ff0 <= DATA_EN;
			lerp_ce_ff1 <= lerp_ce_ff0;
			
			-- テーブルから前後の値を読み出し
			if (DATA_EN = '1') then
				lerp_data0 <= FUNC_TABLE(to_integer(lerp_addr0));
				lerp_data1 <= FUNC_TABLE(to_integer(lerp_addr1));
			end if;
			
		end if;
	end process;
	
	DSP_inst : FUNCDSP	-- B*(D-A)+C
		port map(
			clk				=> CLK_IN,
			ce				=> lerp_ce,
			a				=> lerp_data0,
			b(8)			=> '0',
			b(7 downto 0)	=> lerp_interpol,
			c(24)			=> '0',
			c(23 downto 8)	=> lerp_offset,
			c(7 downto 0)	=> X"00",
			d				=> lerp_data1,
			p				=> lerp_temp
		);
	
end;





---- CountingShifter --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity CountingShifter is
	port(
	-- クロック入力
		CLK_IN		: in	std_logic;
		
	-- データ入出力
		DATA_EN		: in	std_logic;
		DATA_DONE	: out	std_logic;
		DATA_IN		: in	std_logic_vector(31 downto 0);
		DATA_OUT	: out	std_logic_vector(31 downto 0);
		DATA_SA		: out	std_logic_vector(5 downto 0)
	);
end;

architecture RTL of CountingShifter is
	-- 入力データの有効数字にあわせて逐次シフトする
	
	-- 信号
	signal done_out			: std_logic := '0';
	signal accepting		: std_logic := '1';
	signal shift_amount		: signed(5 downto 0) := "001111";
	signal shift_register	: std_logic_vector(31 downto 0) := X"00000000";
	
begin
	
	DATA_DONE <= done_out;
	DATA_SA <= std_logic_vector(shift_amount);
	DATA_OUT <= shift_register;
	
	process(CLK_IN)
	begin
		if (rising_edge(CLK_IN)) then
			if (DATA_EN = '1' and accepting = '1') then
				-- 処理開始
				done_out <= DATA_IN(31);
				accepting <= DATA_IN(31);
				shift_register <= DATA_IN(30 downto 0) & '1';
				shift_amount <= "001111";
			elsif (accepting = '0') then
				-- 処理中
				done_out <= shift_register(31);
				accepting <= shift_register(31);
				shift_register <= shift_register(30 downto 0) & '0';
				shift_amount <= shift_amount - 1;
			else
				done_out <= '0';
			end if;
		end if;
	end process;
	
end;





---- IterationalShifter --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity IterationalShifter is
	port(
	-- クロック入力
		CLK_IN		: in	std_logic;
		
	-- データ入出力
		DATA_EN		: in	std_logic;
		DATA_DONE	: out	std_logic;
		DATA_SA		: in	std_logic_vector(5 downto 0);
		DATA_IN		: in	std_logic_vector(31 downto 0);
		DATA_OUT	: out	std_logic_vector(31 downto 0)
	);
end;

architecture RTL of IterationalShifter is
	-- 入力データの有効数字にあわせて逐次シフトする
	
	-- 信号
	signal done_out			: std_logic := '0';
	signal accepting		: std_logic := '1';
	signal shift_complete	: std_logic;
	signal shift_complete_on_load : std_logic;
	signal shift_amount		: signed(5 downto 0) := "000000";
	signal shift_register	: std_logic_vector(48 downto 0) := '0' & X"000000000000";
	
begin
	
	DATA_DONE <= done_out;
	DATA_OUT <= shift_register(48 downto 17);
	shift_complete <= '1' when shift_amount <= -16 else '0';
	shift_complete_on_load <= '1' when signed(DATA_SA) < -16 else '0';
	
	process(CLK_IN)
	begin
		if (rising_edge(CLK_IN)) then
			if (DATA_EN = '1' and accepting = '1') then
				-- 処理開始
				done_out <= shift_complete_on_load;
				accepting <= shift_complete_on_load;
				shift_register <= '0' & X"0000" & DATA_IN(31 downto 0);
				shift_amount <= signed(DATA_SA);
			elsif (accepting = '0') then
				-- 処理中
				done_out <= shift_complete;
				accepting <= shift_complete;
				shift_amount <= shift_amount - 1;
				shift_register <= shift_register(47 downto 0) & '0';
			else
				done_out <= '0';
			end if;
		end if;
	end process;
	
end;


