--�M��--
LIBRARY ieee;
USE ieee.std_logic_1164.all;

------------------------------------------------------------

--���[������--
ENTITY full_add IS
PORT ( 
SA,SB,SCin :in bit;
Scout:out bit;
Sum :out bit);
END full_add;

--���[���[�c--
ARCHITECTURE a OF full_add IS
BEGIN
Sum <= SA xor SB xor SCin;
Scout<=(SA and SB) or (SB and SCin) or (SCin and SA);
END a;

-------------------------------------------------------------

--4�줸�[��k������--
ENTITY Q1 IS
PORT ( 
A,B :in bit_vector(3 downto 0);
cin:in bit;
sum:out bit_vector(5 downto 0);
cout:out bit);
END Q1;

--4�줸�[��k���[�c--
ARCHITECTURE a OF Q1 IS

component FULL_ADD
port(
SA,SB,SCin:in bit;
Scout,SUM:out bit);
end component;

signal CARRY:bit_vector(6 downto 0);
signal GND:bit;

BEGIN
GND<='0';
CARRY(0)<=cin;

--���[������l��--
G2:for J in 5 downto 4 generate
FA1:FULL_ADD port map (GND,cin,CARRY(J),CARRY(J+1),SUM(J));
end generate G2;

--���[������l��--
G1:for I in 3 downto 0 generate
FA:FULL_ADD port map (A(I), B(I) xor cin, CARRY(I),CARRY(I+1), SUM(I));
end generate G1;

cout<=CARRY(6);

END a;