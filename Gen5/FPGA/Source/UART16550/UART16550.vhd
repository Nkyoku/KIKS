library IEEE;
use IEEE.std_logic_1164.all;

package UART16550_pkg is
	component UART16550 is
		port(
			wb_clk_i		: in	std_logic;
			
		-- Wishbone signals
			wb_rst_i		: in	std_logic;
			wb_adr_i		: in	std_logic_vector(2 downto 0);
			wb_dat_i		: in	std_logic_vector(7 downto 0);
			wb_dat_o		: out	std_logic_vector(7 downto 0);
			wb_we_i			: in	std_logic;
			wb_stb_i		: in	std_logic;
			wb_cyc_i		: in	std_logic;
			wb_ack_o		: out	std_logic;
			wb_sel_i		: in	std_logic_vector(3 downto 0);
			
			int_o			: out	std_logic;
			
		-- UART	signals
		-- serial input/output
			stx_pad_o		: out	std_logic;
			srx_pad_i		: in	std_logic;
			
		-- modem signals
			rts_pad_o		: out	std_logic;
			cts_pad_i		: in	std_logic;
			dtr_pad_o		: out	std_logic;
			dsr_pad_i		: in	std_logic;
			ri_pad_i		: in	std_logic;
			dcd_pad_i		: in	std_logic
		);
	end component;
end UART16550_pkg;
