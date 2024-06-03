library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment_decoder is
    Port ( digit : in INTEGER range 0 to 9;
           segments : out STD_LOGIC_VECTOR(7 downto 0)); -- 8 bits for segments (including dp)
end seven_segment_decoder;

architecture Behavioral of seven_segment_decoder is
begin
    process(digit)
    begin
        case digit is
            when 0 => segments <= "11000000"; -- 0
            when 1 => segments <= "11111001"; -- 1
            when 2 => segments <= "10100100"; -- 2
            when 3 => segments <= "10110000"; -- 3
            when 4 => segments <= "10011001"; -- 4
            when 5 => segments <= "10010010"; -- 5
            when 6 => segments <= "10000010"; -- 6
            when 7 => segments <= "11111000"; -- 7
            when 8 => segments <= "10000000"; -- 8
            when 9 => segments <= "10010000"; -- 9
            when others => segments <= "11111111"; -- All segments off
        end case;
    end process;
end Behavioral;
