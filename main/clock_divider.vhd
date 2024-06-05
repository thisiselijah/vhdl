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
    signal reset : std_logic;
    signal counter : integer := 0;
begin
	
	reset <= '1' when game_state = "01" else '0';
	
    process(clk, reset)
    begin
        if reset = '1' then
            counter <= 0;
            clk_div <= '0';
        elsif rising_edge(clk) then
            if counter = 10 then
                counter <= 0;
                clk_div <= not clk_div;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
