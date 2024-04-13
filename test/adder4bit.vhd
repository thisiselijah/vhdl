library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity adder4bit is port
	(a, b : in std_logic_vector (3 downto 0);
	 cin : in std_logic;
	 sum : out std_logic_vector (3 downto 0);
	 carry : out std_logic
	);
end adder4bit;
architecture structural of adder4bit is
signal c1, c2, c3 : std_logic;
component module is port
	(x, y, z : in std_logic;
	 s, c : out std_logic
	);
end component;
begin
FA0 : module port map(a(0), b(0), cin, sum(0), c1);
FA1 : module port map(a(1), b(1), c1, sum(1), c2);
FA2 : module port map(a(2), b(2), c2, sum(2), c3);
FA3 : module port map(a(3), b(3), c3, sum(3), carry);
end structural;








