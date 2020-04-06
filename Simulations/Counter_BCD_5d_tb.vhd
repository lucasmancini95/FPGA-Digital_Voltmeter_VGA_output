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

entity Counter_BCD_5_digits_TB is
end Counter_BCD_5_digits_TB;

architecture Counter_BCD_5_digits_TB_arq of Counter_BCD_5_digits_TB is
 

 
component Counter_BCD_5_digits is
    Port ( 
           count_in : in STD_LOGIC; 
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           flag_33000: in STD_LOGIC;
           digit_1 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_2 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_3 : out STD_LOGIC_VECTOR(3 downto 0);
 digit_4 : out STD_LOGIC_VECTOR(3 downto 0);
 digit_5 : out STD_LOGIC_VECTOR(3 downto 0) );
end component;



 signal s_clock: STD_LOGIC := '0';
 signal s_count_in: STD_LOGIC := '0';
 signal s_reset: STD_LOGIC := '0';
 signal s_flag_in: STD_LOGIC := '0';

 signal s_digit_1 : STD_LOGIC_VECTOR(3 downto 0);
 signal s_digit_2 : STD_LOGIC_VECTOR(3 downto 0);
 signal s_digit_3 : STD_LOGIC_VECTOR(3 downto 0);
 signal s_digit_4 : STD_LOGIC_VECTOR(3 downto 0);
 signal s_digit_5 : STD_LOGIC_VECTOR(3 downto 0);
   
begin
 
 DUT : Counter_BCD_5_digits
Port map(
    count_in => s_count_in,
    clock => s_clock,
    reset => s_reset,
    flag_33000=> s_flag_in,
    digit_1=> s_digit_1,
    digit_2=> s_digit_2,
    digit_3=> s_digit_3,
    digit_4=> s_digit_4,
    digit_5=> s_digit_5
);

 s_clock<= not s_clock after 10 ns;
 
 s_count_in <= '1' after 30 ns;
 
 s_reset <= '1' after 50 ns, '0' after 75ns;

 s_flag_in <= '1' after 65 ns, '0' after 95ns;
 
end;
