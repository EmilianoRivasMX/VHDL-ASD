----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°5 | Decodificador BCD a display de 7 segmentos de cátodo común
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decodificador_BCD is
    Port( W, X, Y, Z: in STD_LOGIC;
          a, b, c, d, e, f, g: out STD_LOGIC );
end decodificador_BCD;

architecture ecuaciones of decodificador_BCD is
begin
    a <= W or Y or (X xnor Z);
    b <= not X or (Y xnor z);
    c <= X or not Y or Z;
    d <= W or (not X and Y) or (not X and not Z) or (Y and not Z) or (X and not Y and Z);
    e <= (not X and not Z) or (Y and not Z);
    f <= W or (X and not Z) or (X and not Y) or (not Y and not Z);
    g <= W or X or Y;
end ecuaciones;
