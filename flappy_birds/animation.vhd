library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity animation is
    port (
		clk : in std_logic;
        reset : in std_logic;
        done : out std_logic;
        row_data : out std_logic_vector(15 downto 0);
        column_sel : out std_logic_vector(3 downto 0)
    );
end animation;

architecture behavioral of animation is
type matrix_type is array (0 to 15) of std_logic_vector(15 downto 0);
signal LED_matrix : matrix_type := (others => (others => '0'));

    constant bird_shape : matrix_type := (
        "0000000000000000",
        "0000000000000000",
        "0000000011100000",
        "0000000110100000",
        "0000000100100000",
        "0000000101000000",
        "0000000101010000",
        "0000111011111000",
        "0001100000000100",
        "0000111101111100",
        "0000000101000100",
        "0000000101010000",
        "0000000010100000",
        "0000000001110000",
        "0000000000000000",
        "0000000000000000"
    );
signal sel : std_logic_vector(3 downto 0);
begin

	process(clk, reset)
	
	begin 
		if reset = '1' then
		elsif rising_edge(clk) then
			sel <= sel + 1;
			if sel = "1111" then
				sel <= "0000";
			end if;
		end if;
		column_sel <= sel;
	end process;
	
	process(sel)
	begin
		case sel is
			when "0000" => row_data <= bird_shape(0); 
			when "0001" => row_data <= bird_shape(1); 
			when "0010" => row_data <= bird_shape(2); 
			when "0011" => row_data <= bird_shape(3); 
			when "0100" => row_data <= bird_shape(4); 
			when "0101" => row_data <= bird_shape(5); 
			when "0110" => row_data <= bird_shape(6); 
			when "0111" => row_data <= bird_shape(7); 
			when "1000" => row_data <= bird_shape(8); 
			when "1001" => row_data <= bird_shape(9); 
			when "1010" => row_data <= bird_shape(10); 
			when "1011" => row_data <= bird_shape(11); 
			when "1100" => row_data <= bird_shape(12); 
			when "1101" => row_data <= bird_shape(13); 
			when "1110" => row_data <= bird_shape(14); 
			when "1111" => row_data <= bird_shape(15); 
			when others => row_data <= "0000000000000000";
		end case;
	end process;
	

end behavioral;