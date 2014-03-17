library IEEE;
use IEEE.std_logic_1164.all;

package SimpleSPI_pkg is
	component SimpleSPI is
		port(
		-- 8bit WISHBONE bus slave interface
			clk_i		: in	std_logic;	-- clock
			rst_i		: in	std_logic;	-- reset (asynchronous active high)
			cyc_i		: in	std_logic;	-- cycle
			stb_i		: in	std_logic;	-- strobe
			adr_i		: in	std_logic_vector(1 downto 0);	-- address
			we_i		: in	std_logic;	-- write enable
			dat_i		: in	std_logic_vector(7 downto 0);	-- data input
			dat_o		: out	std_logic_vector(7 downto 0);	-- data output
			ack_o		: out	std_logic;	-- normal bus termination
			inta_o		: out	std_logic;	-- interrupt output
			
		-- SPI port
			sck_o		: out	std_logic;	-- serial clock output
			mosi_o		: out	std_logic;	-- MasterOut SlaveIN
			miso_i		: in	std_logic	-- MasterIn SlaveOut
		);
	end component;
end SimpleSPI_pkg;
