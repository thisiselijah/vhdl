library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity row_mux is
    Port ( clk : in STD_LOGIC;
           bird_y : in INTEGER range 0 to 13;
           pipe_pos : in STD_LOGIC_VECTOR(15 downto 0);
           game_state : in STD_LOGIC_VECTOR(1 downto 0);
           col_select : out STD_LOGIC_VECTOR(3 downto 0);
           row_out : out STD_LOGIC_VECTOR(15 downto 0));
end row_mux;

architecture Behavioral of row_mux is
    signal counter : std_logic_vector(3 downto 0);
    type matrix_type is array (15 downto 0) of std_logic_vector(15 downto 0);
    signal frame : matrix_type;
    signal display_row : STD_LOGIC_VECTOR(15 downto 0);
begin
    process(clk)
    begin
        
    end process;
    
    process(game_state)
    begin
        if game_state = "01" then 
			frame <= ("0000000000000000",
					  "0000000000000000",
					  "");
        end case;
    end process;
    
    process(clk, counter)
    begin
		if counter = "1111" then
			counter <= "0000";
		elsif rising_edge(clk) then 
			counter <= counter + 1;
    end process;
    

end Behavioral;