library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity DFF16 is 
	port(clk, rst : in std_logic;
		 D : inout std_logic_vector(15 downto 0));
end DFF16;

architecture behavioral of DFF16 is 
begin
	process(clk, rst)
	begin
		if rst = '1' then 
			D <= "0000000000000000";
		elsif rising_edge(clk) then 
			D<=D;
		end if;
	end process;

end behavioral; 