----------------------------------------------------------------------------------
-- Company: UNSAM
-- Engineer: Lucas Mancini
-- 
-- Create Date: 11.12.2019 00:03:47
-- Design Name: 
-- Module Name: ADC - ADC_Arq
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


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Entity:
entity ADC_tb is
end ADC_tb;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Arquitecture:

architecture ADC_tb_Arq of ADC_tb is
--------------------------------------------------------------------------------
-- Component:
component ADC
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           signal_in : in STD_LOGIC;
           digit_1 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_2 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_3 : out STD_LOGIC_VECTOR(3 downto 0));
end component;
--------------------------------------------------------------------------------
--Signals:

signal s_enable: std_logic:='0'; 
signal s_clock: std_logic := '0';
signal s_reset: std_logic := '0';
signal s_signal_in: STD_LOGIC := '1'; --the signal in is set to 1 --> represents the max value --> in this case 3.3V
signal s_digit_1: std_logic_vector(3 downto 0);
signal s_digit_2: std_logic_vector(3 downto 0);
signal s_digit_3: std_logic_vector(3 downto 0);

-------------------------------------------------}-------------------------------
begin

DUT : ADC
Port map(
    clock => s_clock,
    enable => s_enable,
    reset => s_reset,
    signal_in => s_signal_in,
    digit_1 => s_digit_1,
    digit_2 => s_digit_2,
    digit_3 => s_digit_3  
);


 s_clock<= not s_clock after 10 ns;
 s_enable<= '1' after 20 ns;
 s_reset<= '1' after 15 ns, '0' after 35ns;
 s_signal_in<= '1' after 35ns , '0' after 300050 ns;

end ADC_tb_Arq;
