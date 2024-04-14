library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Partial_Full_Adder is
	Port (A : in STD_LOGIC;
		  B : in STD_LOGIC;
		  cin : in STD_LOGIC;
		  sum : out STD_LOGIC;
		  G : out STD_LOGIC;
		  P : out STD_LOGIC);
end Partial_Full_Adder;

architecture Behavioral of Partial_Full_Adder is
begin

	sum <= A xor B xor cin;
	P <= A or B;
	G <= A and B;
end Behavioral;