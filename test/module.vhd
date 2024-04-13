library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
entity module is port
	(x, y, z : in std_logic;
	 s, c : out std_logic);
end module;
architecture dataflow of module is
begin 
	s <= x xor y xor z;
	c <= (x and y) or (x and z) or (y and z);
end dataflow;