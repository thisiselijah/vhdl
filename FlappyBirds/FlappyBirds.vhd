library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlappyBirds is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start_button : in STD_LOGIC;
           bird_button : in STD_LOGIC;
           col_select : out STD_LOGIC_VECTOR(3 downto 0);
           row_out : out STD_LOGIC_VECTOR(15 downto 0);
           seg : out STD_LOGIC_VECTOR(7 downto 0); -- Segments for 7-segment display
           sel : out STD_LOGIC_VECTOR(2 downto 0)); -- 3-bit select for common cathode controls
end FlappyBirds;

architecture Behavioral of FlappyBirds is
    signal clk_div : STD_LOGIC;
    signal bird_pos : INTEGER range 0 to 13;
    signal pipe_pos : STD_LOGIC_VECTOR(15 downto 0);
    signal collision : STD_LOGIC;
    signal game_state : STD_LOGIC_VECTOR(1 downto 0);
    signal score : INTEGER range 0 to 99;
    signal frame_data : STD_LOGIC_VECTOR(255 downto 0); -- Frame data signal
    signal tens_digit : INTEGER range 0 to 9;
    signal units_digit : INTEGER range 0 to 9;
    signal current_digit : INTEGER range 0 to 1 := 0; -- Current digit being scanned
    signal segment_data_tens : STD_LOGIC_VECTOR(7 downto 0); -- Segment data for tens digit
    signal segment_data_units : STD_LOGIC_VECTOR(7 downto 0); -- Segment data for units digit

    -- Provided frame data
    constant frame_example : STD_LOGIC_VECTOR(255 downto 0) := 
    "0000000000000000" &  -- Row 0
    "0000000010000000" &  -- Row 1
    "0000001101100000" &  -- Row 2
    "0000000101000000" &  -- Row 3
    "0010000101000100" &  -- Row 4
    "0011101101011100" &  -- Row 5
    "0010010000100100" &  -- Row 6
    "0010010000100100" &  -- Row 7
    "0001000000001000" &  -- Row 8
    "0000111001110000" &  -- Row 9
    "0000000101000000" &  -- Row 10
    "0000000101000000" &  -- Row 11
    "0000000101000000" &  -- Row 12
    "0000000010000000" &  -- Row 13
    "0000000010000000" &  -- Row 14
    "0000000000000000";   -- Row 15

begin
    frame_data <= frame_example; -- Assign the example frame to the frame_data signal

    tens_digit <= score / 10;
    units_digit <= score mod 10;

    clock_divider_inst : entity work.clock_divider
        Port map ( clk => clk,
                   reset => reset,
                   clk_div => clk_div);

    bird_control_inst : entity work.bird_control
        Port map ( clk => clk_div,
                   reset => reset,
                   button => bird_button,  -- Connect bird control button
                   bird_pos => bird_pos);

    pipe_generator_inst : entity work.pipe_generator
        Port map ( clk => clk,
                   reset => reset,
                   clk_div => clk_div,
                   pipe_pos => pipe_pos);

    collision_detection_inst : entity work.collision_detection
        Port map ( clk => clk,
                   reset => reset,
                   bird_y => bird_pos,
                   pipe_pos => pipe_pos,
                   collision => collision);

    game_controller_inst : entity work.game_controller
        Port map ( clk => clk,
                   reset => reset,
                   start_button => start_button,
                   collision => collision,
                   bird_x_pos => 2, -- Fixed x position for the bird
                   pipe_pos => pipe_pos,
                   game_state => game_state,
                   score => score);

    row_mux_inst : entity work.row_mux
        Port map ( clk => clk,
                   reset => reset,
                   bird_y => bird_pos,
                   pipe_pos => pipe_pos,
                   game_state => game_state,
                   frame_data => frame_data, -- Connect frame data
                   col_select => col_select,
                   row_out => row_out);

    -- 7-segment display logic
    process(clk)
    begin
        if rising_edge(clk) then
            current_digit <= (current_digit + 1) mod 2; -- Cycle through the leftmost two digits
        end if;
    end process;

    process(current_digit, segment_data_tens, segment_data_units)
    begin
        case current_digit is
            when 0 => -- Display tens digit
                seg <= segment_data_tens;
                sel <= "000"; -- Select leftmost digit
            when 1 => -- Display units digit
                seg <= segment_data_units;
                sel <= "001"; -- Select second leftmost digit
            when others =>
                seg <= "11111111"; -- All segments off
        end case;
    end process;

    -- Seven segment decoders
    seg1_inst : entity work.seven_segment_decoder
        Port map ( digit => tens_digit,
                   segments => segment_data_tens);

    seg2_inst : entity work.seven_segment_decoder
        Port map ( digit => units_digit,
                   segments => segment_data_units);
end Behavioral;
