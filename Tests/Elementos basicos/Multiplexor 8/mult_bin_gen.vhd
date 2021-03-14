
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mult_bin_gen is
  generic( N : integer := 4); 
  Port ( 
    S : in std_logic;
    A, B: in std_logic_vector(N-1 downto 0);
    Q : out std_logic_vector(N-1 downto 0)
  );
end mult_bin_gen;

architecture mult_bin_gen_arq of mult_bin_gen is

begin
gen_mult: for i in 0 to N-1 generate
    Q(i) <= (not S and A(i)) or (S and B(i));
end generate;

end mult_bin_gen_arq;
