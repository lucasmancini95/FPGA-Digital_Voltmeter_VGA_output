----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 16:25:13
-- Design Name: 
-- Module Name: font_rom - font_rom_arq
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity font_rom is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           font_col: in std_logic_vector(9 downto 0); --horizontal
	       font_row: in std_logic_vector(9 downto 0); --vertical
           pixel : out STD_LOGIC);
end font_rom;

--the adress is 11 bits long but in the case of the voltmeter we will only use 4 bits of adress
-- we only need the numbers 0 to 9, the dot "." and a "V" (volts).
--to make things easy in the previous steps the number will be put in the position of each number
-- for example the eight will be in 0100 (8 in binary).
--after the 9 we will have the dot and the "V"
-- so "." --> 1010 (10)
-- "V"-->  1011 (11}

architecture font_rom_arq of font_rom is

 constant DATA_WIDTH: integer:=8;
   
   signal col_index: std_logic_vector( 2 downto 0);
   signal row_index: std_logic_vector( 7 downto 0);

   signal s_complete_row : std_logic_vector(7 downto 0);
   signal s_inv_complete_row : std_logic_vector(7 downto 0);
 
   type rom_type is array (0 to 192-1) --192 is the number of rows ==> 16 long * 12 chars= 192
        of std_logic_vector(DATA_WIDTH-1 downto 0);

   -- ROM definition
   constant ROM: rom_type:=(   
    -- code x00
   "00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "11000110", -- 4 **   **
   "11001110", -- 5 **  ***
   "11011110", -- 6 ** ****
   "11110110", -- 7 **** **
   "11100110", -- 8 ***  **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x01
   "00000000", -- 0
   "00000000", -- 1
   "00011000", -- 2
   "00111000", -- 3
   "01111000", -- 4    **
   "00011000", -- 5   ***
   "00011000", -- 6  ****
   "00011000", -- 7    **
   "00011000", -- 8    **
   "00011000", -- 9    **
   "00011000", -- a    **
   "01111110", -- b    **
   "00000000", -- c    **
   "00000000", -- d  ******
   "00000000", -- e
   "00000000", -- f
   -- code x02
   "00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "00000110", -- 4      **
   "00001100", -- 5     **
   "00011000", -- 6    **
   "00110000", -- 7   **
   "01100000", -- 8  **
   "11000000", -- 9 **
   "11000110", -- a **   **
   "11111110", -- b *******
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x03
   "00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "00000110", -- 4      **
   "00000110", -- 5      **
   "00111100", -- 6   ****
   "00000110", -- 7      **
   "00000110", -- 8      **
   "00000110", -- 9      **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x04
   "00000000", -- 0
   "00000000", -- 1
   "00001100", -- 2     **
   "00011100", -- 3    ***
   "00111100", -- 4   ****
   "01101100", -- 5  ** **
   "11001100", -- 6 **  **
   "11111110", -- 7 *******
   "00001100", -- 8     **
   "00001100", -- 9     **
   "00001100", -- a     **
   "00011110", -- b    ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x05
   "00000000", -- 0
   "00000000", -- 1
   "11111110", -- 2 *******
   "11000000", -- 3 **
   "11000000", -- 4 **
   "11000000", -- 5 **
   "11111100", -- 6 ******
   "00000110", -- 7      **
   "00000110", -- 8      **
   "00000110", -- 9      **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x06
   "00000000", -- 0
   "00000000", -- 1
   "00111000", -- 2   ***
   "01100000", -- 3  **
   "11000000", -- 4 **
   "11000000", -- 5 **
   "11111100", -- 6 ******
   "11000110", -- 7 **   **
   "11000110", -- 8 **   **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x07
   "00000000", -- 0
   "00000000", -- 1
   "11111110", -- 2 *******
   "11000110", -- 3 **   **
   "00000110", -- 4      **
   "00000110", -- 5      **
   "00001100", -- 6     **
   "00011000", -- 7    **
   "00110000", -- 8   **
   "00110000", -- 9   **
   "00110000", -- a   **
   "00110000", -- b   **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x08
   "00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "11000110", -- 4 **   **
   "11000110", -- 5 **   **
   "01111100", -- 6  *****
   "11000110", -- 7 **   **
   "11000110", -- 8 **   **
   "11000110", -- 9 **   **
   "11000110", -- a **   **
   "01111100", -- b  *****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x09
   "00000000", -- 0
   "00000000", -- 1
   "01111100", -- 2  *****
   "11000110", -- 3 **   **
   "11000110", -- 4 **   **
   "11000110", -- 5 **   **
   "01111110", -- 6  ******
   "00000110", -- 7      **
   "00000110", -- 8      **
   "00000110", -- 9      **
   "00001100", -- a     **
   "01111000", -- b  ****
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
      -- code x0A
   "00000000", -- 0
   "00000000", -- 1
   "00000000", -- 2
   "00000000", -- 3
   "00000000", -- 4
   "00000000", -- 5
   "00000000", -- 6
   "00000000", -- 7
   "00000000", -- 8
   "00000000", -- 9
   "00011000", -- a    **
   "00011000", -- b    **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000", -- f
   -- code x0B
   "00000000", -- 0
   "00000000", -- 1
   "11000011", -- 2 **    **
   "11000011", -- 3 **    **
   "11000011", -- 4 **    **
   "11000011", -- 5 **    **
   "11000011", -- 6 **    **
   "11000011", -- 7 **    **
   "11000011", -- 8 **    **
   "01100110", -- 9  **  **
   "00111100", -- a   ****
   "00011000", -- b    **
   "00000000", -- c
   "00000000", -- d
   "00000000", -- e
   "00000000" -- f
   );
begin
   
    
    col_index <= font_col(6 downto 4);
    row_index <= address & (font_row(6 downto 3));
    s_inv_complete_row <=ROM(to_integer( unsigned(row_index) ));

    s_complete_row(0) <= s_inv_complete_row (7);
    s_complete_row(1) <= s_inv_complete_row (6);
    s_complete_row(2) <= s_inv_complete_row (5);
    s_complete_row(3) <= s_inv_complete_row (4);
    s_complete_row(4) <= s_inv_complete_row (3);
    s_complete_row(5) <= s_inv_complete_row (2);
    s_complete_row(6) <= s_inv_complete_row (1);
    s_complete_row(7) <= s_inv_complete_row (0);


    pixel <= s_complete_row(to_integer(unsigned(col_index)));

    
end font_rom_arq;
