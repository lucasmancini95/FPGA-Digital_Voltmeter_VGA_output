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

entity Visible_flag_generator is
    Port ( H_count : in STD_LOGIC_VECTOR (9 downto 0);
           V_count : in STD_LOGIC_VECTOR (9 downto 0);
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           flag_visible : out STD_LOGIC);
end Visible_flag_generator;

architecture Visible_flag_generator_arq of Visible_flag_generator is

	-- Parametros del sincronismo para VGA 640 x 480
	constant HD: integer := 640; 	-- area horizontal visible
    constant VD: integer := 480;	-- area vertical visible
    
    signal s_H_count : integer;
    signal s_V_count : integer;
    
begin

--component Comparator_X is
--      generic( N: integer := 4); -- N = number of bits of each unit to compare
--      Port ( 
--        A_in, B_in : in std_logic_vector(N-1 downto 0);
--        comp_out: out std_logic
--    );
--	end component;
	
--component FlipFlopD_ena is
--    Port ( enable : in STD_LOGIC;
--           reset : in STD_LOGIC;
--           clock : in STD_LOGIC;
--           D : in STD_LOGIC;
--           Q : out STD_LOGIC);
--	end component;
	
--	signal comp_hor_aux: std_logic_vector(1 downto 0);
--	signal comp_ver_aux: std_logic_vector(1 downto 0);
--	signal visible_h, visible_v: std_logic;
--	signal rst_hor, rst_ver: std_logic;
	
--begin
	
--	-- Parte visible horizontal 
--	rst_hor <= reset OR comp_hor_aux(1);
	
--	comp_hor_ena: Comparator_X
--		generic map(N=>10)
--		port map(
--			A_in=> H_count,
--			B_in=> "1001111111", -- 639
--			comp_out=> comp_hor_aux(0)
--			);
			
--	comp_hor_rst: Comparator_X
--		generic map(N=>10)
--		port map(
--			A_in=> H_count,
--			B_in=> "1100011110", -- 798
--			comp_out=> comp_hor_aux(1)
--			);
			
--	ffd_hor: FlipFlopD_ena
--		port map(
--			clock=>clock,
--			reset=>rst_hor,
--			enable=>comp_hor_aux(0),
--			D=>'1',
--			Q=>visible_h
--			);
	
	
--	-- parte visible vertical
	
--	rst_ver <= reset OR comp_ver_aux(1);
	
--	comp_ver_ena: Comparator_X
--		generic map(N=>10)
--		port map(
--			A_in=> V_count,
--			B_in=> "0111011111", -- 479
--			comp_out=> comp_ver_aux(0)
--			);
	
--	comp_ver_rst: Comparator_X
--		generic map(N=>10)
--		port map(
--			A_in=> V_count,
--			B_in=> "1000000111", -- 519
--			comp_out=> comp_ver_aux(1)
--			);
	
--	ffd_inst: FlipFlopD_ena
--		port map(
--			clock=>clock,
--			reset=>rst_ver,
--			enable=> comp_ver_aux(0),
--			D=>'1',
--			Q=>visible_v
--			);
			
--flag_visible <= NOT(visible_h) AND NOT(visible_v);



----------------------------------------------------------------------------------
--Variante con condicionales
-----------------------------------------------------------------------------------
	-- Hablitacion de video
	--Horizontal:
	-- se esta en la parte visible cuando la cuenta del horizontal esta entre 
    -- 0 y 640. Voy a generar una señal que sea 0 mientras la cuenta esté entre 0 y 
    -- 640 (equivalentemente que este en 1 cuando este entre 640 y 799) 
    -- y despues la niego para tener la señal que yo quiero
	
	--Vertical:
	-- se esta en la parte visible cuando la cuenta del vertical esta entre 0 y
    -- 480. Voy a generar una señal que sea 0 mientras la cuenta este entre 0 y 480 
    -- (equivalentemente que este en 1 cuando este entre 480 y 520) y despues la niego
    -- para tener la señal que y quiero
    
	s_H_count <= to_integer(unsigned (H_count)); 
    s_V_count <= to_integer(unsigned (V_count)); 
	
	flag_visible <= '1' when
				 (s_H_count < HD) and (s_V_count < VD)
			 else '0';


end Visible_flag_generator_arq;



	
