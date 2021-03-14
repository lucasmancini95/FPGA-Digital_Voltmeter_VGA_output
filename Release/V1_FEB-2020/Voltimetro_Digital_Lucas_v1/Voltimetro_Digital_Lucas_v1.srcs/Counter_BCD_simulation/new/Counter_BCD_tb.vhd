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

entity Counter_BCD_TB is
end Counter_BCD_TB;

architecture Counter_BCD_TB_arq of Counter_BCD_TB is
 

 
component Counter_BCD is
    Port ( count_in, reset, clock: in std_logic;
    	flag_bcd: out std_logic;
        digit : out STD_LOGIC_VECTOR(3 downto 0)
        );
end component;


 signal s_clock: STD_LOGIC := '0';
 signal s_count_in: STD_LOGIC := '1';
  signal s_reset: STD_LOGIC := '1';
  signal s_flag_out: STD_LOGIC;
  signal s_digit: STD_LOGIC_VECTOR(3 downto 0);
   

 begin
 
 DUT : Counter_BCD
Port map(
    count_in => s_count_in,
    clock => s_clock,
    reset => s_reset,
    flag_bcd => s_flag_out,
    digit => s_digit
);

 s_clock<= not s_clock after 5 ns;
 
 s_reset <= '0' after 30 ns;
 
end Counter_BCD_TB_arq;
