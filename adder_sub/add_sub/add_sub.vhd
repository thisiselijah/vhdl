library ieee;
use ieee.std_logic_1164.all;
entity adder_subtractor_4bit is
	port(op : in std_logic; -- 0 is addition / 1 is subtraction
		 A, B : in std_logic_vector(3 downto 0);
		 Result : out std_logic_vector(3 downto 0);
		 Cout, out std_logic);
end adder_subtractor_4bit;
architecture arch of adder_subtractor_4bit is
    component full_adder is
        port(X, Y, Cin : in std_logic;
             S, Cout : out std_logic);
    end component;
    signal C1, C2, C3, C4: std_logic;
    signal temp: std_logic_vector(3 downto 0);
    ----------
    begin

    PROCESS(op)
    begin
        IF op THEN
            temp <= A xor B;
            FA0: full_adder port map(A(0), temp(0), 0, Result(0), C1);
            FA1: full_adder port map(A(1), temp(1), C1, Result(1), C2);
            FA2: full_adder port map(A(2), temp(2), C2, Result(2), C3);
            FA3: full_adder port map(A(3), temp(3), C3, Result(3), C4);
            Cout <= C4;
        ELSE
            B <= not B + "0001";
            temp <= A xor B;
            FA0: full_adder port map(A(0), temp(0), 0, Result(0), C1);
            FA1: full_adder port map(A(1), temp(1), C1, Result(1), C2);
            FA2: full_adder port map(A(2), temp(2), C2, Result(2), C3);
            FA3: full_adder port map(A(3), temp(3), C3, Result(3), C4);
            Cout <= C4;

        end IF;
        
    end PROCESS;
     
    
    end arch;