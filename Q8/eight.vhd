library ieee;
use ieee.std_logic_1164.all;

entity eight is
	port(
			ck : in std_logic;
			serial_in : in std_logic;
			load : in std_logic;
			parallel_in : in std_logic_vector(3 downto 0);
			Ot : out std_logic_vector(3 downto 0)
	);
end eight;

architecture behave of eight is

component dflfl is
	port(
			x1, x2, y1, y2 : in std_logic;
			Od : out std_logic
	);
end component;

component com is
	port(
			ck : in std_logic;
			D : in std_logic;
			Q : out std_logic
	);
end component;

signal tmp: std_logic_vector(2 downto 0);
signal one : std_logic_vector(3 downto 0);

begin
	FT3 : dflfl port map(serial_in , not(load), load, parallel_in(3), one(3));
	CT3 : com port map(ck, one(3), tmp(2));
	Ot(3) <= tmp(2);
	
	FT2 : dflfl port map(tmp(2) , not(load), load, parallel_in(2), one(2));
	CT2 : com port map(ck, one(2), tmp(1));
	Ot(2) <= tmp(1);
	
	FT1 : dflfl port map(tmp(1) , not(load), load, parallel_in(1), one(1));
	CT1 : com port map(ck, one(1), tmp(0));
	Ot(1) <= tmp(0);
	
	FT0 : dflfl port map(tmp(0) , not(load), load, parallel_in(0), one(0));
	CT0 : com port map(ck, one(0), Ot(0));
	
	
end behave;
			
	


