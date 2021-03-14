----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.12.2019 20:52:39
-- Design Name: 
-- Module Name: Counter_BCD - Counter_BCD_Arq
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

entity Counter_BCD is
    port(
    	count_in, reset, clock: in std_logic;
    	flag_bcd: out std_logic;
        digit : out STD_LOGIC_VECTOR(3 downto 0)
    	);
end Counter_BCD;

architecture Counter_BCD_Arq of Counter_BCD is

component Counter_generic is
    generic(
        N: integer := 4); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        enable: in STD_LOGIC;
        clock, reset: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end component;

component Comparator_X is
  generic( N: integer := 4); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end component;

--signal s_reset_aux: STD_LOGIC;
signal s_reset_gral: STD_LOGIC;
signal s_comp_out_aux: STD_LOGIC;

signal s_count : std_logic_vector(3 downto 0) := "0000";
signal s_X : std_logic_vector(3 downto 0) := "1001"; -- the limit is the 9 in binary --> we want to count up to 9

begin


    s_reset_gral <= reset OR (s_comp_out_aux AND count_in);
    --s_reset_aux <= count_in and s_reset_gral; --para resetear el contador tiene que estar enableado primero
    digit <= s_count;
    flag_BCD <= s_comp_out_aux;

    Counter_generic_inst: Counter_generic
        generic map( N => 4 )
        port map (
            clock => clock,
            reset =>s_reset_gral,
            enable => count_in,
            Q => s_count);

    Comparator_X_inst: Comparator_X
            generic map( N => 4)
            port map (
                 A_in => s_count,
                 B_in => s_X,
                comp_out => s_comp_out_aux);


end Counter_BCD_Arq;
