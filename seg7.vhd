library ieee;
use ieee.std_logic_1164.all;

entity seg7 is 
	port(score : in INTEGER;
		 segments : out std_logic_vector(6 downto 0));
end seven_segment;

architecture behavioral of seg7 is
begin
	process(score)
	begin
		case score is 
			when 0 => segments <= "1111110";
			when 1 => segments <= "1111110";
			when 2 => segments <= "1111110";
			when 3 => segments <= "1111110";
			when 4 => segments <= "1111110";
			when 5 => segments <= "1111110";
			when 6 => segments <= "1111110";
			when 7 => segments <= "1111110";
			when 8 => segments <= "1111110";
			when 9 => segments <= "1111110";
			when others => segments <= "0000000";
		end case;
	end process;
end behavioral;
			