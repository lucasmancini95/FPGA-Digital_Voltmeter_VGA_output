----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.02.2020 12:02:53
-- Design Name: 
-- Module Name: FlipFlopD_ena - FlipFlopD_ena_arq
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

entity FlipFlopD_ena is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
end FlipFlopD_ena;


--Flip Flop D with enable works with the clock up flanks:

--ena   reset   D   Clk     Q
-- 0      x     x   x       0
-- x      1     x   x       0
-- 1      0     0   up      0
-- 1      0     1   up      1
-- 1      0     x   0       previous state
-- 1      0     x   1       previous state


architecture FlipFlopD_ena_arq of FlipFlopD_ena is

begin

	process(clock) --Como es sincronico entonces solamente el clock es quien comanda los cambios.
								--La "estructura" process solo cambia cuando el clock cambie
	begin
		if rising_edge(clock) then
		  if reset = '1' then
		      Q <= '0';
		  elsif enable = '1' then
		      Q <= D;
		  end if;
		end if;
	end process;

end FlipFlopD_ena_arq;
