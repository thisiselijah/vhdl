library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Q2 is port(
reset,clk,start,din:in std_logic;
count_out,dout_valid,dout:out std_logic;
count_one:out std_logic_vector(3 downto 0)
);end Q2;

architecture a of Q2 is

signal state:std_logic_vector(2 downto 0);
signal reg:std_logic_vector(7 downto 0);
signal count:std_logic_vector(2 downto 0);
signal counter1:std_logic_vector(3 downto 0);

begin 

	process(reset,clk)
	begin 
	if reset = '1' then
		state<="000";
		reg<="00000000";
		count<="000";
		counter1<="0000";
		count_out<='0';
		dout_valid<='0';
		dout<='0';
		count_one<="0000";
		
	elsif clk'event and clk = '1' then
	case state is
	
		when "000"=>
			if start = '1' then
				state <= "001";
			end if;
			
		when "001"=>
			count<=count+1;
			reg<=din & reg(7 downto 1);
			if din = '1' then counter1 <= counter1 + 1; end if;
			if count = "111" then count <="000"; state <= "010"; end if;
			
		when "010"=>
			count_one <= counter1;
			count_out <= '1';
			state <= "011";
			
		when "011"=>
			dout_valid <= '1';
			count_out <= '0';
			count<=count+1;
			dout <= reg(7);
			reg <= reg(6 downto 0)&'0';
			if count = "111" then count <="000"; state <= "100"; end if;
			
		when "100"=>
			dout_valid <= '0';
			state <= "000";
		when others=>
		
	end case;
	end if;
	end process;
end a;