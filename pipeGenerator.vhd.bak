--
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity pipeGenerator is 
	port(en, clk, rst : in std_logic;
		 row_data : out std_logic_vector(15 downto 0)
		 );
end pipeGenerator;

architecture structural of pipeGenerator is

signal lfsr : std_logic_vector(3 downto 0) := "0001"; 
signal random_num : std_logic_vector(3 downto 0);
signal pipes : std_logic_vector(15 downto 0);

begin
	--Use LFSR to generate fake random number
	process(clk, rst)
	begin
		if rst = '1' then
			lfsr <= "0001"; 
		elsif rising_edge(clk) then
			lfsr <= lfsr(2 downto 0) & (lfsr(3) xor lfsr(2));
		end if;
		end process;

		random_num <= lfsr when lfsr <= "1100" else "0000";
	--Generator pipes.
	process(random_num)
	begin
		pipes <= (others => '1'); 

		case random_num is
			when "0000" => pipes(3 downto 0) <= (others => '0'); 
			when "0001" => pipes(4 downto 1) <= (others => '0'); 
			when "0010" => pipes(5 downto 2) <= (others => '0');
			when "0011" => pipes(6 downto 3) <= (others => '0'); 
			when "0100" => pipes(7 downto 4) <= (others => '0');
			when "0101" => pipes(8 downto 5) <= (others => '0'); 
			when "0110" => pipes(9 downto 6) <= (others => '0'); 
			when "0111" => pipes(10 downto 7) <= (others => '0');
			when "1000" => pipes(11 downto 8) <= (others => '0'); 
			when "1001" => pipes(12 downto 9) <= (others => '0'); 
			when "1010" => pipes(13 downto 10) <= (others => '0'); 
			when "1011" => pipes(14 downto 11) <= (others => '0'); 
			when "1100" => pipes(15 downto 12) <= (others => '0'); 
			when others => pipes <= (others => '0');
		end case;
	end process;
	
	row_data <= pipes;
	
end structural;
