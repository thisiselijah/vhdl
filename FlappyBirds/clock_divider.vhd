library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity clock_divider is
    Port ( clk : in STD_LOGIC;
           clk_div : inout STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
    signal en : std_logic;
    signal counter : integer := 0;
begin
	
    process(clk)
    begin
        if rising_edge(clk) then
            if counter = 1999 then
                counter <= 0;
                clk_div <= not clk_div;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
end Behavioral;
