library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity pipe_generator is
    Port (
        clk      : in  STD_LOGIC;
        game_state : in STD_LOGIC_VECTOR(1 downto 0);
        pipe_pos : out STD_LOGIC_VECTOR(15 downto 0)
    );
end pipe_generator;

architecture Behavioral of pipe_generator is
    signal pipe_x     : INTEGER range 0 to 15 := 15;
    signal pipe_gap_y : INTEGER range 0 to 12 := 6; -- Initial gap position
    signal pipes      : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
    signal slow_clk   : STD_LOGIC;
    
    
begin
    -- Pipe position and gap update process
    process(clk, game_state)
    begin
        if reset = '1' then
            pipe_x <= 15;
            pipe_gap_y <= 6;
        elsif rising_edge(slow_clk) then
            if pipe_x = 0 then
                pipe_x <= 15;
                -- Randomize gap position (this is a simplified example)
                pipe_gap_y <= (pipe_gap_y + 3) mod 13; -- Simple example for new gap position
            else
                pipe_x <= pipe_x - 1;
            end if;
        end if;
    end process;

    -- Create pipes with a gap
    process(pipe_x, pipe_gap_y)
    begin
        pipes <= (others => '1');
        for i in 0 to 3 loop
            pipes((pipe_gap_y + i)) <= '0';
        end loop;
    end process;
    
    pipe_pos <= pipes;
end Behavioral;