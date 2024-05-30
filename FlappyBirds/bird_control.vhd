library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bird_control is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           button : in STD_LOGIC; -- Input for button press
           bird_pos : out INTEGER range 0 to 13);
end bird_control;

architecture Behavioral of bird_control is
    signal bird_y : INTEGER range 0 to 13 := 7; -- Initial position
begin
    process(clk, reset)
    begin
        if reset = '1' then
            bird_y <= 7;
        elsif rising_edge(clk) then
            if button = '1' then
                -- Move bird up
                if bird_y > 0 then
                    bird_y <= bird_y - 1;
                end if;
            else
                -- Gravity effect: bird moves down
                if bird_y < 13 then
                    bird_y <= bird_y + 1;
                end if;
            end if;
        end if;
    end process;
    
    bird_pos <= bird_y;
end Behavioral;
