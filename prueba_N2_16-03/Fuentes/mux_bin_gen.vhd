----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 02:05:22
-- Design Name: 
-- Module Name: mux_bin_gen - mux_bin_gen_arq
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

entity mux_bin_gen is
  generic( N : integer := 4);
  Port (
    S : in std_logic;
    A, B: in std_logic_vector(N-1 downto 0);
    Q : out std_logic_vector(N-1 downto 0)
  );
end mux_bin_gen;

architecture mux_bin_gen_arq of mux_bin_gen is

begin

gen_mult: for i in 0 to N-1 generate
    Q(i) <= (not S and A(i)) or (S and B(i));
end generate;

end mux_bin_gen_arq;
