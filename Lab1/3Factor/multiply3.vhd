
library ieee;
use ieee.std_logic_1164.all;  

entity multiply3 is
    port (a : in std_logic_vector(15 downto 0);
    divisible3 :out std_logic);
end multiply3;

architecture structural of multiply3 is
    component BCD_to_decimal
        port (a0, a1, a2, a3 : in std_logic;
        dig :out std_logic_vector(9 downto 0));
    end component;
	 component decimal_digit
        port (BCDdigit :in std_logic_vector(9 downto 0);
	     INTdigit : out integer);
    end component;
	 component isDivisible3
        port (dig0, dig1, dig2, dig3 :in integer;
	     q :out std_logic);
    end component;
    signal digit0, digit1, digit2, digit3 : std_logic_vector(9 downto 0);
	 signal deci_dig0, deci_dig1, deci_dig2, deci_dig3 : integer;
    
    begin
        
        d0: BCD_to_decimal port map (a(0), a(1), a(2), a(3), digit0);
		  e0: decimal_digit port map (digit0, deci_dig0);
        d1: BCD_to_decimal port map (a(4), a(5), a(6), a(7), digit1);
		  e1: decimal_digit port map (digit1, deci_dig1);
        d2: BCD_to_decimal port map (a(8), a(9), a(10), a(11), digit2);
		  e2: decimal_digit port map (digit2, deci_dig2);
        d3: BCD_to_decimal port map (a(12), a(13), a(14), a(15), digit3);
		  e3: decimal_digit port map (digit3, deci_dig3);
		  f: isDivisible3 port map (deci_dig0, deci_dig1, deci_dig2, deci_dig3, divisible3);
        
    end structural;
     