library ieee;
use ieee.std_logic_1164.all;
entity adder_subtractor_4bit is
	port(OP : in std_logic;
		 A, B : in std_logic_vector(3 downto 0);
		 Result : out std_logic_vector(3 downto 0);
		 Cout, OVERFLOW : out std_logic);
end adder_subtractor_4bit;

architecture arch of adder_subtractor_4bit is
component adder is
	port(X, Y, Cin : in std_logic;
		 S, Cout : out std_logic);
end component;
signal C1, C2, C3, C4: std_logic;
signal temp: std_logic_vector(3 downto 0);

begin 
temp <= A xor B;
FA0: full_adder port map(A(0), temp(0), OP, Result(0), C1);
FA1: full_adder port map(A(1), temp(1), C1, Result(1), C2);
FA2: full_adder port map(A(2), temp(2), C2, Result(2), C3);
FA3: full_adder port map(A(3), temp(3), C3, Result(3), C4);
OVERFLOW <= C3 XOR C4;
Cout <= C4;
end arch;
----------
library ieee;
use ieee.std_logic_1164.all;
entity add_sub is
	port(OP : in std_logic;
		 A, B : in std_logic_vector(3 downto 0);
		 R : out std_logic_vector(3 downto 0);
		 Cout, OVERFLOW : out std_logic);
end add_sub;

architecture arch of add_sub is
component adder is
	port(X, Y, Cin : in std_logic;
		 S, Cout : out std_logic);
end component;
signal C1, C2, C3, C4: std_logic;
signal temp: std_logic_vector(3 downto 0);

begin 
temp(0) <= OP xor B(0);
temp(1) <= OP xor B(1);
temp(2) <= OP xor B(2);
temp(3) <= OP xor B(3);
FA0: adder port map(A(0), temp(0), OP, R(0), C1);
FA1: adder port map(A(1), temp(1), C1, R(1), C2);
FA2: adder port map(A(2), temp(2), C2, R(2), C3);
FA3: adder port map(A(3), temp(3), C3, R(3), C4);
OVERFLOW <= C3 XOR C4;
Cout <= C4;
end arch;
