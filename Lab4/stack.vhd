library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity stack is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           data_in : in  STD_LOGIC_VECTOR (3 downto 0);
           push : in  STD_LOGIC;
           pop : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (3 downto 0);
           full : out  STD_LOGIC;
           empty : out  STD_LOGIC);
end stack;

architecture Behavioral of stack is

type stack is array (7 downto 0) of STD_LOGIC_VECTOR(3 downto 0);
signal stack1 : stack;



begin
process(clk,rst)
variable sp : integer range 0 to 8 := 0; 
begin
	if(rst = '1')then
		full <= '0';
		empty <= '0';
		sp := 0;
	elsif(clk'event and clk = '1')then
		if(sp = 8)then
			full <= '1';
			empty <= '1';
			if(pop = '1')then
				sp := sp - 1;
				data_out <= stack1(sp);
			end if;	
		elsif(sp = 0)then
			empty <= '0';
			full <= '0';
			if(push = '1')then
				stack1(sp) <= data_in;
				sp := sp + 1;
			end if;
		else
			full <= '0';
			empty <= '1';
			if(pop = '1')then
				sp := sp - 1;
				data_out <= stack1(sp);
			end if;
			if(push = '1')then
				stack1(sp) <= data_in;
				sp := sp + 1;
			end if;
		end if;
	end if;
end process;

end Behavioral;

