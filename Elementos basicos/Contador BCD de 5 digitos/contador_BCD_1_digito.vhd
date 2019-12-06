library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity contador_BCD_1_digito is
  Port (
    cont_in: in std_logic;
    clock_in, reset_in, enable_in: in std_logic;
    flag_out: out std_logic;
    Q: out std_logic_vector(3 downto 0)
  );
end;

architecture contador_BCD_1_digito_arq of contador_BCD_1_digito  is

component contador_binario_sincronico_4_bits is
    port(
    cont_in: in std_logic;
    clock_in, reset_in, enable_in: in std_logic;
    Q_vector_out: out std_logic_vector(3 downto 0) --Salida de 4 bits (porque N=4)
 );
    end component;

component comparador_4_bits is
    port (
    A_in, B_in : in std_logic_vector(3 downto 0);
    comp_out: out std_logic
  );
    end component;

--Senales:
signal comparador_out_aux, reset_general, reset_aux: std_logic;
signal contador_bin_out_aux : std_logic_vector(3 downto 0):="0000";
signal limite_comparador_4 : std_logic_vector(3 downto 0) := "1001"; --es el 9 en BCD

begin
    comparador_out_aux<='0';
    reset_general <= reset_in OR comparador_out_aux;
    reset_aux <= cont_in AND reset_general;

    Q <= contador_bin_out_aux;
    flag_out <= comparador_out_aux;

    contador_binario_sincronico_4_bits_inst: contador_binario_sincronico_4_bits
        port map (
            clock_in => clock_in,
            reset_in => reset_aux,
            enable_in => enable_in,
            cont_in=>cont_in,
            Q_vector_out => contador_bin_out_aux);

    comparador_4_bits_inst: comparador_4_bits
            port map (
                A_in => contador_bin_out_aux,
                B_in => limite_comparador_4,
                comp_out => comparador_out_aux);
end;
