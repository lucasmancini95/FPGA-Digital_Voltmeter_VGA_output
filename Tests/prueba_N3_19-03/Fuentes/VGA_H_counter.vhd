----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 28.02.2020 11:55:37
-- Design Name: 
-- Module Name: VGA_H_counter - VGA_H_counter_arq
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

entity VGA_H_counter is
    Port ( clock : in STD_LOGIC;
           enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           flag : out STD_LOGIC;
           H_count : out STD_LOGIC_VECTOR (9 downto 0));
end VGA_H_counter;

architecture VGA_H_counter_arq of VGA_H_counter is

component Comparator_X is
  generic( N: integer := 10); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end component;

 
component Counter_generic is
    generic(
        N: integer := 4); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        enable: in STD_LOGIC;
        clock, reset: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end component;

signal s_reset_counter, comp_result: std_logic;
signal count_aux: std_logic_vector(9 downto 0);

-- Parametros del sincronismo para VGA 640 x 480 (visible)

-- Conf horizontal-->  ||<-HR->|<-HB->|<----HD---->|<-HF->||
constant HR: integer:= 96 ; 	-- retorno horizonatal
constant HB: integer:= 48 ; 	-- back porch horizontal
constant HD: integer := 640; 	-- area horizontal visible
constant HF: integer:= 16 ; 	-- front porch horizontal

-- Conf Vertical-->  ||<-VR->|<-VB->|<----VD---->|<-VF->||
--constant VD: integer := 480;	-- area vertical visible
--constant VF: integer:= 10; 		-- front porch vertical
--constant VB: integer := 33; 	-- back porch vertical
--constant VR: integer := 2; 		-- retorno vertical


begin

Counter_generic_10b: Counter_generic
	generic map( N => 10 )
	port map( 
		clock => clock,
		reset => s_reset_counter,
		enable => enable,
		Q => count_aux
		);

Comparator_limit: Comparator_X
	generic map( N => 10 )
	port map( 
		A_in => count_aux,
		B_in => std_logic_vector(to_unsigned((HD + HF + HB + HR - 1),10)), --"1100011111", --799 
		comp_out => comp_result);

H_count <= count_aux;
s_reset_counter <= comp_result or reset;
flag <= comp_result;
    
    
end VGA_H_counter_arq;
