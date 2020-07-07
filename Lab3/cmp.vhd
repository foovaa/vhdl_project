----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:17:42 07/04/2020 
-- Design Name: 
-- Module Name:    cmp - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cmp is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           l_in : in  STD_LOGIC;
           g_in : in  STD_LOGIC;
           e_in : in  STD_LOGIC;
           l_out : out  STD_LOGIC;
           g_out : out  STD_LOGIC;
           e_out : out  STD_LOGIC);
end cmp;

architecture Behavioral of cmp is

begin
process(a,b,l_in,g_in,e_in)begin

if(l_in = '1')then
	l_out <= '1';
	g_out <= '0';
	e_out <= '0';
elsif(g_in = '1')then
	l_out <= '0';
	g_out <= '1';
	e_out <= '0';	
else
	if((a = '1' and b = '1') or (a = '0' and b = '0'))then
		l_out <= '0';
		g_out <= '0';
		e_out <= '1';		
	elsif(a = '1' and b = '0')then
		l_out <= '0';
		g_out <= '1';
		e_out <= '0';	
	else
		l_out <= '1';
		g_out <= '0';
		e_out <= '0';	
	end if;
end if;
end process;
end Behavioral;

