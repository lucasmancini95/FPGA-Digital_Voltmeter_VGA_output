----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 20:04:21
-- Design Name: 
-- Module Name: Counter_uptoX - Counter_uptoX_arq
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

entity Counter_uptoX is
 generic( N: integer := 16);
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           X : in STD_LOGIC_VECTOR(N-1 downto 0);
           flag_out : out STD_LOGIC);
end Counter_uptoX;

architecture Counter_uptoX_arq of Counter_uptoX is

component Comparator_X is
  generic( N: integer := 16); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end component;

component Counter_generic is
    generic(
        N: integer := 16); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        enable: in STD_LOGIC;
        clock, reset: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end component;

signal s_reset_aux, s_flag_out: STD_LOGIC;
signal s_count_out: STD_LOGIC_VECTOR( 15 downto 0);

begin

Comparator_X_inst: Comparator_X
port map (
       A_in => s_count_out,
       B_in => X,
       comp_out => s_flag_out
);

Counter_generic_inst: Counter_generic
port map (
        enable => enable,
        clock => clock,
        reset => s_reset_aux,
        Q => s_count_out
);

s_reset_aux <= reset or s_flag_out;
flag_out <= s_flag_out;

end Counter_uptoX_arq;
