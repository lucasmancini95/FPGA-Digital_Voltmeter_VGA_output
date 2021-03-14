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

entity mux_8_in is
	generic( N : integer := 4);
	port(
		A, B, C, D, E, F, G, H: in std_logic_vector( N-1 downto 0 );
		S: in std_logic_vector( 2 downto 0 );
		Q: out std_logic_vector( N-1 downto 0)
		);
end mux_8_in;

architecture mux_8_in_arq of mux_8_in is

component mux_4_in is
    	generic( N : integer := 4 );
    	Port ( 
    		A, B, C, D: in std_logic_vector(N-1 downto 0);
    		Q: out std_logic_vector(N-1 downto 0);
    		S: in std_logic_vector(1 downto 0) -- S va a ser el vector que diga que valor se elije
 		);
 		end component;
 	
 	component mux_bin_gen is
 	  generic( N : integer := 4 );
 	  Port ( 
 	      S : in std_logic;
 	      A, B: in std_logic_vector(N-1 downto 0);
 	      Q : out std_logic_vector(N-1 downto 0)
 	      );
 	 end component;
 	 
 	 signal q_auxABCD, q_auxEFGH: std_logic_vector( N-1 downto 0 );
 	 
begin

	mux_ABCD: mux_4_in 
	   generic map ( N => N ) 
	   port map ( 
	       A => A,
	       B => B,
	       C => C,
	       D => D,
	       Q => q_auxABCD,
	       S => S( 1 downto 0 ) -- manejo le vector de selectores como un slice
	       );
	       
	mux_EFGH: mux_4_in 
	   generic map ( N => N )
	   port map ( 
	       A => E,
	       B => F,
	       C => G,
	       D => H,
	       Q => q_auxEFGH,
	       S => S( 1 downto 0 )
	       );
	       
     mux_out: mux_bin_gen
        generic map ( N => N ) 
        port map ( 
            A => q_auxABCD,
            B => q_auxEFGH,
            Q => Q,
            S => S(2)
            );

end mux_8_in_arq;
