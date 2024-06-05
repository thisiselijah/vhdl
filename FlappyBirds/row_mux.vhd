library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity row_mux is
    Port ( 
        clk         : in  STD_LOGIC;
        gen_pipe    : in  std_logic_vector(15 downto 0);
        bird_y      : in  INTEGER range 0 to 13;
        game_state  : in  STD_LOGIC_VECTOR(1 downto 0);
        col_select  : out STD_LOGIC_VECTOR(3 downto 0);
        row_out     : out STD_LOGIC_VECTOR(15 downto 0)
    );
end row_mux;

architecture Behavioral of row_mux is
    signal counter : std_logic_vector(3 downto 0) := "0000";
    type matrix_type is array (15 downto 0) of std_logic_vector(15 downto 0);
    signal frame : matrix_type := (
              "1111111111111111", -- row(15)
              "1111111111111111", -- row(14)
              "1111111001111111", -- row(13)
              "1111111001111111", -- row(12)
              "1111111111111111", -- row(11)
              "1111111111111111", -- row(10)
              "1111111111111111", -- row(9)
              "1111111111111111", -- row(8)
              "1111111111111111", -- row(7)
              "1111111111111111", -- row(6)
              "1111111111111111", -- row(5)
              "1111111111111111", -- row(4)
              "1111111111111111", -- row(3)
              "1111111111111111", -- row(2)
              "1111111111111111", -- row(1)
              "1111111111111111"); -- row(0)
    signal en, reset : std_logic := '0';
begin
    
    process(clk, reset)
    begin
        if reset = '1' then 
            counter <= "0000";
        elsif rising_edge(clk) then
            if en = '1' then
                if counter = "1111" then
                    counter <= "0000";
                else
                    counter <= counter + 1;
                end if;
                col_select <= counter;
            end if;
        end if;
    end process;
    
    process(counter)
    begin
        case counter is
            when "0000" => row_out <= frame(15);
            when "0001" => row_out <= frame(14);
            when "0010" => row_out <= frame(13);
            when "0011" => row_out <= frame(12);
            when "0100" => row_out <= frame(11);
            when "0101" => row_out <= frame(10);
            when "0110" => row_out <= frame(9);
            when "0111" => row_out <= frame(8);
            when "1000" => row_out <= frame(7);
            when "1001" => row_out <= frame(6);
            when "1010" => row_out <= frame(5);
            when "1011" => row_out <= frame(4);
            when "1100" => row_out <= frame(3);
            when "1101" => row_out <= frame(2);
            when "1110" => row_out <= frame(1);
            when "1111" => row_out <= frame(0);
            when others => null;
        end case;
    end process;

end Behavioral;
            