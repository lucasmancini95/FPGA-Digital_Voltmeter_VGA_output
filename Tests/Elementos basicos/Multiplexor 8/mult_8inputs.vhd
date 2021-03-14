library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_8input is
	generic( N : integer := 4);
	port(
		A, B, C, D, E, F, G, H: in std_logic_vector( N-1 downto 0 );
		S: in std_logic_vector( 2 downto 0 );
		Q: out std_logic_vector( N-1 downto 0 )
	);
end;

architecture  mult_8input_arq of mult_8input  is
	
	component mult_4inputs is
    	generic( N : integer := 4 );
    	Port ( 
    		A, B, C, D: in std_logic_vector(N-1 downto 0);
    		Q: out std_logic_vector(N-1 downto 0);
    		S: in std_logic_vector(1 downto 0) -- S va a ser el vector que diga que valor se elije
 		);
 		end component;
 	
 	component mult_bin_gen is
 	  generic( N : integer := 4 );
 	  Port ( 
 	      S : in std_logic;
 	      A, B: in std_logic_vector(N-1 downto 0);
 	      Q : out std_logic_vector(N-1 downto 0)
 	      );
 	 end component;
 	 
 	 signal q_auxABCD, q_auxEFGH: std_logic_vector( N-1 downto 0 );
 	 
begin

	mux_ABCD: mult_4inputs 
	   generic map ( N => N ) 
	   port map ( 
	       A => A,
	       B => B,
	       C => C,
	       D => D,
	       Q => q_auxABCD,
	       S => S( 1 downto 0 ) -- manejo le vector de selectores como un slice
	       );
	mux_EFGH: mult_4inputs
	   generic map ( N => N )
	   port map ( 
	       A => E,
	       B => F,
	       C => G,
	       D => H,
	       Q => q_auxEFGH,
	       S => S( 1 downto 0 )
	       );
     mux_out: mult_bin_gen
        generic map ( N => N ) 
        port map ( 
            A => q_auxABCD,
            B => q_auxEFGH,
            Q => Q,
            S => S(2)
            );

end mult_8input_arq;
