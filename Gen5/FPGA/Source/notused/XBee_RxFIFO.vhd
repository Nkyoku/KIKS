--!	@file
--!	@brief XBeeから受信したパケットのFIFO



---- パッケージ ----------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

package XBeeRxFIFO_pkg is
	component XBeeRxFIFO is
		port(
			CLK_SYS			: in	std_logic;
			
			FIFO_WR			: in	std_logic_vector(1 downto 0);
			FIFO_WRADDR		: in	std_logic_vector(4 downto 0);
			FIFO_DIN		: in	std_logic_vector(7 downto 0);
			
			FIFO_RDADDR		: in	std_logic_vector(4 downto 0);
			FIFO_DOUT		: out	std_logic_vector(15 downto 0)
		);
	end component;
end XBeeRxFIFO_pkg;



---- エンティティ --------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;

library UNISIM;
use UNISIM.Vcomponents.all;



entity XBeeRxFIFO is
	port(
	-- クロック入力
		CLK_SYS			: in	std_logic;
	
	-- 書き込みポート
		FIFO_WR			: in	std_logic_vector(1 downto 0);
		FIFO_WRADDR		: in	std_logic_vector(4 downto 0);
		FIFO_DIN		: in	std_logic_vector(7 downto 0);
		
	-- 読み込みポート
		FIFO_RDADDR		: in	std_logic_vector(4 downto 0);
		FIFO_DOUT		: out	std_logic_vector(15 downto 0)
	);
end;



---- アーキテクチャ -------------------------------------------------------------------

architecture RTL of XBeeRxFIFO is
begin
	
	rxfifo_gen : for cnt in 0 to 15 generate
		rxfifo_inst : RAM32X1D
			port map(
				WCLK	=> CLK_SYS,
				WE		=> FIFO_WR(cnt / 8),
				A0		=> FIFO_WRADDR(0),
				A1		=> FIFO_WRADDR(1),
				A2		=> FIFO_WRADDR(2),
				A3		=> FIFO_WRADDR(3),
				A4		=> FIFO_WRADDR(4),
				SPO		=> open,
				D		=> FIFO_DIN(cnt mod 8),
				
				DPRA0	=> FIFO_RDADDR(0),
				DPRA1	=> FIFO_RDADDR(1),
				DPRA2	=> FIFO_RDADDR(2),
				DPRA3	=> FIFO_RDADDR(3),
				DPRA4	=> FIFO_RDADDR(4),
				DPO		=> FIFO_DOUT(cnt)
			);
	end generate;
	
	
end;
 