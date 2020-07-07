library ieee;
use ieee.std_logic_1164.all;  

entity BCD_to_decimal is
    port (a0, a1, a2, a3 : in std_logic;
    dig :out std_logic_vector(9 downto 0));
end BCD_to_decimal;

architecture behavioral of BCD_to_decimal is
    
    begin
	     dig(0) <= (not a0)and(not a1)and(not a2)and(not a3);
        dig(1) <= a0 and(not a1)and(not a2)and(not a3);
        dig(2) <= (not a0)and a1 and(not a2)and(not a3);
        dig(3) <= a0 and a1 and (not a2)and(not a3);
        dig(4) <= (not a0)and(not a1)and a2 and (not a3);
        dig(5) <= a0 and (not a1)and a2 and(not a3);
        dig(6) <= (not a0)and a1 and a2 and (not a3);
        dig(7) <= a0 and a1 and a2 and (not a3);
        dig(8) <= (not a0)and(not a1)and(not a2)and a3;
        dig(9) <= a0 and (not a1)and(not a2)and a3;
		  
		  
    end behavioral;