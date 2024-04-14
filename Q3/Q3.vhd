library ieee;
use ieee.std_logic_1164.all;

entity Q3 is 
	port(A, B, IN1, IN2 : in std_logic;
		 clk : in std_logic;
		 Q : inout std_logic
		);

end Q3;

architecture bahavioral of Q3 is
signal s, D : std_logic;  
begin
	s<=A and B;
process(s)
begin
	if s = '0' then
		D<=IN1;
	else D<=IN2;
	end if;
end process;
process(clk)
begin
	if rising_edge(clk) then
		Q<=D;
	else Q<=Q;
	end if;
end process;

end bahavioral;