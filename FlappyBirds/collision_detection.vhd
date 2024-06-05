library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity collision_detection is
    Port ( clk : in STD_LOGIC;
           game_state : in std_logic_vector(1 downto 0);
           bird_y : in INTEGER range 0 to 13;
           pipe_pos : in STD_LOGIC_VECTOR(15 downto 0);
           collision : out STD_LOGIC);
end collision_detection;

architecture Behavioral of collision_detection is

signal en, reset : STD_LOGIC;

begin
	process(game_state)
	begin 
		case game_state is
			when "00" => en <= '0';
			when "01" => en <= '1'; reset <= '1';
			when "10" => en <= '1';
			when "11" => en <= '0';
		end case;
	end process;
	
    process(clk, en, reset)
    begin
        if reset = '1' then
            collision <= '0';
        elsif en = '1' then
			if rising_edge(clk) then
				if (pipe_pos(bird_y) = '0') or (pipe_pos(bird_y + 1) = '0') then
					collision <= '1';
				else
					collision <= '0';
				end if;
			end if;
        end if;
    end process;
end Behavioral;
