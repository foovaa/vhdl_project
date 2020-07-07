----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:50:38 07/04/2020 
-- Design Name: 
-- Module Name:    incubator - Behavioral 
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
use ieee.STD_LOGIC_unsigned.all;
use ieee.numeric_std.all;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity incubator is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           t : in  STD_LOGIC_VECTOR (6 downto 0);
           heater : out  STD_LOGIC;
           cooler : out  STD_LOGIC;
           crs : out  STD_LOGIC_VECTOR (3 downto 0));
end incubator;

architecture Behavioral of incubator is

signal o_state : integer range 1 to 3;
signal i_state : integer range 0 to 3;
signal temp : integer range 0 to 127;
signal heater_t : STD_LOGIC;
signal cooler_t : STD_LOGIC;
begin

temp <= to_integer(unsigned(t));

process(clk)begin
	if(rising_edge(clk))then
		if(rst = '1')then
			o_state <= 1;
			i_state <= 0;
			heater_t <= '0';
			cooler_t <= '0';
		else
			if(o_state = 1)then
				if(temp > 35)then
					o_state <= 2;
					heater_t <= '0';
					cooler_t <= '1';
				elsif(temp < 15)then
					o_state <= 3;
					heater_t <= '1';
					cooler_t <= '0';
				end if;
			elsif(o_state = 2)then
				if(temp < 25)then
					o_state <= 1;
					heater_t <= '0';
					cooler_t <= '0';					
				end if;
			else
				if(temp > 30)then
					o_state <= 1;
					heater_t <= '0';
					cooler_t <= '0';					
				end if;
			end if;

			if(cooler_t = '1')then
				if(i_state = 0)then
					if(temp > 35)then
						i_state <= 1;
						crs <= "0100";
					end if;
				elsif(i_state = 1)then
					if(temp > 40)then
						i_state <= 2;
						crs <= "0110";
					elsif(temp < 25)then
						i_state <= 0;
						crs <= "0000";
					end if;
				elsif(i_state = 2)then
					if(temp > 45)then
						i_state <= 3;
						crs <= "1000";
					elsif(temp < 35)then
						i_state <= 1;
						crs <= "0100";
					end if;	
				elsif(i_state = 3)then
					if(temp < 40)then
						i_state <= 2;
						crs <= "0110";
					end if;
				end if;
			end if;	
		end if;
	end if;
end process;

heater <= heater_t;
cooler <= cooler_t;


end Behavioral;

