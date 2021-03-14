----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.12.2019 20:37:09
-- Design Name: 
-- Module Name: FlipFlopD - FlipFlopD_arq
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


entity FlipFlopD is
    Port ( D : in STD_LOGIC;
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           enable : in STD_LOGIC;
           Q : out STD_LOGIC);
end FlipFlopD;


--Flip Flop D works with the clock up flanks:

--D   Clk     Q
--0   up      0
--1   up      1
--x   0       previous state
--x   1       previous state

architecture FlipFlopD_arq of FlipFlopD is

begin
    process (clock,clear)
    begin
        if clear='1' then
            Q <= '0';
        elsif clock ' event and clock='1' then
            Q <= D ;
        end if;
    end process;
    
end FlipFlopD_arq;
