library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity T_FlipFlop is
	port (
		Ck : in STD_LOGIC;
		T : in STD_LOGIC;
		Reset : in STD_LOGIC;
		Preset : in STD_LOGIC;
		R_button : in STD_LOGIC;
		Q : out STD_LOGIC
	);
end T_FlipFlop;

architecture Behavioral of T_FlipFlop is

	signal temp : STD_LOGIC;

begin
	process (Ck, Reset, Preset) begin
	if R_button = '0' then
		temp <= '0';
	elsif Reset = '1' then
		temp <= '0';
	elsif rising_edge(Ck) then
		temp <= T xor temp;
	end if;
end process;
Q <= temp;
end Behavioral;
