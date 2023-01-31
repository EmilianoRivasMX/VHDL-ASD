----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°7 | Multivibrador astable a 10Hz
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity reloj10 is
    Port ( clk : in  STD_LOGIC;
           clkHZ : out  STD_LOGIC);
end reloj10;

architecture ecuaciones of reloj10 is
	signal count: STD_LOGIC_VECTOR (21 downto 0) := (others => '0'); 
	signal clk1: STD_LOGIC;
begin

process(clk)
begin
	if clk'event and clk = '1' then
		if count = "1001100010010110100000" then
			count <= "0000000000000000000000";
			clk1 <= not clk1;
		else
			count <= count + '1';
		end if;
	end if;
end process;

	clkHZ <= clk1;
end ecuaciones;