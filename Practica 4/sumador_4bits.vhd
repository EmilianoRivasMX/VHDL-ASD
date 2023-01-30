----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°4 | Sumador Binario
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sumador_4bits is
    Port ( A, B : in  STD_LOGIC_VECTOR (3 downto 0); -- Números de 4 bits a sumar
           S : out  STD_LOGIC_VECTOR (3 downto 0);   -- Resultado de la suma
           Cs : out  STD_LOGIC );                     -- Carry de Salida
end sumador_4bits;

architecture ecuaciones of sumador_4bits is
	signal C: STD_LOGIC_VECTOR (2 downto 0);		 -- Carries intermedios
begin
	-- Semisumador para calcular el primer bit de la suma
	S(0) <= A(0) xor B(0);
	C(0) <= A(0) and B(0);
	
	-- Sumador completo para calcular los demás bits de la suma
	S(1) <= A(1) xor B(1) xor C(0);
	C(1) <= (C(0) and (A(1) xor B(1))) OR (A(1) and B(1));

	S(2) <= A(2) xor B(2) xor C(1);
	C(2) <= (C(1) and (A(2) xor B(2))) OR (A(2) and B(2));

	S(3) <= A(3) xor B(3) xor C(2);
	Cs   <= (C(2) and (A(3) xor B(3))) OR (A(3) and B(3));
end ecuaciones;