--Description : This program is an implementation displaying and updating each frame on 16x16 LED.

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity LED_display is 
	port(en, clk, rst : in std_logic;
		 row_data : out std_logic_vector(15 downto 0);
		 col_sel : out std_logic_vector(3 downto 0));
end LED_display;

architecture structural of LED_display is

type matrix_type is array (15 downto 0) of std_logic_vector(15 downto 0);
signal frame : matrix_type;
signal sel : std_logic_vector(3 downto 0);
signal temp : std_logic_vector(15 downto 0);

component pipeGenerator  is
	port(en, clk, rst : in std_logic;
		 row_data : out std_logic_vector(15 downto 0)
		 );
end component;

signal row_data_in : std_logic_vector(15 downto 0);

begin
	u1: pipeGenerator port map(en, clk, rst, row_data_in);
	-- Shift frame
	process(clk, rst)
	begin 
		if rst = '1' then
			frame <= ("0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000",
					  "0000000000000000"
					);
		elsif rising_edge(clk) then
			temp <= frame(15);
			frame(15)<=row_data_in;
			for i in 0 to 13 loop
				frame(i)<= frame(i+1);
			end loop;
			frame(14)<=temp;
		end if;
	end process;
	
	--Select column counter
	process(clk, rst)
	begin 
		if rst = '1' then
			sel<="0000";
		elsif rising_edge(clk) then
			sel <= sel + 1;
			if sel = "1111" then
				sel <= "0000";
			end if;
		end if;
		col_sel <= sel;
	end process;
	--Update frames
	process(sel)
	begin
		case sel is
			when "0000" => row_data <= frame(0); 
			when "0001" => row_data <= frame(1); 
			when "0010" => row_data <= frame(2); 
			when "0011" => row_data <= frame(3); 
			when "0100" => row_data <= frame(4); 
			when "0101" => row_data <= frame(5); 
			when "0110" => row_data <= frame(6); 
			when "0111" => row_data <= frame(7); 
			when "1000" => row_data <= frame(8); 
			when "1001" => row_data <= frame(9); 
			when "1010" => row_data <= frame(10); 
			when "1011" => row_data <= frame(11); 
			when "1100" => row_data <= frame(12); 
			when "1101" => row_data <= frame(13); 
			when "1110" => row_data <= frame(14); 
			when "1111" => row_data <= frame(15); 
			when others => row_data <= "0000000000000000";
		end case;
	end process;
		
end structural;
