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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FlipFlopD_TB_2 is
--  Port ( );
end FlipFlopD_TB_2;

architecture FlipFlopD_TB_2_arq of FlipFlopD_TB_2 is

    component FlipFlopD is
    Port ( D : in STD_LOGIC;
           clock : in STD_LOGIC;
           clear : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component FlipFlopD;

signal D: STD_LOGIC := '0';
signal clock: STD_LOGIC := '0';
signal clear: STD_LOGIC := '0';
signal Q : STD_LOGIC;
--constant clk_period : time := 1 ns;

begin

DUT : FlipFlopD
Port map(
    D => D,
    clock => clock,
    clear => clear,
    Q => Q
);

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   --clk_process :process
   --begin
      --  clk <= '0';
      -- wait for clk_period/2;  --for 0.5 ns signal is '0'.
      --  clk <= '1';
    --    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
  -- end process;


clock<= not clock after 5 ns;
D <= not D after 11 ns;
clear <= '1' after 80 ns, not clear after 90 ns;


end FlipFlopD_TB_2_arq;