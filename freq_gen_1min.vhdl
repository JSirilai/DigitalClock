library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity freq_gen_1min is
	port (
		CLK_in : in STD_LOGIC;
		CLK_out : out STD_LOGIC
	);
end freq_gen_1min;
architecture Behavioral of freq_gen_1min is
	signal temp : STD_LOGIC;
	signal count : integer range 0 to 360000000 - 1;
begin
	CLK_OUT <= temp;
	process (CLK_in) beginlibrary IEEE;
use IEEE.STD_LOGIC_1164.all;

entity freq_gen_1min is
	port (
		CLK_in : in STD_LOGIC;
		CLK_out : out STD_LOGIC
	);
end freq_gen_1min;
architecture Behavioral of freq_gen_1min is
	signal temp : STD_LOGIC;
	signal count : integer range 0 to 360000000 - 1;
begin
	CLK_OUT <= temp;
	process (CLK_in) begin
	if rising_edge(CLK_in) then
		if (count = 360000000 - 1) then
			temp <= not (temp);
			count <= 0;
		else
			count <= count + 1;
		end if;
	end if;
end process;
end Behavioral;
 
	if rising_edge(CLK_in) then
		if (count = 360000000 - 1) then
			temp <= not (temp);
			count <= 0;
		else
			count <= count + 1;
		end if;
	end if;
end process;
end Behavioral;
