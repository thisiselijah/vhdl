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
            when 0 => segments <= "00111111"; -- 0
            when 1 => segments <= "00000110"; -- 1
            when 2 => segments <= "01011011"; -- 2
            when 3 => segments <= "01001111"; -- 3
            when 4 => segments <= "01100110"; -- 4
            when 5 => segments <= "01101101"; -- 5
            when 6 => segments <= "01111101"; -- 6
            when 7 => segments <= "00000111"; -- 7
            when 8 => segments <= "01111111"; -- 8
            when 9 => segments <= "01101111"; -- 9
            when others => segments <= "00000000"; -- All segments off
        end case;
    end process;
end Behavioral;
