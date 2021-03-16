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
entity ADC is
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           signal_in : in STD_LOGIC;
           digit_1 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_2 : out STD_LOGIC_VECTOR(3 downto 0);
           digit_3 : out STD_LOGIC_VECTOR(3 downto 0)
           );
end ADC;

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Arquitecture:

architecture ADC_Arq of ADC is
--------------------------------------------------------------------------------
-- Components:

component Counter_BCD_5_digits is
    port(
       clock, reset, flag_33000: in STD_LOGIC;
       count_in: in STD_LOGIC;
       digit_1 : out STD_LOGIC_VECTOR(3 downto 0);
       digit_2 : out STD_LOGIC_VECTOR(3 downto 0);
       digit_3 : out STD_LOGIC_VECTOR(3 downto 0)      
    	);
end component;

component Counter_33000 is
    port(
       clock, reset, enable: in STD_LOGIC;
       flag_out: out STD_LOGIC
    	);
end component;


component Register_BCD_3 is
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

--------------------------------------------------------------------------------
--Signals:
signal s_flag, s_flag_del: std_logic; 
signal s_digit_1: std_logic_vector(3 downto 0);
signal s_digit_2: std_logic_vector(3 downto 0);
signal s_digit_3: std_logic_vector(3 downto 0);

-------------------------------------------------}-------------------------------
begin
--------------------------------------------------------------------------------
--Instanciations:

Counter_BCD_5_digits_inst: Counter_BCD_5_digits
port map (
       clock => clock,
       reset => reset, 
      flag_33000 => s_flag_del,
       count_in => signal_in,
       digit_1 => s_digit_1,
       digit_2 => s_digit_2,
       digit_3 => s_digit_3
);

Counter_33000_inst: Counter_33000
port map (
       clock => clock,
       reset => reset, 
       enable => enable,
       flag_out => s_flag
);

Register_BCD_3_inst: Register_BCD_3
port map (
       clock => clock,
       reset => reset, 
       enable => s_flag,
       digit_1_in => s_digit_1,
       digit_2_in => s_digit_2,
       digit_3_in => s_digit_3,
       digit_1_out => digit_1,
       digit_2_out => digit_2,
       digit_3_out => digit_3
);

ffd_ins: entity work.FlipFlopD_ena
			port map(
				enable	=> '1',
				reset	=> '0',
				clock	=> clock,
				D		=> s_flag,
				Q		=> s_flag_del
			);

end ADC_Arq;


