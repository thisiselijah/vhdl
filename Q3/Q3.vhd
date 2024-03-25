library ieee;
use ieee.std_logic_1164.all;

entity Q3 is port(

	IN1:in bit;
	IN2:in bit;

	A:in bit;
	B:in bit;

	Clk:in std_logic;
	Q:out bit);

end Q3;

architecture a of Q3 is
begin
	process(IN1,IN2,A,B,CLK)
begin
	if Clk' event and Clk = '1' then
		if (A and B) = '0' then
		Q<=IN1;
		else
		Q<=IN2;
		end if;
	end if;
end process;
end a;