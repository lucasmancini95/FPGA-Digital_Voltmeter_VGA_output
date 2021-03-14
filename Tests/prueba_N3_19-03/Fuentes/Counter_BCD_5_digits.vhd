----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 12:15:02
-- Design Name: 
-- Module Name: Counter_BCD_5_digits - Counter_BCD_5_digits_arq
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

entity Counter_BCD_5_digits is
    Port ( 
           count_in : in STD_LOGIC; 
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           flag_33000: in STD_LOGIC;
           digit_1 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_2 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_3 : out STD_LOGIC_VECTOR(3 downto 0));
end Counter_BCD_5_digits;

architecture Counter_BCD_5_digits_arq of Counter_BCD_5_digits is

component Counter_BCD is
    port(
    	count_in, reset, clock: in std_logic;
    	flag_bcd: out std_logic;
        digit : out STD_LOGIC_VECTOR(3 downto 0)
    	);
end component;

signal s_flags_bcd, s_flag_aux, s_enable_aux : STD_LOGIC_VECTOR(4 downto 0);
signal s_reset_aux: STD_LOGIC;



begin

s_reset_aux <= reset or flag_33000;
s_enable_aux(0) <= count_in or flag_33000;


Counter_BCD_inst_1 : Counter_BCD
    port map (
        count_in => s_enable_aux(0),
        reset => s_reset_aux,
        clock => clock,
        flag_bcd => s_flags_bcd(0) ,
        digit => open 
    );

s_enable_aux(1) <= (s_enable_aux(0) and s_flags_bcd(0)) or flag_33000;

Counter_BCD_inst_2 : Counter_BCD
    port map (
        count_in => s_enable_aux(1),
        reset => s_reset_aux,
        clock => clock,
        flag_bcd => s_flags_bcd(1) ,
        digit => open 
    );

s_enable_aux(2) <= (s_enable_aux(1) and s_flags_bcd(1)) or flag_33000;

Counter_BCD_inst_3 : Counter_BCD
    port map (
        count_in => s_enable_aux(2),
        reset => s_reset_aux,
        clock => clock,
        flag_bcd => s_flags_bcd(2) ,
        digit => digit_3
    );

s_enable_aux(3) <= (s_enable_aux(2) and s_flags_bcd(2)) or flag_33000;

Counter_BCD_inst_4 : Counter_BCD
    port map (
        count_in => s_enable_aux(3),
        reset => s_reset_aux,
        flag_bcd => s_flags_bcd(3),
        clock => clock,
        digit => digit_2
    );

s_enable_aux(4) <= (s_enable_aux(3)  and s_flags_bcd(3)) or flag_33000;

Counter_BCD_inst_5 : Counter_BCD
    port map (
        count_in => s_enable_aux(4),
        reset => s_reset_aux,
        flag_bcd => s_flags_bcd(4),
        clock => clock,
        digit => digit_1
    );

end Counter_BCD_5_digits_arq;
