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

entity Counter_generic_bis_TB is

end Counter_generic_bis_TB;

architecture Counter_generic_bis_TB_arq of Counter_generic_bis_TB is

signal enable_tb: std_logic:='0';
signal reset_tb: std_logic:='0';
signal clock_tb: std_logic:='0';
signal Q_tb: std_logic_vector( 3 downto 0 );

component Counter_generic_bis is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

begin

 DUT:  Counter_generic_bis
   port map(
      enable=>enable_tb,
      clock=>clock_tb,
      reset=>reset_tb,
      Q=>Q_tb
  );

end Counter_generic_bis_TB_arq;