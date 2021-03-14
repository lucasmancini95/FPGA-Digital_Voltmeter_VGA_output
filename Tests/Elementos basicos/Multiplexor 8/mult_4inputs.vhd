library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity mult_4inputs is
    generic( N: integer := 4 );
    Port ( 
    A, B, C, D: in std_logic_vector(N-1 downto 0);
    Q: out std_logic_vector(N-1 downto 0);
    S: in std_logic_vector(1 downto 0) -- S va a ser el vector que diga que valor se elije
 );
 -- Si S = "00" entonces se elije el vector A, 
 -- Si S = "01" entonces se elije el vector B,
 -- Si S = "10" entonces se elije el vector C, 
 -- Si S = "11" entonces se elije el vector D.
 -- Esta hecho como para pensarlo como que las entradas están numeradas del 0 al 3, y dependiendo 
 -- el número que se ingrese con S = xx sale la entrada numero xx.
 
end mult_4inputs;

architecture mult_4inputs_arq of mult_4inputs is

component mult_bin_gen is
    generic( N: integer := 4);
    Port(
        S: in std_logic;
        A, B: in std_logic_vector(N-1 downto 0);
        Q: out std_logic_vector(N-1 downto 0)
        );
end component;

signal q_auxAB, q_auxCD: std_logic_vector(N-1 downto 0); -- estas señales van a ser las salidas de los primeros dos multiplexores       

begin
    mux_AB: mult_bin_gen
        generic map ( N => N )
        port map (
            A => A,
            B => B,
            S => S(0),
            Q => q_auxAB);
     mux_CD: mult_bin_gen
        generic map ( N => N )
        port map (
            A => C,
            B => D,
            S => S(0),
            Q => q_auxCD);
     mux_output: mult_bin_gen
        generic map ( N => N )
        port map (
            A => q_auxAB,
            B => q_auxCD,
            S => S(1),
            Q => Q);
            

end mult_4inputs_arq;
