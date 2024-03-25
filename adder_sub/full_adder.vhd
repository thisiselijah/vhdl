-- full adder
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity full_adder is
    port (
        X, Y, Cin : in  std_logic;
        S, Cout : out std_logic
    );
end full_adder;

architecture arch of full_adder is
begin
    S <= (X xor Y) xor Cin;
    Cout <= (X and Y) or ((X xor Y) and Cin);
end arch;