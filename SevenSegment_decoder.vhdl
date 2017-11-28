library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity SevenSegment_decoder is
	port (
		N_in : in STD_LOGIC_VECTOR (4 downto 0);
		S_out : out STD_LOGIC_VECTOR (13 downto 0)
	);
end entity sevenSegment_decoder;

architecture Behavioral of SevenSegment_decoder is
	signal temp : STD_LOGIC_VECTOR (13 downto 0);
begin
	S_out <= temp;
	process (N_in) begin
	case N_in is
		when "00000" => temp <= "10000001000000"; --0
		when "00001" => temp <= "10000001111001"; --1
		when "00010" => temp <= "10000000100100"; --2
		when "00011" => temp <= "10000000110000"; --3
		when "00100" => temp <= "10000000011001"; --4
		when "00101" => temp <= "10000000010010"; --5
		when "00110" => temp <= "10000000000010"; --6
		when "00111" => temp <= "10000001111000"; --7
		when "01000" => temp <= "10000000000000"; --8
		when "01001" => temp <= "10000000010000"; --9
		when "01010" => temp <= "11110011000000"; --10
		when "01011" => temp <= "11110011111001"; --11
		when "01100" => temp <= "11110010100100"; --12
		when "01101" => temp <= "11110010110000"; --13
		when "01110" => temp <= "11110010011001"; --14
		when "01111" => temp <= "11110010010010"; --15
		when "10000" => temp <= "11110010000010"; --16
		when "10001" => temp <= "11110011111000"; --17
		when "10010" => temp <= "11110010000000"; --18
		when "10011" => temp <= "11110010010000"; --19
		when "10100" => temp <= "01001001000000"; --20
		when "10101" => temp <= "01001001111001"; --21
		when "10110" => temp <= "01001000100100"; --22
		when "10111" => temp <= "01001000110000"; --23
		when others => temp <= "10000001000000";
	end case;
end process;
end Behavioral;
