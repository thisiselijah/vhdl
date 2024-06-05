library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity main is 
    port(clk : in std_logic;
         game_state : in std_logic_vector(1 downto 0);
         pipe_pos : out std_logic_vector(15 downto 0));
end main;

architecture structural of main is 

component pipe_generator is
    Port (clk      : in  STD_LOGIC;
		  game_state : in STD_LOGIC_VECTOR(1 downto 0);
		  pipe_pos : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component clock_divider is
    Port ( clk : in STD_LOGIC;
           game_state : in STD_LOGIC_VECTOR(1 downto 0);
           clk_div : inout STD_LOGIC);
end component;

signal clk_div : std_logic;

begin
	u0 : clock_divider port map(clk, game_state, clk_div);
	u1 : pipe_generator port map(clk, game_state, pipe_pos);
end structural;