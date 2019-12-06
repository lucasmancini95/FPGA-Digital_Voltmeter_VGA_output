--------------------------------------------------------------------------
-- Flip-flop D
--
-- Descripcion: Flip-flop D, diparado con flanco ascendente, con entrada
-- de habilitacion y set y reset asincronicos
--------------------------------------------------------------------------

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity flip_flop_D is
	port(
		clk, rst, ena: in std_logic;
		D: in std_logic;
		Q: out std_logic
	);
end;

architecture flip_flop_D_arq of flip_flop_D is
begin
	process(clk) --Como es sincronico entonces solamente el clock es quien comanda los cambios.
								--La "estructura" process solo cambia cuando el clock cambie
	begin
		if rising_edge(clk) then -- si el clock esta es flanco asendete
		  if rst = '1' then  --y si el reset es 1 ==> la salida Q=0
		      Q <= '0';
		  elsif ena = '1' then --y si el enable es 1 ==> la salida Q es igual a la entrada D
		      Q <= D;
		  end if;
		end if;
	end process;
end;
