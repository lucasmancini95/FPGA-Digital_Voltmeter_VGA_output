----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2019 15:52:00
-- Design Name: 
-- Module Name: VGA_rgb_gen - VGA_rgb_gen_arq
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

entity VGA_rgb_gen is
    port(
       data_in: in STD_LOGIC;
       H_count : in STD_LOGIC_VECTOR(9 downto 0);
       V_count : in STD_LOGIC_VECTOR(9 downto 0);
       visible :in STD_LOGIC;
        R : out STD_LOGIC;
        G : out STD_LOGIC;
        B : out STD_LOGIC
      );
end VGA_rgb_gen;

architecture VGA_rgb_gen_arq of VGA_rgb_gen is

component Comparator_X is
  generic( N: integer := 3);
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
 end component;
 
 signal s_row_sel_bits: STD_LOGIC_VECTOR(2 downto 0);
 signal  s_comp_out: STD_LOGIC;

 begin
 	--------------------------------------------------------------------------------
	-- selector de fila vertical
	-- toda la pantalla esta dividida en 5 filas de 128 bits cada una, solamente
	-- las primeras 4 filas son visibles, por lo tanto hay que elegir alguna de ellas,
	-- el selector de fila vertical va a tener en la salida un 1 cuando se este en la fila 
	-- en la que se quiera escribir y un 0 cuando se este en la que no se quiere imprimir.
	-- En que fila se esta en cada momento depende de los 3 MSB del contador vertical, 
	-- Si los 3 MSB son "001" entonces se imprime en la segunda fila, si los 
	-- 3 MSB son "010", se esta en la tercera
	-- pongo un comparador en para los 3 MSB del contador vertical

	
	

			--comp_out => row_sel_out

	s_row_sel_bits <= V_count(9 downto 7);		
			
    Comparator_X_inst: Comparator_X 
        Port map ( 
        A_in => s_row_sel_bits,
        B_in => "001",
        comp_out => s_comp_out
         );

	R <= data_in and visible and s_comp_out;
    G <= '0';
    B <= '0';

end VGA_rgb_gen_arq;
