----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 14:54:39
-- Design Name: 
-- Module Name: Comparator_X - Comparator_X_arq
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

entity Comparator_X is
  generic( N: integer := 4); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end Comparator_X;

architecture Comparator_X_arq of Comparator_X is

signal  and_i_aux: std_logic_vector(N downto 0); --salidas de las compuertas AND intermedies
signal xnor_i_aux: std_logic_vector(N-1 downto 0); --salidas de las XOR de entrada

begin

  and_i_aux(0) <= '1'; --la entrada del primer AND es un 1

  gen_comp: for i in 0 to N-1 generate
      xnor_i_aux(i) <= A_in(i) XNOR B_in(i);
      and_i_aux(i+1) <= and_i_aux(i) AND xnor_i_aux(i);
  end generate;

  comp_out <= and_i_aux(N);


end Comparator_X_arq;
