library ieee;
use ieee.std_logic_1164.all;
entity Q5 is
	port(X, clk : in std_logic;
		 count : out std_logic_vector(2 downto 0)
		);
end Q5;
architecture behavioral of Q5 is
type state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
signal ls, ps, ns : state_type; --present and next
begin
process(X, clk)
begin
	if rising_edge(clk) then
		if X = '1' then 
			ps<=ns;
		else ps<=ls;
		end if;
	end if;
end process;
ns<=s0 when ps = s7 else
	s1 when ps = s0 else
	s2 when ps = s1 else
	s3 when ps = s2 else
	s4 when ps = s3 else
	s5 when ps = s4 else
	s6 when ps = s5 else
	s7 when ps = s6;
ls<=s0 when ps = s1 else
	s7 when ps = s0 else
	s6 when ps = s7 else
	s5 when ps = s6 else
	s4 when ps = s5 else
	s3 when ps = s4 else
	s2 when ps = s3 else
	s1 when ps = s2;
count<="000" when ps = s0 else
	   "001" when ps = s1 else
	   "011" when ps = s2 else
	   "010" when ps = s3 else
	   "110" when ps = s4 else
	   "111" when ps = s5 else
	   "101" when ps = s6 else
	   "100" when ps = s7;
end behavioral;