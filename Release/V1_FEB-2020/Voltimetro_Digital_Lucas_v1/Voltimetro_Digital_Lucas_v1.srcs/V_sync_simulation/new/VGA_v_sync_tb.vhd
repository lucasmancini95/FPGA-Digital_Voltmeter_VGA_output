library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VGA_V_sync_tb is
end;

architecture VGA_V_sync_tb_arq of VGA_V_sync_tb is

component VGA_V_sync is
    Port ( enable : in STD_LOGIC;
           clock : in STD_LOGIC;
           reset : in STD_LOGIC;
           V_sync : out STD_LOGIC;
           V_count : out STD_LOGIC_VECTOR (9 downto 0));
end component;


signal V_count_tb: STD_LOGIC_VECTOR(9 downto 0):="0000000000";
signal V_sync_tb: std_logic:='0';
signal clock_tb: std_logic:='1';
signal reset_tb: std_logic:='0';
signal enable_tb: std_logic:='0';
	
begin

	DUT: VGA_V_sync
		port map(
             clock => clock_tb,
             reset => reset_tb,
             enable => enable_tb,
             V_sync => V_sync_tb,
             V_count => V_count_tb
	);

	clock_tb<= not clock_tb after 10 ns;
    	reset_tb<= '1' after 5 ns , '0' after 31 ns;
	enable_tb <= '1' after 25 ns;


end;
