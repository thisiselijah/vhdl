library ieee;
use ieee.std_logic_1164.all;

entity dflfl is
	port(
			x1, x2, y1, y2 : in std_logic;
			Od : out std_logic
	);
end dflfl;

architecture behave of dflfl is

begin
	Od <= (x1 and x2) or (y1 and y2);
end behave;