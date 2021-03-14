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

entity FlipFlopD_ena_TB is
--  Port ( );
end FlipFlopD_ena_TB;

architecture FlipFlopD_ena_TB_arq of FlipFlopD_ena_TB is

    component FlipFlopD_ena is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
    end component FlipFlopD_ena;

signal D_tb: STD_LOGIC := '0';
signal clock_tb: STD_LOGIC := '0';
signal enable_tb: STD_LOGIC := '1';
signal reset_tb: STD_LOGIC := '0';
signal Q_tb : STD_LOGIC;
--constant clk_period : time := 1 ns;

begin

DUT : FlipFlopD_ena
Port map(
    D => D_tb,
    clock => clock_tb,
    enable => enable_tb,
    reset => reset_tb,
    Q => Q_tb
);

   -- Clock process definitions( clock with 50% duty cycle is generated here.
   --clk_process :process
   --begin
      --  clk <= '0';
      -- wait for clk_period/2;  --for 0.5 ns signal is '0'.
      --  clk <= '1';
    --    wait for clk_period/2;  --for next 0.5 ns signal is '1'.
  -- end process;


clock_tb <= not clock_tb after 5 ns;
D_tb <= not D_tb after 11 ns;
enable_tb <= not enable_tb after 87 ns;
reset_tb <= '1' after 80 ns, not reset_tb after 90 ns;


end FlipFlopD_ena_TB_arq;