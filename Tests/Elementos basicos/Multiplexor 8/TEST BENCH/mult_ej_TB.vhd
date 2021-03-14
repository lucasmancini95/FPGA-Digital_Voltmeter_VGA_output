library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_ej_TB  is
end;


architecture mult_ej_TB of  mult_ej_TB is
--declaro las señales (los puertos del codigo)


signal	A_tb: std_logic_vector( 1 downto 0 ):="01" ;
signal	B_tb: std_logic_vector( 1 downto 0 ):="11" ;
signal	C_tb: std_logic_vector( 1 downto 0 ):="00" ;
signal	D_tb,E_tb,F_tb,G_tb,H_tb: std_logic_vector( 1 downto 0 ):="00" ;

signal S_tb: std_logic_vector( 1 downto 0 ):="11";

signal Q_tb: std_logic_vector( 1 downto 0 );

component  mult_8inputs is  --copio el entity del codigo y lo pongo como component
  Port (
    A,B,C,D,E,F,G,H: in std_logic_vector( 1 downto 0 );
    S: in std_logic_vector(1 downto 0);   -- S va a ser una salida
    Q: out std_logic_vector
    );
end component;

begin

--si necesitas un CLK o un RESET lo  pongo aca abajo

 DUT:  mult_8inputs
    generic map( N => 2 ) -- seteas el valor del N
    port map(
      A=>A_tb,
      B=>B_tb,
      C=>C_tb,
      D=>D_tb,
      E=>E_tb,
      F=>F_tb,
      G=>G_tb,
      H=>H_tb,
      S=>S_tb,
      Q=>Q_tb
   );
end;
