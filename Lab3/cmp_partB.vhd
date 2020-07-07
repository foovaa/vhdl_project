----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:47:50 07/04/2020 
-- Design Name: 
-- Module Name:    cmp_partB - Behavioral 
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

entity cmp_partB is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           l : out  STD_LOGIC;
           g : out  STD_LOGIC;
           e : out  STD_LOGIC);
end cmp_partB;

architecture Behavioral of cmp_partB is

signal l_t : STD_LOGIC;
signal g_t : STD_LOGIC;
signal e_t : STD_LOGIC;

begin

process(clk)
begin
	if(rising_edge(clk))then
		if(rst = '1')then
			l_t <= '0';
			g_t <= '0';
			e_t <= '1';			
		else
			if(a = '1' and b = '0')then
				l_t <= '0';
				g_t <= '1';
				e_t <= '0';
			elsif(a = '0' and b = '1')then
				l_t <= '1';
				g_t <= '0';
				e_t <= '0';			
			else
				l_t <= l_t;
				g_t <= g_t;
				e_t <= e_t;
			end if;	
		end if;
	end if;
end process;

l <= l_t;
g <= g_t;
e <= e_t;


end Behavioral;

