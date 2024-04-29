library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity adder3Bit is 
	port(x : out std_logic_vector(4 downto 0);
		 B : in std_logic_vector(1 downto 0);
		 A : in std_logic_vector(2 downto 0)
		 
	);
end adder3Bit;
architecture structural of adder3Bit is 
signal adden : std_logic_vector(2 downto 0);
signal augend : std_logic_vector(2 downto 0);
begin
adden<=((B(1) and A(2))&(B(1) and A(1))&(B(1) and A(0)));
augend<='0'&(B(0) and A(2))&(B(0) and A(1));
x(0) <= B(0) and A(0);
x(4 downto 1) <= '0'&adden + augend;
end structural;