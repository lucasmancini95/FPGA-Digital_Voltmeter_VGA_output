----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.12.2019 14:54:39
-- Design Name: 
-- Module Name: Counter_generic - Counter_generic_arq
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

entity Counter_generic is
    generic(
        N: integer := 4); -- Si o si hay que iniciar en algun valor los parametros de generic
    port(
        enable: in STD_LOGIC;
        clock, reset: in STD_LOGIC;
        Q: out STD_LOGIC_VECTOR(N-1 downto 0) -- Vector de salida, son los bits
        );
end Counter_generic;

architecture Counter_generic_arq of Counter_generic is

 component FlipFlopD_ena is
        port(
            clock, reset, enable: in STD_LOGIC;
            D: in STD_LOGIC;
            Q: out STD_LOGIC
            );
    end component;

signal xor_aux, and_aux: STD_LOGIC_VECTOR(N-1 downto 0);
signal Q_aux: STD_LOGIC_VECTOR(N-1 downto 0);
    
begin

--gen_counter: for i in 0 to N-1 generate
--    gen_counter_1: if i = 0 generate
--        and_aux(i) <= '1'; -- El AND del primer bit es siempre un 1
--        xor_aux(i) <= and_aux(i) XOR Q_aux(i);  
--        inst1: FlipFlopD port map( 
--                                    D => xor_aux(i),
--                                    clock => clock,
--                                    clear => reset,
--                                    Q => Q_aux(i)
--                           );
--     end generate;
     
--     gen_counter_2_to_N: if i>0 generate
--        and_aux(i) <= and_aux(i-1) and Q_aux(i-1);
--        xor_aux(i) <= and_aux(i) XOR Q_aux(i);
--        insti: FlipFlopD port map( 
--                                    D => xor_aux(i),
--                                    clock => clock,
--                                    clear => reset,
--                                    Q => Q_aux(i)
--                           );
--     end generate;
-- end generate;
 
-- Q <= Q_aux;

--Q_aux(0) <= '0';

gen_counter: for i in 0 to N-1 generate

    gen_counter_1: if i = 0 generate
        and_aux(i) <= '1'; -- seria el "cont_in" que en este caso es siempre 1 porque queremos contar pasos del clock
        xor_aux(i) <= and_aux(i) XOR Q_aux(i);  
        inst1: FlipFlopD_ena
             port map( 
                clock => clock, 
                reset => reset, 
                enable => enable, 
                D => xor_aux(i), 
                Q => Q_aux(i) );
     end generate;
     
     gen_counter_2_to_N: if i>0 generate
        and_aux(i) <= and_aux(i-1) and Q_aux(i-1);
        xor_aux(i) <= and_aux(i) XOR Q_aux(i);
        insti: FlipFlopD_ena
             port map( 
                clock => clock, 
                reset => reset, 
                enable => enable, 
                D => xor_aux(i), 
                Q => Q_aux(i) );
     end generate;
 end generate;
 
 Q <= Q_aux;


--process (clock) begin
--    if(rising_edge(clock)) then
--        if(reset='1') then

--            Q <= (others => '0');
--            Q_aux <= (others => '0');
--        else
--            Q <= std_logic_vector(unsigned(Q_aux) + 1);

--        end if;
--    end if;
--end process;

--Q <= Q_aux;

end Counter_generic_arq;
