----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.12.2019 13:52:25
-- Design Name: 
-- Module Name: Register_BCD_3 - Register_BCD_3_arq
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

entity Register_BCD_3 is
    port(
       clock, reset, enable: in STD_LOGIC;
       digit_1_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_2_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_3_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_1_out : out STD_LOGIC_VECTOR(3 downto 0);
       digit_2_out : out STD_LOGIC_VECTOR(3 downto 0);
       digit_3_out : out STD_LOGIC_VECTOR(3 downto 0)  
    	);
end Register_BCD_3;

architecture Register_BCD_3_arq of Register_BCD_3 is

component FlipFlopD_ena is
    Port ( D : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           enable : in STD_LOGIC;
           Q : out STD_LOGIC);
end component;

begin
--The flipflops will be the fundamental piece of the register
--This block is a register for 3 BCD digits, to represent a number in BCD we need 4 bits,
--thus we will have 4 flipflops for each digit, 12 in total.

--fliflopd from 0 to 3 will represent the first digit
--fliflopd from 4 to 7 will represent the second digit
--fliflopd from 8 to 12 will represent the third digit

ffds : for i in 0 to 11 generate
	-- flipflops del primer digito
	ffd_first_dig: if i<4 generate
		ffd_first_dig_inst: FlipFlopD_ena
			port map(
				clock => clock,
				reset => reset,
				enable => enable,
				D => digit_1_in(3-i), 
				Q => digit_1_out(3-i)
				);
	end generate;
	-- flipflops del segundo digito
	ffd_second_dig: if i>3 and i<8 generate
		ffd_second_dig_inst: FlipFlopD_ena
			port map(
				clock => clock,
				reset => reset,
				enable => enable,
				D => digit_2_in(7-i), 
				Q => digit_2_out(7-i)
				);
	end generate;
	-- flipflops del tercer digito
	ffd_third_dig: if i>7 generate
		ffd_third_dig_inst: FlipFlopD_ena
			port map(
				clock => clock,
				reset => reset,
				enable => enable,
				D => digit_3_in(11-i), 
				Q => digit_3_out(11-i)
				);
	end generate;
end generate;


end Register_BCD_3_arq;
