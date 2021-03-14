----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2019 21:55:24
-- Design Name: 
-- Module Name: Visible_flag_generator - Visible_flag_generator_arq
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Visible_flag_generator_tb is
end Visible_flag_generator_tb;

architecture Visible_flag_generator_tb_arq of Visible_flag_generator_tb is

component Visible_flag_generator is
    Port ( H_count : in STD_LOGIC_VECTOR (9 downto 0);
           V_count : in STD_LOGIC_VECTOR (9 downto 0);
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           flag_visible : out STD_LOGIC);
end component;


    signal H_count_tb: STD_LOGIC_VECTOR (9 downto 0):= "1010000100"; --5 
    signal V_count_tb: STD_LOGIC_VECTOR (9 downto 0):= "0111101010"; --10
    
    signal flag_out_tb: std_logic:='0'; -- es el que me habilita los enables del registro
	signal clock_tb: std_logic:='1';
	signal reset_tb: std_logic:='1';
    
begin

	clock_tb<= NOT clock_tb after 1ns;
	reset_tb<= '0' after 40ns;
	H_count_Tb <= "0000000101" after 85ns;
	V_count_Tb <= "0000000100" after 70ns;
	
	DUT: Visible_flag_generator
		port map(
           H_count => H_count_tb,
           V_count => V_count_tb,
           reset => reset_tb,
           clock => clock_tb,
           flag_visible => flag_out_tb
         );

end;