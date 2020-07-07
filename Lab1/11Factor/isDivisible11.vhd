library ieee;
use ieee.std_logic_1164.all;  

entity isDivisible11 is
    port (dig0, dig1, dig2, dig3 :in integer;
	 q :out std_logic);
end isDivisible11;

architecture behavioral of isDivisible11 is
    signal result : integer;
    begin
	 
	 
	     process( dig0, dig1, dig2, dig3 )
        begin
            if (((dig0+dig1*10+dig2*100+dig3*1000) mod 11) = 0) then
                q <= '1';
				else
				    q <= '0';
            end if ;
        end process ; 
		  
		  
    end behavioral;