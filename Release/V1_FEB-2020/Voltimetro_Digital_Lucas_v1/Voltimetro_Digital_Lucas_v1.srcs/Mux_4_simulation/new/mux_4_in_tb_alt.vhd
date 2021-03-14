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

entity mux_4_in_alt_TB is
end mux_4_in_TB;

architecture mux_4_in_alt_TB_arq of mux_4_in_alt_TB is

--declaro las señales (los puertos del codigo)


signal	A_tb: std_logic_vector( 1 downto 0 ):="01" ;
signal	B_tb: std_logic_vector( 1 downto 0 ):="11" ;
signal	C_tb: std_logic_vector( 1 downto 0 ):="00" ;
signal	D_tb: std_logic_vector( 1 downto 0 ):="10" ;

signal S_tb: std_logic_vector( 1 downto 0 ):="00";

signal Q_tb_1: std_logic_vector( 1 downto 0 );
signal Q_tb_2: std_logic_vector( 1 downto 0 );

signal Q_tb_out: std_logic_vector( 1 downto 0 );

component mux_bin_gen_1 is
  generic( N : integer := 2);
  Port (
    S_1 : in std_logic;
    A_1, B_1: in std_logic_vector(N-1 downto 0);
    Q_1 : out std_logic_vector(N-1 downto 0)
  );
end component;

component mux_bin_gen_2 is
  generic( N : integer := 2);
  Port (
    S_2 : in std_logic;
    A_2, B_2: in std_logic_vector(N-1 downto 0);
    Q_2 : out std_logic_vector(N-1 downto 0)
  );
end component;


component mux_bin_gen_3 is
  generic( N : integer := 2);
  Port (
    S_3 : in std_logic;
    A_3, B_3: in std_logic_vector(N-1 downto 0);
    Q_3 : out std_logic_vector(N-1 downto 0)
  );
end component;


--component mux_4_in is
--     	generic( N : integer := 2 );
--    	Port ( 
--    S : in std_logic_vector(1 downto 0);
--    A, B: in std_logic_vector(N-1 downto 0);    
--    C, D: in std_logic_vector(N-1 downto 0);    
--    Q : out std_logic_vector(N-1 downto 0)
-- 		);
--end component;

begin



 DUT_1 : mux_bin_gen_1
        generic map ( N => 2 )
        port map (
            A_1 => A_tb,
            B_1 => B_tb,
            S_1 => S_tb(0),
            Q_1 => Q_tb_1
            );


DUT_2 : mux_bin_gen_2
   generic map ( N => 2 )
   port map (
       A_2 => C_tb,
       B_2 => D_tb,
       S_2 => S_tb(0),
       Q_2 => Q_tb_2

       );

DUT_3 : mux_bin_gen_3
       generic map ( N => 2 )
       port map (
       A_3 => Q_tb_1,
       B_3 => Q_tb_2,
       S_3=> S_tb(1),
       Q_3 => Q_tb_out
);

S_tb <= "10" after 30 ns;
    

-- DUT: mux_4_in
--   generic map( N => 2 )
--   port map(
--      A => A_tb,
--      B => B_tb,
--      C => C_tb,
--      D => D_tb,
--      S => S_tb,
--      Q =>Q_tb
--  );
  
 
-- S_tb <= "10" after 30 ns;
 
 
  
end mux_4_in_alt_TB_arq;