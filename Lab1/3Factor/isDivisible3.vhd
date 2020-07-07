library ieee;
use ieee.std_logic_1164.all;  

entity isDivisible3 is
    port (dig0, dig1, dig2, dig3 :in integer;
	 q :out std_logic);
end isDivisible3;

architecture behavioral of isDivisible3 is
    signal result : integer;
    begin
	 
	 
	     process( dig0, dig1, dig2, dig3 )
        begin
            if (((dig0+dig1+dig2+dig3) mod 3) = 0) then
                q <= '1';
				else
				    q <= '0';
            end if ;
        end process ; 
		  
		  
    end behavioral;