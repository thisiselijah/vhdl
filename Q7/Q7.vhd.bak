library ieee;
use ieee.std_logic_1164.all;
entity Q7 is 
	port(D, clk : in std_logic;
		 Q : inout std_logic_vector(3 downto 0)
	);
end Q7;

architecture structural of Q7 is 

component DFF is 
	port(D, clk: in std_logic;
		 Q : inout std_logic
	);
end component;

begin
Q(0) <= D;
gen: for i in 0 to 2 generate
        DF: component DFF port map (Q(i), clk, Q(i+1));
end generate;
	
end structural;