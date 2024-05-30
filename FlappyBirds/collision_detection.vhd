library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity collision_detection is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           bird_y : in INTEGER range 0 to 13;
           pipe_pos : in STD_LOGIC_VECTOR(15 downto 0);
           collision : out STD_LOGIC);
end collision_detection;

architecture Behavioral of collision_detection is
begin
    process(clk, reset)
    begin
        if reset = '1' then
            collision <= '0';
        elsif rising_edge(clk) then
            if (pipe_pos(bird_y) = '0') or (pipe_pos(bird_y + 1) = '0') then
                collision <= '1';
            else
                collision <= '0';
            end if;
        end if;
    end process;
end Behavioral;
