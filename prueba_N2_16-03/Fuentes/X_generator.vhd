----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 20:06:44
-- Design Name: 
-- Module Name: X_generator - X_generator_arq
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

entity X_generator is
    generic(N: integer := 16); 
    Port ( X : out STD_LOGIC_VECTOR(N-1 downto 0));
end X_generator;

architecture X_generator_arq of X_generator is

begin

X <= "1000000011101000"; --33000 in binary

end X_generator_arq;
