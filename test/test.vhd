library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity test is 
	port(clk: in std_logic;
		 rst: in std_logic;
		 sel: in std_logic;
		   q: out std_logic_vector(3 downto 0);
		);
end test;
architecture bahavioral of test is
type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8, s9);
signal state:state_type;
begin

end bahavioral;
