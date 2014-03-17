--!	@file
--!	@brief ロータリーエンコーダのデコーダ



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package QuadratureDecoder_pkg is
	component QuadratureDecoder is
		generic(
			OUT_WIDTH		: integer := 12
		);
		port(
			CLK_SYS			: in	std_logic;
			
			RESET			: in	std_logic;
			
			BA_UPDATE		: in	std_logic;
			BA_IN			: in	std_logic_vector(1 downto 0);
			
			DEC_LATCH		: in	std_logic;
			DEC_OUT			: out	signed(OUT_WIDTH-1 downto 0)
		);
	end component;
end QuadratureDecoder_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.QuadratureDecoder_pkg.all;

entity QuadratureDecoder is
	generic(
		OUT_WIDTH		: integer := 12
	);
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
		
	-- リセット
		RESET			: in	std_logic;
		
	-- エンコーダ入力
		BA_UPDATE		: in	std_logic;
		BA_IN			: in	std_logic_vector(1 downto 0);
		
	-- デコード出力
		DEC_LATCH		: in	std_logic;				-- 出力へラッチしてカウンタをクリア
		DEC_OUT			: out	signed(OUT_WIDTH-1 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of QuadratureDecoder is
	
	-- エンコーダ関連
	type ROTATE_t is (RT_STAT, RT_INC, RT_DEC, RT_INV);
	type ROTATE_TABLE is array (0 to 15) of ROTATE_t;
	constant ROTATE			: ROTATE_TABLE := (
		RT_STAT, RT_DEC, RT_INC,  RT_INV, RT_INC, RT_STAT, RT_INV, RT_DEC,
		RT_DEC,  RT_INV, RT_STAT, RT_INC, RT_INV, RT_INC,  RT_DEC, RT_STAT
	);
	
	signal enc_a_ff		: std_logic_vector(1 downto 0) := "00";
	signal enc_b_ff		: std_logic_vector(1 downto 0) := "00";
	signal enc_a_in		: std_logic := '0';
	signal enc_b_in		: std_logic := '0';
	
	signal enc_state		: std_logic_vector(1 downto 0);
	signal enc_last_state	: std_logic_vector(1 downto 0);
	signal enc_rotate	: ROTATE_t;
	
	signal enc_cnt		: signed(OUT_WIDTH-1 downto 0);
	
	
	
	
begin
	
	
	
	-- エンコーダ
	enc_state	<= enc_b_in & enc_a_in;
	enc_rotate	<= ROTATE(to_integer(unsigned(enc_last_state & enc_state)));
	
	process(RESET, CLK_SYS)
	begin
		if (rising_edge(CLK_SYS)) then
			if (RESET = '1') then
				-- リセット
				enc_a_ff <= "00";
				enc_b_ff <= "00";
				enc_a_in <= '0';
				enc_b_in <= '0';
				enc_last_state <= "00";
				
				enc_cnt	<= to_signed(0, OUT_WIDTH);
				DEC_OUT	<= to_signed(0, OUT_WIDTH);
				
			else
				if (DEC_LATCH = '1') then
					-- カウンタ値を出力へラッチしてカウンタをクリア
					enc_cnt	<= to_signed(0, OUT_WIDTH);
					DEC_OUT	<= enc_cnt;
					
				elsif (BA_UPDATE = '1') then
					-- 入力信号のフィルタリング
					enc_a_ff <= enc_a_ff(0) & BA_IN(0);
					enc_b_ff <= enc_b_ff(0) & BA_IN(1);
					if (enc_a_ff = "00" or enc_a_ff = "11") then
						enc_a_in <= enc_a_ff(1);
					else
						enc_a_in <= enc_a_in;
					end if;
					if (enc_b_ff = "00" or enc_b_ff = "11") then
						enc_b_in <= enc_b_ff(1);
					else
						enc_b_in <= enc_b_in;
					end if;
					
					-- カウンタ値を更新
					enc_last_state	<= enc_state;
					case enc_rotate is
					when RT_INC =>
						enc_cnt	<= enc_cnt + 1;
					when RT_DEC =>
						enc_cnt	<= enc_cnt - 1;
					when others =>
						enc_cnt <= enc_cnt;
					end case;
					
				end if;
			end if;
		end if;
	end process;
	
end;
 