----------------------------------------------------------------------------------
-- Company: 
-- Engineer:
-- 
-- Create Date:    16:25:50 07/04/2020 
-- Design Name: 
-- Module Name:    cmp_partA - Behavioral 
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

entity cmp_partA is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           l : out  STD_LOGIC;
           g : out  STD_LOGIC;
           e : out  STD_LOGIC);
end cmp_partA;

architecture Behavioral of cmp_partA is


COMPONENT cmp
PORT(
	a : IN std_logic;
	b : IN std_logic;
	l_in : IN std_logic;
	g_in : IN std_logic;
	e_in : IN std_logic;          
	l_out : OUT std_logic;
	g_out : OUT std_logic;
	e_out : OUT std_logic
	);
END COMPONENT;

signal zero : std_logic := '0';
signal l1:std_logic;
signal l2:std_logic;
signal l3:std_logic;
signal g1:std_logic;
signal g2:std_logic;
signal g3:std_logic;
signal e1:std_logic;
signal e2:std_logic;
signal e3:std_logic;
begin

Inst_cmp1: cmp PORT MAP(a =>a(3),b =>b(3),l_in =>zero,g_in =>zero,e_in =>zero,l_out =>l1,g_out =>g1,e_out =>e1);
Inst_cmp2: cmp PORT MAP(a =>a(2),b =>b(2),l_in =>l1  ,g_in =>g1  ,e_in =>e1  ,l_out =>l2,g_out =>g2,e_out =>e2);
Inst_cmp3: cmp PORT MAP(a =>a(1),b =>b(1),l_in =>l2  ,g_in =>g2  ,e_in =>e2  ,l_out =>l3,g_out =>g3,e_out =>e3);
Inst_cmp4: cmp PORT MAP(a =>a(0),b =>b(0),l_in =>l3  ,g_in =>g3  ,e_in =>e3  ,l_out =>l ,g_out =>g ,e_out =>e);

end Behavioral;

