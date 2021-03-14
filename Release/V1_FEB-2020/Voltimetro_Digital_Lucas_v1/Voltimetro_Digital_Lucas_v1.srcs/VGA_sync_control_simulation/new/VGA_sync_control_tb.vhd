----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.12.2019 00:07:07
-- Design Name: 
-- Module Name: VGA_sync_control - VGA_sync_control_arq
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

entity VGA_sync_control_tb is
end VGA_sync_control_tb;

architecture VGA_sync_control_tb_arq of VGA_sync_control_tb is

component VGA_sync_control is
    Port (        
       enable: in STD_LOGIC;
       clock: in STD_LOGIC;
       reset: in STD_LOGIC;
       flag_visible :out STD_LOGIC;
       H_sync : out STD_LOGIC;
       V_sync : out STD_LOGIC;
       H_count : out STD_LOGIC_VECTOR(9 downto 0);
       V_count : out STD_LOGIC_VECTOR(9 downto 0)
       );
end component;

signal H_count_tb: STD_LOGIC_VECTOR(9 downto 0);
signal V_count_tb: STD_LOGIC_VECTOR(9 downto 0);	
signal flag_out_tb: std_logic;
signal H_sync_tb: std_logic;
signal V_sync_tb: std_logic;
signal clock_tb: std_logic:='1';
signal reset_tb: std_logic:='1';
signal enable_tb: std_logic:='0';
	
begin

	DUT: VGA_sync_control
		port map(
             clock => clock_tb,
             reset => reset_tb,
             enable => enable_tb,
             H_sync => H_sync_tb,
             V_sync => V_sync_tb,
             flag_visible => flag_out_tb,
             H_count => H_count_tb,
             V_count => V_count_tb
			);

	clock_tb<= not clock_tb after 10 ns;
    	reset_tb<= '1' after 5 ns , '0' after 31 ns;
	enable_tb <= '1' after 25 ns;


end;
