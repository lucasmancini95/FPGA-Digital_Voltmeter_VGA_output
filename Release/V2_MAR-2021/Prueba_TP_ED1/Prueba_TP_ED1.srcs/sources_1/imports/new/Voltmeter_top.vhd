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
    Port ( signal_in : in STD_LOGIC;
            signal_out : out STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           R : out STD_LOGIC;
           G : out STD_LOGIC;
           B : out STD_LOGIC;
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC);
end Voltmeter_top;



--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--Arquitecture:

architecture Voltmeter_top_arq of Voltmeter_top is

--------------------------------------------------------------------------------
-- Components:

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

component FlipFlopD_ena is
    port(
         D : in STD_LOGIC;
         clock : in STD_LOGIC;
         reset : in STD_LOGIC;
         enable : in STD_LOGIC;
         Q : out STD_LOGIC
    );
end component;

--component Clock_voltmeter
--    port(
--     clock_in : in STD_LOGIC;
--     reset : in STD_LOGIC;
--     clock_out : out STD_LOGIC
--     );
--end component;
--------------------------------------------------------------------------------
--Signals:

signal s_digit_1, s_digit_2, s_digit_3: std_logic_vector(3 downto 0);
--signal voltmeter_clock: std_logic; 
signal s_sigma_delta: std_logic;

---------------------------------------------------------------------------------
begin
---------------------------------------------------------------------------------
--Instanciations:

--Clock_voltmeter_inst : Clock_voltmeter
--   port map (  
--   clock_out => voltmeter_clock,
--   reset => reset,
--   clock_in => clock
-- );
sigma_delta_inst : FlipFlopD_ena
   port map ( 
     D  => signal_in,
     clock => clock,
     reset => reset,
     enable => enable,
     Q => s_sigma_delta
 );

 
ADC_inst : ADC
   port map ( 
  
       	digit_1 => s_digit_1,
       	digit_2 => s_digit_2,
       	digit_3 => s_digit_3,
    	signal_in => s_sigma_delta,
    	reset => reset,
    	clock => clock,
    	enable => enable
 );
 
 VGA_inst : VGA
   port map ( 
  
       	digit_1 => s_digit_1,
       	digit_2 => s_digit_2,
       	digit_3 => s_digit_3,
    	reset => reset,
    	clock => clock,
    	enable => enable,
    	H_sync => H_sync,
    	V_sync => V_sync,
    	R => R,
    	G => G,
    	B => B
 );

signal_out <= not s_sigma_delta;

end Voltmeter_top_arq;
