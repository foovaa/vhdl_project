----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:05:34 07/04/2020 
-- Design Name: 
-- Module Name:    cmp_partC - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp_partC is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           l : out  STD_LOGIC;
           g : out  STD_LOGIC;
           e : out  STD_LOGIC);
end cmp_partC;

architecture Behavioral of cmp_partC is

begin
process(a,b)
begin
	if(a > b)then
		l <= '0';
		g <= '1';
		e <= '0';
	elsif(a < b)then
		l <= '1';
		g <= '0';
		e <= '0';	
	else
		l <= '0';
		g <= '0';
		e <= '1';	
	end if;


end process;

end Behavioral;

