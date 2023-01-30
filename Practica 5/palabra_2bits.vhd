----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°5.2 | Palabra de 2 bits con display de 7 segmentos de cátodo común
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity palabra_2bits is
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           display : out STD_LOGIC_VECTOR (6 downto 0) );
end palabra_2bits;

architecture ecuaciones of palabra_2bits is
begin
process (X)
begin
    case (X) is
        when "00"=> --  abcdefg
            display <= "0111110";-- V
        when "01" =>
            display <= "0110000";-- I
        when "10" =>
            display <= "1111110";-- D
        when "11" =>
            display <= "1110111";-- A
        when others =>
            display <= "1111111";
    end case;
end process;
end ecuaciones;