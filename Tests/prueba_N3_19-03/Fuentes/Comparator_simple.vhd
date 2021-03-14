----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 16:28:07
-- Design Name: 
-- Module Name: Comparator_simple - Comparator_simple_arq
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

entity Comparator_simple is
    Port ( A_in : in STD_LOGIC;
           B_in : in STD_LOGIC;
           comp_out : out STD_LOGIC);
end Comparator_simple;

architecture Comparator_simple_arq of Comparator_simple is

begin

comp_out <= A_in XNOR B_in;

end Comparator_simple_arq;
