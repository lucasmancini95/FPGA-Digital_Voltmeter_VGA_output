--Compara dos plabras A y B de n bits cada una => devuelve un 1 si son iguales
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity comparador_n_bits is
  Port (
    generic( N: integer := 4 ); -- N = cantidad de bits que se van a comparar
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );

end equal_gen_comp;

architecture comparador_n_bits_arq of comparador_n_bits is

signal  and_i_aux: std_logic_vector(N-1 downto 0); --salidas de las compuertas AND intermedies
signal xnor_i_aux: std_logic_vector(N-1 downto 0); --salidas de las XOR de entrada

begin
  and_sal(0) <= '1'; --la entrada del primer AND es un 1

  gen_comp: for i in 0 to N-1 generate
      xnor_i_aux(i) <= A_in(i) XNOR B_in(i);
      and_i_aux(i+1) <= and_i_aux(i) AND xnor_i_aux(i);
  end generate;

  comp_out <= and_i_aux(N);

end;
