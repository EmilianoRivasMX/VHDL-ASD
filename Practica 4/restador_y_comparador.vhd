----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°4.1 | Restador y comparador binario de 4 bits
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity restador_y_comparador is
    Port( A, B: in STD_LOGIC_VECTOR (3 downto 0); -- Números de 4 bits a restar
          D: inout STD_LOGIC_VECTOR (3 downto 0); -- Diferencia
          Psal: inout STD_LOGIC;                  -- Préstamo de salida
          menor, igual, mayor: out STD_LOGIC );
end restador_y_comparador;

architecture ecuaciones of restador_y_comparador is
    signal P: STD_LOGIC_VECTOR (2 downto 0);
begin
    -- Semirrestador para calcular el primer bit de la resta
    D(0) <= A(0) xor B(0);
    P(0) <= not A(0) and B(0);

    -- Restador completo para calcular los demás bits de la resta
    D(1) <= A(1) xor B(1) xor P(0);
    P(1) <= (P(0) and (not (A(1) xor B(1)))) or ((not A(1)) and B(1));
    
    D(2) <= A(2) xor B(2) xor P(1);
    P(2) <= (P(1) and (not (A(2) xor B(2)))) or ((not A(2)) and B(2));

    D(3) <= A(3) xor B(3) xor P(2);
    Psal <= (P(2) and (not (A(3) xor B(3)))) or ((not A(3)) and B(3));

    -- Comparador
    menor  <= Psal;
    igual  <= (not Psal) and (not D(0)) and (not D(1)) and (not D(2)) and (not D(3));
    mayor  <= (not Psal) and (D(0) or D(1) or D(2) or D(3));
end ecuaciones;