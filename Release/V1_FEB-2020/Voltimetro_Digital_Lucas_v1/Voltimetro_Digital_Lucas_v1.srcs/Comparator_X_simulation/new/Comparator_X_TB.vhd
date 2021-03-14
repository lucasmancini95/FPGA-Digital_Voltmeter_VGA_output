----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 13:36:23
-- Design Name: 
-- Module Name: FlipFlopD_TB_1 - FlipFlopD_TB_1_arq
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Comparator_X_TB is
--  Port ( );
end Comparator_X_TB;

architecture Comparator_X_TB_arq of Comparator_X_TB is

component Comparator_X
  generic( N: integer := 4 ); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end component;
			
			
signal s_A_in: STD_LOGIC_VECTOR(3 downto 0):= "0001";
signal s_B_in : STD_LOGIC_VECTOR(3 downto 0):= "1001";
signal s_comp_out : STD_LOGIC;

begin

DUT : Comparator_X
Port map(
    A_in => s_A_in,
    B_in => s_B_in,
    comp_out => s_comp_out
);


s_A_in <= "1001" after 50 ns;



end Comparator_X_TB_arq;