library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity contador_binario_sincronico_4_bits is
    Port (
    cont_in: in std_logic;
    clock_in, reset_in, enable_in: in std_logic;
    Q_vector_out: out std_logic_vector(3 downto 0) --Salida de 4 bits (porque N=4)
 );
 end;

architecture contador_binario_sincronico_4_bits_arq of contador_binario_sincronico_4_bits is

 component flip_flop_D is
     port(
         clk, rst, ena: in std_logic;
         D_ff_in: in STD_LOGIC;
         Q_ff_out: out STD_LOGIC
         );
 end;

 --signal Q_aux, xor_aux, and_aux: std_logic_vector(N-1 downto 0);
 signal Q_i_menos_1_aux: std_logic_vector(4 downto 0);
 signal and_aux: std_logic_vector(3 downto 0);

begin
 Q_i_menos_1_aux(0)<= '1' --este valor es "Q_-1" que se usa para abilitar el primer and

  contador_binario_sincronico_4_bits: for i in 0 to 3 generate
    and_aux(i) <= cont_in and Q_i_menos_1_aux(i);
    insti: flip_flop_D
        port map(clock_in, reset_in, enable_in, cont_in, Q_i_menos_1_aux(i+1)
        );
  end generate;

  Q(0) <= Q_i_menos_1_aux(1);
  Q(1) <= Q_i_menos_1_aux(2);
  Q(2) <= Q_i_menos_1_aux(3);
  Q(3) <= Q_i_menos_1_aux(4);
  
end;
