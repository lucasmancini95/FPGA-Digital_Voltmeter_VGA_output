----------------------------------------------------------------------------------
-- Company: UNSAM
-- Engineer: Lucas Mancini
-- 
-- Create Date: 10.12.2019 21:56:47
-- Design Name: 
-- Module Name: Voltmeter_top - Voltmeter_top_arq
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

entity Voltmeter_top is
    Port (
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
		   data_volt_in_n: in std_logic;
		   data_volt_in_p: in std_logic;
		   data_volt_out: out std_logic;
           R : out STD_LOGIC;
           G : out STD_LOGIC;
           B : out STD_LOGIC;
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC
	);
	
	-- Mapeo de pines para el kit spartan 3E starter
	attribute loc: string;
	attribute slew: string;
	attribute drive: string;
	attribute iostandard: string;
	
	attribute loc of clock: signal is "C9";
	
	-- Entradas diferenciales
	attribute iostandard of data_volt_in_p: signal is "LVDS_25";	
	attribute loc of data_volt_in_p: signal is "A4";
	attribute iostandard of data_volt_in_n: signal is "LVDS_25";	
	attribute loc of data_volt_in_n: signal is "B4";

	-- Salida realimentada
	attribute loc of data_volt_out: signal is "C5";
	attribute slew of data_volt_out: signal is "FAST";
	attribute drive of data_volt_out: signal is "8";
	attribute iostandard of data_volt_out: signal is "LVCMOS25";
	
	-- VGA
	attribute loc of H_sync: signal is "F15";		-- HS
	attribute loc of V_sync: signal is "F14";		-- VS
	attribute loc of R: signal is "H14";	-- RED
	attribute loc of G: signal is "H15";	-- GRN
	attribute loc of B: signal is "G15";	-- BLUE
	
	
	attribute loc of enable: signal is "L13";	-- GRN
	attribute loc of reset: signal is "N17";	-- BLUE

		   
end Voltmeter_top;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Arquitecture:

architecture Voltmeter_top_arq of Voltmeter_top is

--------------------------------------------------------------------------------
-- Components:

	component IBUFDS 
		port(
			I : in std_logic; 
			IB : in std_logic; 
			O : out std_logic
		); 
	end component;

component VGA is
    port(
    	clock, reset, enable: in std_logic;
    	digit_1, digit_2, digit_3: in std_logic_vector(3 downto 0);
    	H_sync, V_sync: out std_logic;
    	R, G, B: out std_logic
    	);
end component;

component ADC is
    port(
    	digit_1, digit_2, digit_3: out std_logic_vector(3 downto 0);
    	signal_in, reset, clock, enable: in std_logic 
    );
end component;

component Clock_voltmeter
    port(
     clock_in : in STD_LOGIC;
     reset : in STD_LOGIC;
     clock_out : out STD_LOGIC
     );
end component;
--------------------------------------------------------------------------------
--Signals:

signal s_digit_1, s_digit_2, s_digit_3: std_logic_vector(3 downto 0);
signal voltmeter_clock: std_logic; 
signal Diff_Input: std_logic;
signal salFFD: std_logic;

---------------------------------------------------------------------------------
begin
---------------------------------------------------------------------------------
--Instanciations:

	ibuf0: IBUFDS port map(
		I => data_volt_in_p,
		IB => data_volt_in_n,
		O => Diff_Input
	);

Clock_voltmeter_inst : Clock_voltmeter
   port map (  
   clock_out => voltmeter_clock,
   reset => reset,
   clock_in => clock
 );
 
 data_volt_out <= salFFD;
 
 ffd_inst: entity work.FlipFlopD_ena
	port map(
		enable => '1',
		reset => reset,
		clock => clock,
		D => Diff_Input,
		Q => salFFD
	);
 
ADC_inst : ADC
   port map ( 
  
       	digit_1 => s_digit_1,
       	digit_2 => s_digit_2,
       	digit_3 => s_digit_3,
    	signal_in => '1',--salFFD,
    	reset => reset,
    	clock => voltmeter_clock,
    	enable => enable
 );
 
 VGA_inst : VGA
   port map ( 
  
       	digit_1 => s_digit_1,
       	digit_2 => s_digit_2,
       	digit_3 => s_digit_3,
    	reset => reset,
    	clock => voltmeter_clock,
    	enable => enable,
    	H_sync => H_sync,
    	V_sync => V_sync,
    	R => R,
    	G => G,
    	B => B
 );
 
 

end Voltmeter_top_arq;
