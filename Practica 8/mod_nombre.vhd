----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°8 | Mod nombre con display 16 segmentos
-- Versión:      1.0
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity letra is
    Port ( clk : in  STD_LOGIC;
           clko : inout  STD_LOGIC;
           q : inout  STD_LOGIC_VECTOR (3 downto 0);
           display : out  STD_LOGIC_VECTOR (15 downto 0));
end letra;

architecture Behavioral of letra is
	signal count: STD_LOGIC_VECTOR (24 downto 0) := "1011111010111100001000000";
	signal clk1hz: STD_LOGIC;
	signal qi: STD_LOGIC_VECTOR (3 downto 0);
begin
process (clk)

begin
	if clk'event and clk='1' then
	if count = "1011111010111100001000000" then
        count <= "0000000000000000000000000";
        clk1hz <= not clk1hz;
	else
	    count <= count + '1';
	end if;
	end if;
	end process;
	
    process(clk1hz)
	begin
	if clk1hz'event and clk1hz = '1' then
	if qi = "1110" then
	    qi <= "0000";
	else
	    qi <= qi + '1';
	end if;
	end if;
	end process;
	
    process (qi)
	begin
	case (qi) is                 --abcdefghkmnprstu
        when "0000" => display <= "1100111100010001"; --E
        when "0001" => display <= "0011001110100000"; --M
        when "0010" => display <= "1100110001000100"; --I
        when "0011" => display <= "0000111100000000"; --L
        when "0100" => display <= "1100110001000100"; --I
        when "0101" => display <= "1111001100010001"; --A
        when "0110" => display <= "0011001110001000"; --N
        when "0111" => display <= "1111111100000000"; --O
        when others => display <= "1111111111111111"; --
	end case;
end process;
end Behavioral;