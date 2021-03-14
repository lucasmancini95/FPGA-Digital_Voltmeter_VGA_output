

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity VGA_V_sync is
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           V_sync : out STD_LOGIC;
           V_count : out STD_LOGIC_VECTOR (9 downto 0));
end VGA_V_sync;

architecture VGA_V_sync_arq of VGA_V_sync is

	-- Parametros del sincronismo para VGA 640 x 480 (visible)
	
	-- Conf horizontal-->  ||<-HR->|<-HB->|<----HD---->|<-HF->||
--	constant HR: integer:= 96 ; 	-- retorno horizonatal
--	constant HB: integer:= 48 ; 	-- back porch horizontal
--	constant HD: integer := 640; 	-- area horizontal visible
--	constant HF: integer:= 16 ; 	-- front porch horizontal
	
	-- Conf Vertical-->  ||<-VR->|<-VB->|<----VD---->|<-VF->||
	constant VD: integer := 480;	-- area vertical visible
	constant VF: integer:= 10; 		-- front porch vertical
	constant VB: integer := 33; 	-- back porch vertical
	constant VR: integer := 2; 		-- retorno vertical
	
	constant P : std_logic := '1';	-- polaridad
	
	
		-- Contadores
	signal s_V_count : std_logic_vector(9 downto 0);

	-- Senales de estado
	signal s_v_end: std_logic;

	signal s_reset_ffd, inf_edge, sup_edge: std_logic;
			
component VGA_V_counter is
Port(
    clock, reset, enable: in std_logic;
    V_count: out std_logic_vector(9 downto 0)
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
VGA_V_counter_inst: VGA_V_counter
	port map(
		clock => clock,
		reset => reset,
		enable => enable,
		V_count => s_V_count
		);


s_reset_ffd <= reset or sup_edge; -- reset general para el flip-flop, se resetea cuando
-- la cuenta del contador horizontal llega a 752 o cuando se activa el reset del bloque

FlipFlopD_inst: FlipFlopD_ena
	port map(
		clock => clock,
		reset => s_reset_ffd,
		enable => inf_edge,
		D => '1',
		Q => V_sync
		);
		
		
Comparator_inf_edge: Comparator_X
	generic map( N => 10 )
	port map( 
		A_in => s_V_count,
		B_in => std_logic_vector(to_unsigned((VD + VF - 1),10)), -- 489
		comp_out => inf_edge
		);
Comparator_sup_edge: Comparator_X
	generic map( N => 10 )
	port map(
		A_in => s_V_count,
		B_in => std_logic_vector(to_unsigned((VD + VF + VR - 1),10)), --491
		comp_out => sup_edge
		);

  -- Senales de salida
       V_count <= s_V_count;
    --H_sync --> ya esale del FFD

------------------------------------------------------------------------------------------------------------------------------------------------------
-- Forma alternativa con procesos
-------------------------------------------------------------------------------------------------------------------------------------------------------
--process(s_V_count)
--    begin
--      if s_v_count = (VD + VF + VB + VR - 1) then
--        s_V_end <= '1';
--      else
--        s_V_end <= '0';
--      end if;
      
--end process;


--		-- Contador del sincronismo vertical (modulo 525)
--	process(clock)
--	begin
--		if rising_edge(clock) then
--			if enable = '1' then --enable is the horizontal end flag
--				if (s_v_end = '1') then
--					s_v_count <= (others => '0');
--				else
--					s_v_count <= s_v_count + 1;			
--				end if;
--			end if;
--		end if;
			
--	end process;
	
--		-- Generacion de las senales de sincronismo
--	process (clock, reset)
--	begin
--		if reset = '1' then
--			V_sync <= '0';
--		elsif rising_edge(clock) then
--			-- Sincronismo vertical
--			if (s_v_count >= (VD + VF) and (s_v_count <= (VD + VF + VR - 1))) then
--				V_sync <= P;
--			else
--				V_sync <= not P;
--			end if;
--		end if;
--	end process;
	
--	-- Hablitacion de video
--	--vidon <= '1' when (h_count < HD) and (v_count < VD) else '0';
		
--	-- Senales de salida
--	V_count <= std_logic_vector(s_V_count);
--    --H_sync
	

end VGA_V_sync_arq;
