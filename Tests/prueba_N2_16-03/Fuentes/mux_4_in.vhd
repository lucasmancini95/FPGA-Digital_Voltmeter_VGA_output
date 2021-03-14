----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 02:05:22
-- Design Name: 
-- Module Name: mux_4_in - mux_4_in_arq
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

entity mux_4_in is
     	generic( N : integer := 2 );
    	Port ( 
    		A, B, C, D: in std_logic_vector(N-1 downto 0);
    		Q: out std_logic_vector(N-1 downto 0);
    		S: in std_logic_vector(1 downto 0) -- S va a ser el vector que diga que valor se elije
 		);
end mux_4_in;

 -- Si S = "00" entonces se elije el vector A, 
 -- Si S = "01" entonces se elije el vector B,
 -- Si S = "10" entonces se elije el vector C, 
 -- Si S = "11" entonces se elije el vector D.
 -- Esta hecho como para pensarlo como que las entradas estan numeradas del 0 al 3, y dependiendo 
 -- el numero que se ingrese con S = xx sale la entrada numero xx.

architecture mux_4_in_arq of mux_4_in is


component mux_bin_gen is
    generic( N: integer := 4);
    Port(
        S: in std_logic;
        A, B: in std_logic_vector(N-1 downto 0);
        Q: out std_logic_vector(N-1 downto 0)
        );
end component;

signal q_auxAB, q_auxCD: std_logic_vector(N-1 downto 0);       
signal s_Q: std_logic_vector(N-1 downto 0);       

begin
    mux_AB: mux_bin_gen
        generic map ( N => N )
        port map (
            A => A,
            B => B,
            S => S(0),
            Q => q_auxAB
            );


mux_CD: mux_bin_gen
   generic map ( N => N )
   port map (
       A => C,
       B => D,
       S => S(0),
       Q => q_auxCD

       );

mux_output: mux_bin_gen
       generic map ( N => N )
       port map (
       A => q_auxAB,
       B => q_auxCD,
       S => S(1),
       Q => s_Q
);

   Q <= s_Q;
    
end mux_4_in_arq;
