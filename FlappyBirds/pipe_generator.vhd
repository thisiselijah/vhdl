library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; -- Use numeric_std for arithmetic operations

entity pipe_generator is
    Port(clk        : in  STD_LOGIC;
         game_state : in  STD_LOGIC_VECTOR(1 downto 0);
         pipe_pos   : out STD_LOGIC_VECTOR(15 downto 0));
end pipe_generator;

architecture Behavioral of pipe_generator is
    constant GAP_SIZE : INTEGER := 4; -- Gap size of 4 pixels
    signal pipe_x     : INTEGER range 0 to 15 := 15;
    signal pipe_gap_y : INTEGER range 0 to 11; -- Adjusted range for gap position
    signal pipes      : STD_LOGIC_VECTOR(15 downto 0) := (others => '1');
    signal en         : std_logic;
    signal rnd        : STD_LOGIC_VECTOR(15 downto 0); -- 16-bit random number signal

    component lfsr is
        Port ( clk    : in  STD_LOGIC;
               rst    : in  STD_LOGIC;
               enable : in  STD_LOGIC;
               rnd    : out STD_LOGIC_VECTOR(15 downto 0)); -- 16-bit random number
    end component;
    
begin
    -- Instantiate LFSR
    lfsr_inst : lfsr Port map (clk    => clk, rst    => '0', enable => '1', rnd    => rnd);

    -- Process for controlling enable and reset signals based on game_state
    en <= '1' when game_state = "10" else '0';

    -- Pipe position and gap update process
    process(clk)
    begin
        if rising_edge(clk) then 
            if en = '1' then
                if pipe_x = 0 then
                    pipe_x <= 15; -- Reset pipe_x to start position
                    pipe_gap_y <= to_integer(unsigned(rnd(7 downto 0))) mod (12 - GAP_SIZE + 1); -- Ensure gap position within range
                else
                    pipe_x <= pipe_x - 1;
                end if;
            end if;
        end if;
    end process;

    -- Update pipe_pos output
    process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                -- Initialize pipes with all ones (indicating full pipe)
                pipes <= (others => '0');
                -- Insert gap of 4 pixels
                for i in 0 to GAP_SIZE - 1 loop
                    pipes(pipe_gap_y + i) <= '1';
                end loop;
                pipe_pos <= pipes;
            end if;
        end if;
    end process;
    
end Behavioral;
