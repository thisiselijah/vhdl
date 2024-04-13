library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity mul3 is port
	(A, B : in std_logic_vector(2 downto 0);
		R : out std_logic_vector(5 downto 0)
	);
end mul3;
architecture dataflow of mul3 is
signal temp0 : std_logic_vector(2 downto 0);
signal temp1 : std_logic_vector(3 downto 0);
signal temp2 : std_logic_vector(4 downto 0);
begin
temp0 <= A when B(0)='1' else "000";
temp1 <= A&'0' when B(1)='1' else "0000";
temp2 <= A&"00" when B(2)='1' else "00000";
R <= temp0+temp1+('0'&temp2);
end dataflow;