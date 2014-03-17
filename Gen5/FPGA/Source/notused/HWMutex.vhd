--!	@file
--!	@brief 2つのポート間のハードウェア排他制御



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package HWMutex_pkg is
	component HWMutex is
		port(
			CLK_IN		: in	std_logic;
			
			RESET_IN	: in	std_logic;
			
			X_STROBE	: in	std_logic;
			X_IN		: in	std_logic;
			X_OUT		: out	std_logic;
			
			Y_STROBE	: in	std_logic;
			Y_IN		: in	std_logic;
			Y_OUT		: out	std_logic
		);
	end component;
end HWMutex_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

entity HWMutex is
	port(
	-- クロック入力
		CLK_IN			: in	std_logic;
		
	-- リセット
		RESET_IN		: in	std_logic;
		
	-- Xポート
		X_STROBE	: in	std_logic;
		X_IN		: in	std_logic;
		X_OUT		: out	std_logic;
		
	-- Yポート
		Y_STROBE	: in	std_logic;
		Y_IN		: in	std_logic;
		Y_OUT		: out	std_logic
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of HWMutex is
	
	-- ミューテックス
	signal mutex_owner_x	: std_logic := '0';
	signal mutex_owner_y	: std_logic := '0';
	
begin
	
	X_OUT	<= mutex_owner_x;
	Y_OUT	<= mutex_owner_y;
	
	process(RESET_IN, CLK_IN)
	begin
		if (rising_edge(CLK_IN)) then
			-- 上昇エッジ
			if (RESET_IN = '1') then
				-- リセット
				mutex_owner_x	<= '0';
				mutex_owner_y	<= '0';
			else
				-- 動作中
				
				if ((mutex_owner_x = '0') and (mutex_owner_y = '0')) then
					-- 獲得者なし
					if (X_STROBE = '1' and X_IN = '1') then
						-- Xが獲得
						mutex_owner_x	<= '1';
						mutex_owner_y	<= '0';
					elsif (Y_STROBE = '1' and Y_IN = '1') then
						-- Yが獲得
						mutex_owner_x	<= '0';
						mutex_owner_y	<= '1';
					else
						mutex_owner_x	<= '0';
						mutex_owner_y	<= '0';
					end if;
				elsif ((mutex_owner_x = '1') and (mutex_owner_y = '0')) then
					-- Xが獲得中
					if (X_STROBE = '1' and X_IN = '0') then
						if (Y_STROBE = '1' and Y_IN = '1') then
							-- Xが放棄、Yが獲得
							mutex_owner_x	<= '0';
							mutex_owner_y	<= '1';
						else
							-- Xが放棄
							mutex_owner_x	<= '0';
							mutex_owner_y	<= '0';
						end if;
					else
						mutex_owner_x	<= '1';
						mutex_owner_y	<= '0';
					end if;
				elsif ((mutex_owner_x = '0') and (mutex_owner_y = '1')) then
					-- Yが獲得中
					if (Y_STROBE = '1' and Y_IN = '0') then
						if (X_STROBE = '1' and X_IN = '1') then
							-- Yが放棄、Xが獲得
							mutex_owner_x	<= '1';
							mutex_owner_y	<= '0';
						else
							-- Yが放棄
							mutex_owner_x	<= '0';
							mutex_owner_y	<= '0';
						end if;
					else
						mutex_owner_x	<= '0';
						mutex_owner_y	<= '1';
					end if;
				else
					-- おかしい
					mutex_owner_x <= '0';
					mutex_owner_y <= '0';
				end if;
			end if;
		end if;
	end process;
	
	
end;
 