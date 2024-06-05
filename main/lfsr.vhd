library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity lfsr is
    Port ( clk   : in  STD_LOGIC;
           rst   : in  STD_LOGIC;
           enable: in  STD_LOGIC;
           rnd   : out STD_LOGIC_VECTOR(15 downto 0)); -- 16-bit random number
end lfsr;

architecture Behavioral of lfsr is
    signal lfsr_reg : STD_LOGIC_VECTOR(15 downto 0) := "1001100110011001"; -- Initial seed
    signal feedback : STD_LOGIC;
begin
    process(clk, rst)
    begin
        if rst = '1' then
            lfsr_reg <= "1001100110011001"; -- Reset to initial seed
        elsif rising_edge(clk) then
            if enable = '1' then
                feedback <= lfsr_reg(15) xor lfsr_reg(14) xor lfsr_reg(12) xor lfsr_reg(3);
                lfsr_reg <= lfsr_reg(14 downto 0) & feedback;
            end if;
        end if;
    end process;

    rnd <= lfsr_reg;
end Behavioral;
