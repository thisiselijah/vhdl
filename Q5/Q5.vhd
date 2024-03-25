library ieee;
use ieee.std_logic_1164.all;

entity Q5 is
port(
	clk, x	:in std_logic;
	q		:out std_logic_vector(2 downto 0)
	);
end Q5;

architecture a of Q5 is
begin
	count:process(clk, x)
		variable counter : integer := 0;
	begin
		if (clk'event and clk='1') then
			if (x='1') then
				counter := counter + 1;
				if (counter >= 8) then
					counter := 0;
				end if;
				
			elsif (x='0') then
				counter := counter - 1;
				if (counter <= -1) then
					counter := 7;
				end if;
			end if;
			
			case counter is
				when 0 => q <= "000";
				when 1 => q <= "001";
				when 2 => q <= "011";
				when 3 => q <= "010";
				when 4 => q <= "110";
				when 5 => q <= "111";
				when 6 => q <= "101";
				when 7 => q <= "100";
				when others => null;
			end case;
		end if;
	end process count;
end a;