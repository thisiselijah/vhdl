library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity FA is 
	port(A, B : in std_logic;
		 cin : in std_logic;
		 sum : out std_logic;
		 cout : out std_logic
		);
end FA;
architecture dataflow of FA is
begin
	sum <= A xor B xor Cin;
	cout <= (A and B) or (A and Cin) or (B and Cin);
	
end dataflow;

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Q1 is 
	port(A, B : in std_logic_vector(3 downto 0);
		 cin : in std_logic;
		 result : out std_logic_vector(3 downto 0);
		 cout : out std_logic
		);
end Q1;
architecture dataflow of Q1 is
signal C : std_logic_vector(2 downto 0);
component FA is 
	port(A, B : in std_logic;
		 cin : in std_logic;
		 sum : out std_logic;
		 cout : out std_logic
		);
end component;
signal tempB : std_logic_vector(3 downto 0);
begin
tempB<= not B when cin = '1'
else B;
FA0 : FA port map(A(0), tempB(0), cin, result(0), C(0));
FA1 : FA port map(A(1), tempB(1), C(0), result(1), C(1));
FA2 : FA port map(A(2), tempB(2), C(1), result(2), C(2));
FA3 : FA port map(A(3), tempB(3), C(2), result(3), cout);
		
end dataflow;