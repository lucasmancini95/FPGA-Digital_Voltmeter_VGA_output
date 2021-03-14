----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 14:54:39
-- Design Name: 
-- Module Name: Counter_generic - Counter_generic_arq
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

entity Counter_generic_TB is

end Counter_generic_TB;

architecture Counter_generic_TB_arq of Counter_generic_TB is

component Counter_generic
    generic( N: integer := 4); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        enable: in STD_LOGIC;
        clock, reset: in STD_LOGIC;
        Q: inout STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end component;

signal s_clock: STD_LOGIC := '0';
signal s_enable: STD_LOGIC := '0';
signal s_reset: STD_LOGIC := '0';
signal s_Q_out: STD_LOGIC_VECTOR(3 downto 0);

begin

DUT : Counter_generic
generic map ( N => 4 )
Port map(
    enable => s_enable,
    clock => s_clock,
    reset => s_reset,
    Q => s_Q_out
);

s_clock<= not s_clock after 0.5 ns;
s_enable<= '1' after 10 ns;
s_reset<= '1' after 60 ns;

end Counter_generic_TB_arq;