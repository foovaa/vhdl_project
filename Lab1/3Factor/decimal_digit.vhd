library ieee;
use ieee.std_logic_1164.all;  

entity decimal_digit is
    port (BCDdigit :in std_logic_vector(9 downto 0);
	 INTdigit : out integer);
end decimal_digit;

architecture behavioral of decimal_digit is
    signal result : integer;
    begin
	 
	 
	     process( BCDdigit )
        begin
            for i in BCDdigit'range loop
                if BCDdigit(i)='1' then
                    result <= i;
                end if ;
            end loop ;
            INTdigit <= result; 
        end process ; 
		  
		  
    end behavioral;