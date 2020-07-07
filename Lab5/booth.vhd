library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use ieee.numeric_std.all;
entity booth is
	 generic (N : integer := 8);
    Port ( clk : in STD_LOGIC;
			  a_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           b_in : in  STD_LOGIC_VECTOR (N-1 downto 0);
           z : out  STD_LOGIC_VECTOR (2*N-1 downto 0));
end booth;

architecture Behavioral of booth is
signal Q : STD_LOGIC_VECTOR(N downto 0);
signal M : STD_LOGIC_VECTOR(2*N-1 downto 0);
signal A : STD_LOGIC_VECTOR(2*N-1 downto 0);
signal zero : STD_LOGIC_VECTOR(N-1 downto 0) := (others => '0'); 
signal one : STD_LOGIC_VECTOR(N-1 downto 0) := (others => '1'); 
signal flag : STD_LOGIC := '1';

begin
	
process(clk)
variable counter : integer range 0 to N := N;
begin
if(rising_edge(clk))then
	if(flag = '0')then
		if(Q(1 downto 0) = "10")then
			A <= A - M;
		elsif(Q(1 downto 0) = "01")then
			A <= A + M;
		end if;
		M <= M(2*N-2 downto 0)&'0';
		Q <= '0'&Q(N downto 1);
		counter := counter - 1;
		if(counter = 0)then
			flag <= '1';
		end if;
	else
		z <= A;
		Q <= b_in&'0';
		if(a_in(N-1) = '0')then
			M <= (zero&a_in);
		else
			M <= (one&a_in);		
		end if;
		A <= (others => '0');
		counter := N;
		flag <= '0';
	end if;
end if;
end process;
	



end Behavioral;

