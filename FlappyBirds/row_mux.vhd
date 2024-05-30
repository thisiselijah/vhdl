library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity row_mux is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           bird_y : in INTEGER range 0 to 13;
           pipe_pos : in STD_LOGIC_VECTOR(15 downto 0);
           game_state : in STD_LOGIC_VECTOR(1 downto 0);
           frame_data : in STD_LOGIC_VECTOR(255 downto 0); -- Frame data input
           col_select : out STD_LOGIC_VECTOR(3 downto 0);
           row_out : out STD_LOGIC_VECTOR(15 downto 0));
end row_mux;

architecture Behavioral of row_mux is
    signal row_counter : integer range 0 to 15 := 0;
    signal display_row : STD_LOGIC_VECTOR(15 downto 0);
    signal animation_counter : integer range 0 to 15 := 0;
begin
    process(clk, reset)
    begin
        if reset = '1' then
            row_counter <= 0;
            animation_counter <= 0;
        elsif rising_edge(clk) then
            if row_counter = 15 then
                row_counter <= 0;
                if game_state = "00" or game_state = "11" then
                    animation_counter <= (animation_counter + 1) mod 16;
                end if;
            else
                row_counter <= row_counter + 1;
            end if;
        end if;
    end process;
    
    process(row_counter, bird_y, pipe_pos, game_state, animation_counter, frame_data)
    begin
        case game_state is
            when "00" => -- POWER_ON
                -- Display the provided 16x16 frame in reverse direction (right to left)
                display_row <= not frame_data((row_counter * 16 + 15) downto (row_counter * 16)); -- Invert signal for common-cathode
            when "01" => -- WAIT
                display_row <= (others => '1'); -- Inverted for common-cathode
            when "10" => -- RUNNING
                display_row <= not pipe_pos; -- Inverted for common-cathode
                if (row_counter = bird_y) or (row_counter = bird_y + 1) then
                    display_row(1 downto 0) <= "00"; -- Inverted for common-cathode
                end if;
            when "11" => -- GAME_OVER
                display_row <= (others => '1'); -- Inverted for common-cathode
                if row_counter < 8 then
                    display_row(15 - animation_counter) <= '0'; -- Inverted for common-cathode
                end if;
            when others =>
                display_row <= (others => '1'); -- Inverted for common-cathode
        end case;
    end process;

    col_select <= std_logic_vector(to_unsigned(row_counter, 4));
    row_out <= display_row;
end Behavioral;
