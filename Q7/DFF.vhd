library ieee;
use ieee.std_logic_1164.all;
entity DFF is 
	port(D, clk: in std_logic;
		 Q : inout std_logic
	);
end DFF;

architecture dataflow of DFF is 
begin
	q<= d  when rising_edge(clk) else 
		q;
end dataflow;