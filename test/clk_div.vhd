library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
entity clk_div is
	generic(divisor : integer:=230400);
	port(clk_in : in std_logic;
		 clk_out1Hz : buffer std_logic;
		 clk_out2Hz : buffer std_logic;
		 clk_out4Hz : buffer std_logic;
		 clk_out8Hz : buffer std_logic
	);
end clk_div;
architecture behavioral of clk_div is
signal cnt2 : std_logic;
begin
process(clk_in)
variable cnt1, divisor2 : integer range 0 to divisor;
begin
	divisor2:=divisor/2;
if rising_edge(clk_in) then
	if cnt1=divisor then
		cnt1:=1;
	else cnt1:=cnt1+1;
	end if;
end if;

if rising_edge(clk_in) then
	if cnt1=divisor or cnt1=divisor2 then
		cnt2<=not cnt2;
	end if;
end if;
clk_out8Hz<=cnt2;
end process;

process(clk_out8Hz)
begin
if rising_edge(clk_out8Hz) then
	clk_out4Hz<=not clk_out4Hz;
end if;
end process;

process(clk_out4Hz)
begin
if rising_edge(clk_out4Hz) then
	clk_out2Hz<=not clk_out2Hz;
end if;
end process;

process(clk_out2Hz)
begin
if rising_edge(clk_out2Hz) then
	clk_out1Hz<=not clk_out1Hz;
end if;
end process;
end behavioral;








