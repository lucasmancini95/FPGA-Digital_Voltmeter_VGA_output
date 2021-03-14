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

entity VGA_data_gen_tb is
 end VGA_data_gen_tb;

architecture VGA_data_gen_tb_arq of VGA_data_gen_tb is

component VGA_data_gen is
    Port ( 
       H_count : in STD_LOGIC_VECTOR(9 downto 0);
       V_count : in STD_LOGIC_VECTOR(9 downto 0);
       digit_1 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_2 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_3 : in STD_LOGIC_VECTOR(3 downto 0);
       pixel: out STD_LOGIC
       );
end component;

--Para poder comprobar el funcionamiento:
    -- hay que poner alguna coordenada que este en la parte visible
    -- y ademas que este en la posicion vertical que corresponda con alguno de los digitos 
    -- que NO sean el "." o la "V"
    -- ==> de esa forma a mano podria verificar que el pixel sea el buscado
     
signal H_count_tb: STD_LOGIC_VECTOR(9 downto 0):=   "0010110010";        --"0010110010";  -- dec:"178" ==> es el medio del primer digito
                                                                -- 114 + 128/2 = 178
                                                                --obs: cada digito ocupa 128 pixeles
                                                                --obs: 114 es el backporch + el pulso sync
signal V_count_tb: STD_LOGIC_VECTOR(9 downto 0):="0100001111";	
								-- dec:"271"  ==> es el medio de la parte visible  
                                                                -- 31 + 480/2 = 271
signal digit_1_tb: STD_LOGIC_VECTOR(3 downto 0):="0000"; --1
signal digit_2_tb: STD_LOGIC_VECTOR(3 downto 0):="0001"; --1	
signal digit_3_tb: STD_LOGIC_VECTOR(3 downto 0):="0001"; --1	

signal pixel_tb: std_logic;

begin

	DUT: VGA_data_gen
		port map(
             pixel => pixel_tb,
             H_count => H_count_tb,
             V_count => V_count_tb,
             digit_1 => digit_1_tb,
             digit_2 => digit_2_tb,
             digit_3 => digit_3_tb
			);

digit_1_tb <= "0010" after 10 ns, "0111" after 20 ns, "0011" after 60 ns;
digit_2_tb <= "0010" after 10 ns, "0111" after 20 ns, "0011" after 60 ns;
digit_3_tb <= "0010" after 10 ns, "0111" after 20 ns, "0011" after 60 ns;
	

end;
