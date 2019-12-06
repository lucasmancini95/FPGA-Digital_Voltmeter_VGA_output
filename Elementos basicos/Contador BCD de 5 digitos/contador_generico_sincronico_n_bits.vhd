library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Para instanciar este componente es:
-- inst_x: generic_counter
--  generic map( N => 1024);
--  port map();

entity generic_counter is
    generic(N: natural := 3); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        clock_in, reset_in, enable_in: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end generic_counter;

architecture generic_counter_arq of generic_counter is

    component ffd is
        port(
            clk, rst, ena: in STD_LOGIC;
            D: in STD_LOGIC;
            Q: out STD_LOGIC
            );
    end component;

    signal Q_aux, xor_aux, and_aux: STD_LOGIC_VECTOR(N-1 downto 0);

begin

gen_counter: for i in 0 to N-1 generate

    gen_counter_1: if i = 0 generate --para el primer caso --> Q0
        and_aux(i) <= '1'; -- El AND del primer bit es siempre un 1
        xor_aux(i) <= and_aux(i) XOR Q_aux(i);
        inst1: ffd port map( clock_in, reset_in, enable_in, xor_aux(i), Q_aux(i) );
     end generate;

     gen_counter_2_to_N: if i>0 generate --para el resto de los casos
        and_aux(i) <= and_aux(i-1) and Q_aux(i-1);
        xor_aux(i) <= and_aux(i) XOR Q_aux(i);
        inst1: ffd port map( clock_in, reset_in, enable_in, xor_aux(i), Q_aux(i) );
     end generate;
 end generate;

 Q <= Q_aux;

end;
