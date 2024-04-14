library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Carry_lookahead_Generator is
	port(G, P : in std_logic;
		  cin : in std_logic;
		  cout : out std_logic
		);
end Carry_lookahead_Generator;
architecture dataflow of Carry_lookahead_Generator is
begin
	cout <=  G or (P and cin);
end dataflow;