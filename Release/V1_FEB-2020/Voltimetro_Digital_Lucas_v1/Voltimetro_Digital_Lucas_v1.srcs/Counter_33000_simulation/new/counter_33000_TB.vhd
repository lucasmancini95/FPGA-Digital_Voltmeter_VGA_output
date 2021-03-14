----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 20:04:21
-- Design Name: 
-- Module Name: Counter_33000 - Counter_33000_arq
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

entity Counter_33000_TB is
end Counter_33000_TB;

architecture Counter_33000_TB_arq of Counter_33000_TB is
 

 
component Counter_33000 is
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           flag_out : out STD_LOGIC);
end component;



 signal s_clock: STD_LOGIC := '0';
 signal s_enable: STD_LOGIC := '0';
  signal s_reset: STD_LOGIC := '0';
  signal s_flag_out: STD_LOGIC;
   
begin
 
 DUT : Counter_33000
Port map(
    enable => s_enable,
    clock => s_clock,
    reset => s_reset,
    flag_out => s_flag_out
);

 s_clock<= not s_clock after 10 ns;
 
 s_enable <= '1' after 30 ns;
 
 s_reset <= '1' after 50 ns, '0' after 75ns;
 
end;