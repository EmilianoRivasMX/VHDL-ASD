----------------------------------------------------------------------------------
-- Institución:	 UPIICSA | IPN
-- Autor:   	 Emiliano Rivas (@EmilianoRivasMX)
--  
-- Practica: 	 N°8 | Mod6 AScendente 
-- Versión:      1.0
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity cotabla is
    Port ( clk : in STD_LOGIC;
    X : in STD_LOGIC;
    display : out STD_LOGIC_VECTOR (6 downto 0) );
end cotabla;

architecture Behavioral of cotabla is
    signal con: STD_LOGIC_VECTOR (25 DOWNTO 0):= (others => '0');
    signal clk1: STD_LOGIC;
    signal Q: STD_LOGIC_VECTOR (2 DOWNTO 0);
begin
-----------------------------------------
process (clk)
    begin
    if clk 'event and clk = '1' then
    if con = "01011111010111100001000000" then -- 50 MHZ. A BINARIO PERIODO DE 1 HZ- 1 SEG.
       con <= "00000000000000000000000000";
        clk1 <= (NOT clk1);
    else
        con <= con + '1' ;
    end if;
    end if;
end process;
---------------------------------------------
process (clk1)
    begin
    if clk1 'event and clk1 ='1' then
    -- asc
    if X = '0' then
        case Q is
            when "000" => Q <= "001";
            when "001" => Q <= "010";
            when "010" => Q <= "011";
            when "011" => Q <= "100";
            when "100" => Q <= "101";
            when "101" => Q <= "000";
            when others => Q <="000";
        end case;
    end if;
    
    case Q is
        when "000" => display <="1111110"; --0
        when "001" => display <="0110000"; --1
        when "010" => display <="1101101"; --2
        when "011" => display <="1111001"; --3
        when "100" => display <="0110011"; --4
        when "101" => display <="1011011"; --5
        when others => display <="1111111";
    end case;
    end if;
end process;
end Behavioral;