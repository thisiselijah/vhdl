library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider is
    Port ( clk : in STD_LOGIC;
           game_state : in STD_LOGIC_VECTOR(1 downto 0);
           clk_div : inout STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
    signal counter : integer := 0;
begin
    process(clk, game_state)
    begin
        if reset = '1' then
            counter <= 0;
            clk_div <= '0';
        elsif rising_edge(clk) then
            if counter = 49999999 then
                counter <= 0;
                clk_div <= not clk_div;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
