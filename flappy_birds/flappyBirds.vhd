library ieee;
use ieee.std_logic_1164.all;

entity flappyBirds is 
	port(clk, reset, start : in std_logic;
		 led_matrix        : out std_logic_vector(15 downto 0);
		 segments          : out std_logic_vector(6 downto 0));
end flappyBirds;

architecture behavioral of flappyBirds is


begin 

end behavioral;











