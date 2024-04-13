library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
entity bcdcounter2bit is 
	port(clk: in std_logic;
		 rst: in std_logic;
		 qout_one, qout_ten: buffer std_logic_vector(3 downto 0)
		);
end bcdcounter2bit;
architecture bahavioral of bcdcounter2bit is
begin
process(clk, rst)
begin
if rst='1' then 
qout_one<="0000";
qout_ten<="0000";
else
	if rising_edge(clk) then
	if qout_one>=9 then
		qout_one<="0000";
		if qout_ten>=9 then 
		qout_ten<="0000";
		else qout_ten<=qout_ten+1;
		end if;
	else qout_one<=qout_one+1;
		end if;
	end if;
end if;

end process;
end bahavioral;
