library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_unsigned.all;

entity game is
	port(clk, reset, start : in std_logic;
		 led_matrix        : out std_logic_vector(15 downto 0);
		 score : out INTEGER);
end game;
architectire behavioral of game is 
signal bird_position : INTEGER := 8;
signal pipe_position : INTERGER := 15;
signal game_running : BOOLEAN := FALSE;
begin 
	process(clk, reset)
	begin 
		if reset = '1' then 
			bird_position <= 8;
			pipe_position <= 15;
			game_running <= FALSE;
		elsif rising_edge(clk) then 
			if start = '1' then
				game_running <= TRUE;
			end if;
			if game_running then
			
			end if;
		end if;
	end process;
	led_matrix <= (others => '0');
end behavioral;