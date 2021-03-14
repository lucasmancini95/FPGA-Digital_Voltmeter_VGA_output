----------------------------------------------------------------------------------
-- Company: UNSAM
-- Engineer: Lucas Mancini
-- 
-- Create Date: 11.12.2019 00:03:47
-- Design Name: 
-- Module Name: VGA - VGA_arq
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

entity VGA is
    Port ( clock : in STD_LOGIC;
           digit_1 : in STD_LOGIC_VECTOR(3 downto 0);
           digit_2 : in STD_LOGIC_VECTOR(3 downto 0);
           digit_3 : in STD_LOGIC_VECTOR(3 downto 0);
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           R : out STD_LOGIC;
           G : out STD_LOGIC;
           B : out STD_LOGIC;
           H_sync : out STD_LOGIC;
           V_sync : out STD_LOGIC);
end VGA;

architecture VGA_arq of VGA is

component VGA_sync_control is
    port(
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

component VGA_data_gen is
    port(
    
       H_count : in STD_LOGIC_VECTOR(9 downto 0);
       V_count : in STD_LOGIC_VECTOR(9 downto 0);
       digit_1 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_2 : in STD_LOGIC_VECTOR(3 downto 0);
       digit_3 : in STD_LOGIC_VECTOR(3 downto 0);
       pixel : out STD_LOGIC
    );
end component;

component VGA_rgb_gen is
    port(
       data_in: in STD_LOGIC;
       H_count : in STD_LOGIC_VECTOR(9 downto 0);
       V_count : in STD_LOGIC_VECTOR(9 downto 0);
       visible :in STD_LOGIC;
        R : out STD_LOGIC;
        G : out STD_LOGIC;
        B : out STD_LOGIC
      );
end component;


signal s_H_count: STD_LOGIC_VECTOR(9 downto 0);
signal s_V_count: STD_LOGIC_VECTOR(9 downto 0);
signal s_pix: STD_LOGIC;
signal  s_visible : STD_LOGIC;

begin

VGA_sync_control_inst: VGA_sync_control
    port map (
       clock => clock,
       reset => reset,
       enable => enable,
       flag_visible => s_visible,
       H_count => s_H_count,
       V_count => s_V_count,
       H_sync => H_sync,
       V_sync => V_sync     
 );
    
 
VGA_data_gen_inst: VGA_data_gen
    port map (
       H_count => s_H_count,
       V_count => s_V_count,
       digit_1 => digit_1,
       digit_2 => digit_2,
       digit_3 => digit_3,
       pixel => s_pix
 );
    

VGA_rgb_gen_inst: VGA_rgb_gen
    port map (
       data_in => s_pix,
       visible => s_visible,
       H_count => s_H_count,
       V_count => s_V_count,
       R => R,
       G => G,
       B => B
 );
    
    
end VGA_arq;
