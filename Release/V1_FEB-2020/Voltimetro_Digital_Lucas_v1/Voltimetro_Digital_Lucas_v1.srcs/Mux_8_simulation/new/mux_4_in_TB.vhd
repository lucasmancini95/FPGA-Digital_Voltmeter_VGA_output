----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 01:59:35
-- Design Name: 
-- Module Name: mux_8_in - mux_8_in_arq
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

entity mux_4_in_TB is
end mux_4_in_TB;

architecture mux_4_in_TB_arq of mux_4_in_TB is

--declaro las señales (los puertos del codigo)


signal	A_tb: std_logic_vector( 1 downto 0 ):="01" ;
signal	B_tb: std_logic_vector( 1 downto 0 ):="11" ;
signal	C_tb: std_logic_vector( 1 downto 0 ):="00" ;
signal	D_tb: std_logic_vector( 1 downto 0 ):="10" ;

signal S_tb: std_logic_vector( 1 downto 0 ):="00";

signal Q_tb: std_logic_vector( 1 downto 0 );


component mux_4_in is
     	generic( N : integer := 2 );
    	Port ( 
    		A, B, C, D: in std_logic_vector(N-1 downto 0);
    		Q: out std_logic_vector(N-1 downto 0);
    		S: in std_logic_vector(1 downto 0) -- S va a ser el vector que diga que valor se elije
 		);
end component;

begin


 DUT: mux_4_in
   -- generic map( N => 2 )
   port map(
      A => A_tb,
      B => B_tb,
      C => C_tb,
      D => D_tb,
      S => S_tb,
      Q =>Q_tb
  );
  
 
 S_tb <= "01" after 50 ns;
  
end mux_4_in_TB_arq;