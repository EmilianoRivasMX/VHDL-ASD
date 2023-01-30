----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°5.1 | Decodificador BCD a display de 7 segmentos de ánodo común
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_BCD is
    Port ( X : in STD_LOGIC_VECTOR (1 downto 0);
           display : out STD_LOGIC_VECTOR (6 downto 0) );
end decodificador_BCD;

architecture ecuaciones of decodificador_BCD is
begin
process (X)
begin
    case (X) is
        when "0000"=>-- abcdefg
            display <= "0000001";--0
        when "0001" =>
            display <= "1001111";--1
        when "0010" =>
            display <= "0010010";--2
        when "0011" =>
            display <= "0000110";--3
        when "0100" =>
            display <= "1001100";--4
        when "0101" =>
            display <= "0100100";--5
        when "0110" =>
            display <= "0100000";--6
        when "0111" =>
            display <= "0001111";--7
        when "1000" =>
            display <= "0000000";--8
        when "1001" =>
            display <= "0000100";--9
        when others =>
            display <= "1111111";
    end case;
end process;
end ecuaciones;