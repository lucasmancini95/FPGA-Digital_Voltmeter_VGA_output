----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.12.2019 18:07:51
-- Design Name: 
-- Module Name: VGA_H_sync - VGA_H_sync_arq
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

entity VGA_H_sync is
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           H_sync : out STD_LOGIC;
           flag : out STD_LOGIC;
           H_count : out STD_LOGIC_VECTOR (9 downto 0));
end VGA_H_sync;

architecture VGA_H_sync_arq of VGA_H_sync is


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
	
	--constant P : std_logic := '1';	-- polaridad
	
	signal s_reset_ffd, inf_edge, sup_edge: std_logic;
		
		-- Contadores
	signal s_H_count :std_logic_vector(9 downto 0 );
	
	-- Senales de estado
	signal s_H_end: std_logic;
	
component VGA_H_counter is
Port(
    clock, reset, enable: in std_logic;
    H_count: out std_logic_vector(9 downto 0); 
    flag: out std_logic
    );
end component;
    
component FlipFlopD_ena is
    Port ( enable : in STD_LOGIC;
           reset : in STD_LOGIC;
           clock : in STD_LOGIC;
           D : in STD_LOGIC;
           Q : out STD_LOGIC);
 end component;
    
component Comparator_X is
  generic( N: integer := 10); -- N = number of bits of each unit to compare
  Port ( 
    A_in, B_in : in std_logic_vector(N-1 downto 0);
    comp_out: out std_logic
  );
end component;


begin

-- the horizontal counter counts up to the end of the Front Porch (==799)
VGA_H_counter_inst: VGA_H_counter
	port map(
		clock => clock,
		reset => reset,
		enable => enable,
		flag => s_H_end,
		H_count => s_H_count
		);


s_reset_ffd <= reset or sup_edge; -- reset general para el flip-flop, se resetea cuando
-- la cuenta del contador horizontal llega a 752 o cuando se activa el reset del bloque

FlipFlopD_inst: FlipFlopD_ena
	port map(
		clock => clock,
		reset => s_reset_ffd,
		enable => inf_edge,
		D => '1',
		Q => H_sync
		);
		
		
Comparator_inf_edge: Comparator_X
	generic map( N => 10 )
	port map( 
		A_in => s_H_count,
		B_in => std_logic_vector(to_unsigned((HD + HF - 1),10)), -- "1010001111", --655
		comp_out => inf_edge
		);
Comparator_sup_edge: Comparator_X
	generic map( N => 10 )
	port map(
		A_in => s_H_count,
		B_in => std_logic_vector(to_unsigned((HD + HF + HR - 1),10)), --"1011101111", --751
		comp_out => sup_edge
		);

  -- Senales de salida
       H_count <= s_H_count;
       flag <= s_H_end;
    --H_sync --> ya esale del FFD

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Forma alternativa con procesos
-------------------------------------------------------------------------------------------------------------------------------------------------------
---- Contador del sincronismo horizontal --> por cada rise UP del clock aumenta en 1 el la posicion horizontal (H_count+=1)
--                                       --  pero si se llego al final  (S_H_end='1') ==> la cuenta (H_count) se vuelve a 0
--	process(clock)
--	begin
--		if rising_edge(clock) then
--			if s_H_end = '1' then
--				s_h_count <= (others => '0');
--		      else
--				s_h_count <= s_h_count + 1;
--	        end if;
--	   end if;
--	end process;
	

--    process(s_H_count)                      --> se encarga de poner en 1 el "flag de terminacion de la parte horizontal" (S_H_end)
--                                            -- cuando la cuenta llegue al numero maximo ((HD + HF + HB + HR - 1)=799) --> luego del porch y todo)
--        begin
--          if s_H_count = (HD + HF + HB + HR - 1) then
--            s_H_end <= '1';
--          else
--            s_H_end <= '0';
--          end if;
--    end process;


---- Generacion de las senales de sincronismo
--    process (clock, reset, enable)
--        begin
--            --reset -->  se desabilita el syncronismo si el enable esta en 0 OR si el reset esta en 1
--            if reset = '1' or enable = '0' then
--                H_sync <= '0';
--            --clock
--            elsif rising_edge(clock) then --> con un rise UP del clock
--                -- Sincronismo horizontal
--                if (s_H_count >= (HD + HF) and (s_H_count <= (HD + HF + HR - 1))) then
--                    H_sync <= P; -- cuando esta en la zona activa (--> el P es un '1' en este caso)
--                                 -- "zona activa" --> despues de front porch y antes del back porch
--                else
--                    H_sync <= not P; -- se desactiva luego del front porch --> el NOT P es un '0' en este caso
--                end if;
--            end if;
--        end process;
        
--        -- Hablitacion de video
--        --vidon <= '1' when (h_count < HD) and (v_count < VD) else '0';
            
--        -- Senales de salida
--        H_count <= std_logic_vector(s_H_count);
--        flag <= s_H_end;
--        --H_sync --> ya esta manejada en la parte de "generacion de syncronismo"
		      
end VGA_H_sync_arq;