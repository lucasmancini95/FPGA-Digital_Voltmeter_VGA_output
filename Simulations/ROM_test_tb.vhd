library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ROM_test_tb is
 end ROM_test_tb;

architecture ROM_test_tb_arq of ROM_test_tb is

component rom_test is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           font_col: in std_logic_vector(9 downto 0); --horizontal
	       font_row: in std_logic_vector(9 downto 0); --vertical
           pixel : out STD_LOGIC;
	   complete_row : out std_logic_vector(7 downto 0)
);
end component;


signal font_col_tb: STD_LOGIC_VECTOR(9 downto 0):="0001100000";	
signal font_row_tb: STD_LOGIC_VECTOR(9 downto 0):="0000000000";	
signal address_tb: STD_LOGIC_VECTOR(3 downto 0):="0000";	
signal complete_row_tb: STD_LOGIC_VECTOR(7 downto 0);	
		
signal pixel_tb: std_logic;

begin

	DUT: rom_test
		port map(
		address => address_tb,
             pixel => pixel_tb,
             font_row => font_row_tb,
             font_col => font_col_tb,
             complete_row => complete_row_tb
			);

address_tb <= "0111" after 160 ns;

font_row_tb <=  "0000001000" after 10 ns,
		"0000010000" after 20 ns, 
		"0000011000" after 30 ns, 
		"0000100000" after 40 ns,
		"0000101000" after 50 ns,
		"0000110000" after 60 ns,
		"0000111000" after 70 ns,
		"0001000000" after 80 ns,
		"0001001000" after 90 ns,
		"0001010000" after 100 ns,
		"0001011000" after 110 ns,
		"0001100000" after 120 ns,
		"0001101000" after 130 ns,
		"0001110000" after 140 ns,
		"0001111000" after 150 ns,
		"0000000000" after 160 ns,
		"0000001000" after 170 ns,
		"0000010000" after 180 ns, 
		"0000011000" after 190 ns, 
		"0000100000" after 200 ns,
		"0000101000" after 210 ns,
		"0000110000" after 220 ns,
		"0000111000" after 230 ns,
		"0001000000" after 240 ns,
		"0001001000" after 250 ns,
		"0001010000" after 260 ns,
		"0001011000" after 270 ns,
		"0001100000" after 280 ns,
		"0001101000" after 290 ns,
		"0001110000" after 300 ns,
		"0001111000" after 310 ns;



	

end;

