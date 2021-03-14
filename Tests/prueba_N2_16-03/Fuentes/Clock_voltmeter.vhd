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

entity Clock_voltmeter is
    Port ( clock_in : in STD_LOGIC;
            reset : in STD_LOGIC;
           clock_out : out STD_LOGIC);
end Clock_voltmeter;

architecture Clock_voltmeter_arq of Clock_voltmeter is

signal s_clock_out: STD_LOGIC:= '1';
signal s_aux: STD_LOGIC:= '1';

begin
    process (clock_in,reset)
    begin
                    if reset = '1' then
                                    clock_out <= '0';
                                    
                    elsif clock_in'event and clock_in = '1' then
                                    s_clock_out <= not s_clock_out;
                                    clock_out <= s_clock_out;
                    end if;
    end process;

end Clock_voltmeter_arq;
