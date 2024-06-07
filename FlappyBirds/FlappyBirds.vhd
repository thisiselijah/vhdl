library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FlappyBirds is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           start_button : in STD_LOGIC;
           bird_button : in STD_LOGIC;
           col_select : out STD_LOGIC_VECTOR(3 downto 0);
           row_out : out STD_LOGIC_VECTOR(15 downto 0);
           seg : out STD_LOGIC_VECTOR(7 downto 0); -- Segments for 7-segment display
           sel : out STD_LOGIC_VECTOR(2 downto 0);
           game_state_out : out std_logic_vector(1 downto 0)
           ); -- 3-bit select for common cathode controls
end FlappyBirds;

architecture Behavioral of FlappyBirds is

signal clk_div : STD_LOGIC;
signal bird_pos : INTEGER range 0 to 13;
signal pipe_pos : STD_LOGIC_VECTOR(15 downto 0);
signal collision : STD_LOGIC;
signal game_state : STD_LOGIC_VECTOR(1 downto 0);
signal score : INTEGER range 0 to 99;
signal frame_data : STD_LOGIC_VECTOR(255 downto 0); -- Frame data signal
signal tens_digit : INTEGER range 0 to 9;
signal units_digit : INTEGER range 0 to 9;
signal current_digit : INTEGER range 0 to 1 := 0; -- Current digit being scanned
signal segment_data_tens : STD_LOGIC_VECTOR(7 downto 0); -- Segment data for tens digit
signal segment_data_units : STD_LOGIC_VECTOR(7 downto 0); -- Segment data for units digit

-- Provided frame data
constant frame_example : STD_LOGIC_VECTOR(255 downto 0) := 
	("0000000000000000" &  -- Row 0
	"0000000010000000" &  -- Row 1
	"0000001101100000" &  -- Row 2
	"0000000101000000" &  -- Row 3
	"0010000101000100" &  -- Row 4
	"0011101101011100" &  -- Row 5
	"0010010000100100" &  -- Row 6
	"0010010000100100" &  -- Row 7
	"0001000000001000" &  -- Row 8
	"0000111001110000" &  -- Row 9
	"0000000101000000" &  -- Row 10
	"0000000101000000" &  -- Row 11
	"0000000101000000" &  -- Row 12
	"0000000010000000" &  -- Row 13
	"0000000010000000" &  -- Row 14
	"0000000000000000");   -- Row 15

component clock_divider is 
	Port ( clk          : in STD_LOGIC;
           clk_div : inout STD_LOGIC);
end component;

component pipe_generator is
    Port (clk        : in  STD_LOGIC;
          game_state : in STD_LOGIC_VECTOR(1 downto 0);
          pipe_pos   : out STD_LOGIC_VECTOR(15 downto 0));
end component;

component game_controller is
    Port ( clk          : in STD_LOGIC;
           reset        : in STD_LOGIC;
           start_button : in STD_LOGIC;
           collision    : in STD_LOGIC;
           pipe_pos     : in STD_LOGIC_VECTOR(15 downto 0); 
           game_state   : out STD_LOGIC_VECTOR(1 downto 0);
           score        : out INTEGER range 0 to 99); 
end component;

component row_mux is
    Port (clk         : in  STD_LOGIC;
          gen_pipe    : in  std_logic_vector(15 downto 0);
          bird_y      : in  INTEGER range 0 to 13;
          game_state  : in  STD_LOGIC_VECTOR(1 downto 0);
          col_select  : out STD_LOGIC_VECTOR(3 downto 0);
          row_out     : out STD_LOGIC_VECTOR(15 downto 0);
          collision   : out std_logic
    );
end component;

component bird_control is
    Port ( clk : in STD_LOGIC;
           game_state : in std_logic_vector(1 downto 0);
           button : in STD_LOGIC; -- Input for button press
           bird_pos : out INTEGER range 0 to 14);
end component;



begin

    u1 : clock_divider Port map(clk, clk_div);
    u2 : game_controller Port map(clk, reset, start_button, collision, pipe_pos, game_state, score);
    u3 : pipe_generator Port map(clk_div, game_state, pipe_pos); 
    u4 : row_mux Port map(clk, pipe_pos, bird_pos, game_state, col_select, row_out);  
    u5 : bird_control Port map(clk, game_state, bird_button, bird_pos);    
    -- 0000 0001 0010 0011
    
    game_state_out <= game_state;
               
    
end Behavioral;
