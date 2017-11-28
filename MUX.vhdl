library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity MUX is
	port (
		Selector : in STD_LOGIC_VECTOR (1 downto 0);
		input_MUX_0 : in STD_LOGIC;
		input_MUX_1 : in STD_LOGIC;
		input_MUX_2 : in STD_LOGIC;
		input_MUX_3 : in STD_LOGIC;
		output_MUX : out STD_LOGIC
	);
end MUX;

architecture Behavioral of MUX is

begin
	process (Selector, input_MUX_0, input_MUX_1, input_MUX_2, input_MUX_3) begin
	case Selector is
		when "00" => output_MUX <= input_MUX_0;		-- first loop active
		when "01" => output_MUX <= input_MUX_1;		-- second loop active
		when "10" => output_MUX <= input_MUX_2;		-- third loop active
		when "11" => output_MUX <= input_MUX_3;		-- forth loop active
		when others => output_MUX <= '1';
	end case;
end process;
end Behavioral;
