----------------------------------------------------------------------------------
-- Company: UNSAM
-- Engineer: Lucas Mancini
-- 
-- Create Date: 10.12.2019 22:04:37
-- Design Name: 
-- Module Name: Clock_voltmeter - Clock_voltmeter_arq
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


--In this case the clock of the voltemeter is 25 MHZ because is the frecuency of the VGA
-- The actual frecuency of the FPGA development kit SPARTAN to be use is 50MHz
-- Thus the arquitecture of this block is just a divide by 2 of the clock in
-- ==> clock_out_frecuency= clock_in_frecuency / 2

entity Clock_voltmeter_TB is
end Clock_voltmeter_TB;

architecture Clock_voltmeter_TB_arq of Clock_voltmeter_TB is


component Clock_voltmeter is
    Port ( clock_in : in STD_LOGIC;
            reset : in STD_LOGIC;
           clock_out : out STD_LOGIC);
end component;


signal s_reset: STD_LOGIC := '0';
signal s_clock_in: STD_LOGIC := '1';
signal s_clock_out: STD_LOGIC;


begin

DUT : Clock_voltmeter
Port map(
    clock_in => s_clock_in,
    reset  => s_reset ,
    clock_out => s_clock_out
);


s_clock_in <= not s_clock_in after 2 ns; --this corresponds to the period time of a clock of 50MHZ

s_reset <= '1' after 90 ns; --reset aplied adter 90ns

end Clock_voltmeter_TB_arq;