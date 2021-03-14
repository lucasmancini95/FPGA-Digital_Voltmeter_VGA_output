library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Register_BCD_3_TB is
end;

architecture Register_BCD_3_TB_arq of Register_BCD_3_TB is

	component  Register_BCD_3 is
		port(
       clock, reset, enable: in STD_LOGIC;
       digit_1_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_2_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_3_in : in STD_LOGIC_VECTOR(3 downto 0);
       digit_1_out : out STD_LOGIC_VECTOR(3 downto 0);
       digit_2_out : out STD_LOGIC_VECTOR(3 downto 0);
       digit_3_out : out STD_LOGIC_VECTOR(3 downto 0)  
			);
	end component;
	
	signal s_in_bcd_1: STD_LOGIC_VECTOR(3 downto 0);
	signal s_in_bcd_2: STD_LOGIC_VECTOR(3 downto 0);
	signal s_in_bcd_3: STD_LOGIC_VECTOR(3 downto 0);	
	signal flag_in_tb: std_logic:='0'; -- es el que me habilita los enables del registro
	signal clock_tb: std_logic:='1';
	signal reset_tb: std_logic:='1';
	signal s_out_bcd_1: STD_LOGIC_VECTOR(3 downto 0);
	signal s_out_bcd_2: STD_LOGIC_VECTOR(3 downto 0);
	signal s_out_bcd_3: STD_LOGIC_VECTOR(3 downto 0);	
	
	-- la señal sera 2.53V
	constant dig1_tb: std_logic_vector(3 downto 0):= "0011"; --3
	constant dig2_tb: std_logic_vector(3 downto 0):= "0101"; --5
	constant dig3_tb: std_logic_vector(3 downto 0):= "0010"; --2 
	
begin 
	
	clock_tb<= NOT clock_tb after 1ns;
	reset_tb<= '0' after 40ns;
	flag_in_tb<= '1' after 10ns;
	
	--valores de entrada
	s_in_bcd_1<= dig1_tb;
	s_in_bcd_2<= dig2_tb;
	s_in_bcd_3<= dig3_tb;
	
	DUT: Register_BCD_3
		port map(
             clock => clock_tb,
             reset => reset_tb,
             enable => flag_in_tb,
             digit_1_in => s_in_bcd_1,
             digit_2_in => s_in_bcd_2,
             digit_3_in => s_in_bcd_3,
             digit_1_out => s_out_bcd_1,
             digit_2_out => s_out_bcd_2,
             digit_3_out => s_out_bcd_3
			);

end; 