--!	@file
--!	@brief ���֐�



---- �p�b�P�[�W ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

package misc_pkg is
	
	-- �r�b�g�����̔��]
	function bit_swap(val : std_logic_vector) return std_logic_vector;
	
	-- �����p���e�B
	function even_parity(val : std_logic_vector) return std_logic;
	
	-- std_logic_vector��std_logic��XOR
	function xor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector��std_logic��XNOR
	function xnor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector��std_logic��AND
	function and_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector��std_logic��NAND
	function nand_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector��std_logic��OR
	function or_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector��std_logic��NOR
	function nor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector;
	
	-- std_logic_vector�̐�Βl
	function abs_vector(p1 : std_logic_vector; w : integer) return std_logic_vector;
	
	-- std_logic_vector�̕������]
	function neg_vector(p1 : std_logic_vector; w : integer) return std_logic_vector;
	
end misc_pkg;



---- �p�b�P�[�W�{�� ------------------------------------------------------------

package body misc_pkg is
	
	-- �r�b�g�����̔��]
	function bit_swap(val : std_logic_vector) return std_logic_vector is
	variable result : std_logic_vector(val'reverse_range);
	begin
		for cnt in val'range loop
			result(cnt) := val(cnt);
		end loop;
	return result;
	end bit_swap;
	
	
	
	-- �����p���e�B
	function even_parity(val : std_logic_vector) return std_logic is
	variable result : std_logic;
	begin
		result := '0';
		for cnt in val'range loop
			result := result xor val(cnt);
		end loop;
	return result;
	end even_parity;
	
	
	
	-- std_logic_vector��std_logic��XOR
	function xor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) xor p2;
		end loop;
	return result;
	end xor_vector;
	
	-- std_logic_vector��std_logic��XNOR
	function xnor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) xnor p2;
		end loop;
	return result;
	end xnor_vector;
	
	-- std_logic_vector��std_logic��AND
	function and_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) and p2;
		end loop;
	return result;
	end and_vector;
	
	-- std_logic_vector��std_logic��NAND
	function nand_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) nand p2;
		end loop;
	return result;
	end nand_vector;
	
	-- std_logic_vector��std_logic��OR
	function or_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) or p2;
		end loop;
	return result;
	end or_vector;
	
	-- std_logic_vector��std_logic��NOR
	function nor_vector(p1 : std_logic_vector; p2 : std_logic) return std_logic_vector is
	variable result : std_logic_vector(p1'range);
	begin
		for cnt in p1'range loop
			result(cnt) := p1(cnt) nor p2;
		end loop;
	return result;
	end nor_vector;
	
	-- std_logic_vector�̐�Βl
	function abs_vector(p1 : std_logic_vector; w : integer) return std_logic_vector is
	variable result : std_logic_vector(w-1 downto 0);
	begin
		result := std_logic_vector(to_unsigned(abs(to_integer(signed(p1))), w));
	return result;
	end abs_vector;
	
	-- std_logic_vector�̕������]
	function neg_vector(p1 : std_logic_vector; w : integer) return std_logic_vector is
	variable result : std_logic_vector(w-1 downto 0);
	begin
		result := std_logic_vector(resize(0 - signed(p1), w));
	return result;
	end neg_vector;
	
	
	
	
	
	
	
end misc_pkg;




