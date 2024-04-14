library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity Carry_Look_Ahead is
	port (A : in STD_LOGIC_VECTOR (3 downto 0);
		  B : in STD_LOGIC_VECTOR (3 downto 0);
		  cin : in STD_LOGIC;
		  sum : out STD_LOGIC_VECTOR (3 downto 0);
		  cout : out STD_LOGIC);
end Carry_Look_Ahead;
architecture structural of Carry_Look_Ahead is
component Partial_Full_Adder
port (A : in STD_LOGIC;
	  B : in STD_LOGIC;
	  cin : in STD_LOGIC;
	  sum : out STD_LOGIC;
	  G : out STD_LOGIC;
	  P : out STD_LOGIC
	  );
end component;
component Carry_lookahead_Generator
	port(G, P : in std_logic;
		  cin : in std_logic;
		 cout : out std_logic
		);
end component;
signal c0,c1,c2: STD_LOGIC;
signal P,G: STD_LOGIC_VECTOR(3 downto 0);
begin
PFA0: Partial_Full_Adder port map( A(0), B(0), cin, sum(0), G(0), P(0));
PFA1: Partial_Full_Adder port map( A(1), B(1), c0, sum(1), G(1), P(1));
PFA2: Partial_Full_Adder port map( A(2), B(2), c1, sum(2), G(2), P(2));
PFA3: Partial_Full_Adder port map( A(3), B(3), c2, sum(3), G(3), P(3));

CG0: Carry_lookahead_Generator port map(G(0), P(0), cin, c0);
CG1: Carry_lookahead_Generator port map(G(1), P(1), c0, c1);
CG2: Carry_lookahead_Generator port map(G(2), P(2), c1, c2);
CG3: Carry_lookahead_Generator port map(G(3), P(3), c2, cout);
end structural;