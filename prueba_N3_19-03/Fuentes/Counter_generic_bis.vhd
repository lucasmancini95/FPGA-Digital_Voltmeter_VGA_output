----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.02.2020 17:26:51
-- Design Name: 
-- Module Name: Counter_generic_bis - Counter_generic_bis_arq
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

entity Counter_generic_bis is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end Counter_generic_bis;

architecture Counter_generic_bis_arq of Counter_generic_bis is

--signal Q_aux, xor_aux, and_aux: STD_LOGIC_VECTOR(N-1 downto 0);

begin

--process (clock) begin
--    if(rising_edge(clock)) then
--        if(reset='1') then

--            Q <= (others => '0');
--            Q_aux <= (others => '0');
--        else
--            Q <= std_logic_vector(unsigned(Q_aux) + 1);

--        end if;
--    end if;
--end process;


end Counter_generic_bis_arq;
