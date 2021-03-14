----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 01:22:53
-- Design Name: 
-- Module Name: VGA_data_gen - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_data_gen is
    Port ( 
       H_count : in STD_LOGIC_VECTOR(9 downto 0);
       V_count : in STD_LOGIC_VECTOR(9 downto 0);
       digit_1 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_2 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_3 : in STD_LOGIC_VECTOR(3 downto 0);
       pixel: out STD_LOGIC
       );
end VGA_data_gen;

architecture VGA_data_gen_arq of VGA_data_gen is

component mux_8_in is
	generic( N : integer := 4);
	port(
		A, B, C, D, E, F, G, H: in std_logic_vector( N-1 downto 0 );
		S: in std_logic_vector( 2 downto 0 );
		Q: out std_logic_vector( N-1 downto 0 )
	);
end component;

component font_rom is
   port(
      address: in std_logic_vector(3 downto 0);
      font_col: in std_logic_vector(9 downto 0); --horizontal
	  font_row: in std_logic_vector(9 downto 0); --vertical
	  pixel: out std_logic
   );
end component;

signal s_dot: STD_LOGIC_VECTOR( 3 downto 0 );
signal s_V: STD_LOGIC_VECTOR( 3 downto 0 );
signal s_block_select: std_logic_vector(2 downto 0);
signal s_bcd_input_rom: std_logic_vector(3 downto 0);
signal s_adress_aux: std_logic_vector(10 downto 0);
signal s_dont_care : std_logic_vector(3 downto 0);
begin

s_dot <= "1010";
s_V <= "1011";
s_dont_care <= "0000";

s_block_select <= H_count(9 downto 7); --the 3 MSB of H_count indicate in what part ( if we divide it in 5) of the screen the sync is
                                        --thus the selection of the multiplexer is done with those 3 bits too

mux_8_in_inst: mux_8_in
 port map(
        S => s_block_select,
        Q => s_bcd_input_rom,
        A => digit_1,
        B => s_dot,
        C => digit_2,
        D => digit_3,
        E => s_V,
        F => s_dont_care,
        G => s_dont_care,
        H => s_dont_care
    );

--s_adress_aux <= ("0000000" & s_bcd_input_rom);

font_rom_inst: font_rom
   port map(
      address => s_bcd_input_rom, --s_adress_aux ,
      font_col => H_count,
	  font_row => V_count,
	  pixel => pixel
   );

end VGA_data_gen_arq;
