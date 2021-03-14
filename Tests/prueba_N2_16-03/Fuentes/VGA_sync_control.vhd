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

entity VGA_sync_control is
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
end VGA_sync_control;

architecture VGA_sync_control_arq of VGA_sync_control is

component VGA_H_sync is
    port(
    	enable, clock, reset: in std_logic;
    	H_sync, flag: out std_logic;
    	H_count: out std_logic_vector(9 downto 0)
    	);
end component;

component VGA_V_sync is
    port(
    	enable, clock, reset: in std_logic;
    	V_sync: out std_logic;
    	V_count: out std_logic_vector(9 downto 0)
    	);
end component;

component Visible_flag_generator is
    port(
    	H_count: in std_logic_vector(9 downto 0); --entra toda la cuenta del contador horizontal
    	V_count: in std_logic_vector(9 downto 0);
    	reset, clock: in std_logic;
    	flag_visible: out std_logic
    	);
end component;

signal s_enable_V: std_logic;
signal s_H_count, s_V_count: std_logic_vector(9 downto 0);

begin

--------------------------------------------------------------------------------
--  Horizontal axis sync
VGA_H_sync_inst : VGA_H_sync
	port map(
		enable => enable,
		clock => clock,
		reset => reset,
		H_sync => H_sync,
		flag => s_enable_V,
		H_count => s_H_count
		);

H_count <= s_H_count;
--------------------------------------------------------------------------------
--	Vertical axis sync
VGA_V_sync_inst : VGA_V_sync
	port map(
		enable => s_enable_V,
		clock => clock,
		reset => reset,
		V_sync => V_sync,
		V_count => s_V_count
		);
	
V_count <= s_V_count;
--------------------------------------------------------------------------------
--	Visible part disrimination --> flag that indicates (with 1) if the sync is in the visible part

Visible_flag_generator_inst : Visible_flag_generator
    port map(
        clock => clock,
		reset => reset,
		V_count => s_V_count,
		H_count => s_H_count,
		flag_visible => flag_visible 
    );


end VGA_sync_control_arq;
