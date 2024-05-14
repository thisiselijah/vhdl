library ieee;
use ieee.std_logic_1164.all;

entity com is 
	port(	ck : in std_logic;
			D : in std_logic;
			Q : inout std_logic
	);
end com;

architecture behave of com is
begin 
process(ck)
begin 
	if rising_edge(ck) then
		Q <= D;
	else Q <= Q;
	end if;
	
end process;

end behave;