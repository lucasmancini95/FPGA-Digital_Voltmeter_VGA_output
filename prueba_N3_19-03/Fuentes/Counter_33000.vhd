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

entity Counter_33000 is
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           flag_out : out STD_LOGIC);
end Counter_33000;

architecture Counter_33000_arq of Counter_33000 is

component Counter_uptoX is
    generic(N: integer := 16); 
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR(N-1 downto 0);
           flag_out : out STD_LOGIC);
end component;

component X_generator is
    generic(N: integer := 16); 
    Port ( X : out STD_LOGIC_VECTOR(N-1 downto 0));
end component;

signal s_X: STD_LOGIC_VECTOR(15 downto 0);
signal s_flag_out: STD_LOGIC;
signal s_rst_gral: STD_LOGIC;

begin

Counter_uptoX_inst: Counter_uptoX
port map (
       clock => clock,
       reset => reset, 
       enable => enable,
       X => s_X,
       flag_out => s_flag_out
);

X_generator_inst: X_generator
port map (
       X => s_X
);

flag_out <= s_flag_out;

end Counter_33000_arq;
