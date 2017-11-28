library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity OutputController is
	port (
		ck : in STD_LOGIC;
		output_7_segment : out STD_LOGIC_VECTOR (6 downto 0);
		input_7_segment_0 : in STD_LOGIC_VECTOR (6 downto 0);
		input_7_segment_1 : in STD_LOGIC_VECTOR (6 downto 0);
		input_7_segment_2 : in STD_LOGIC_VECTOR (6 downto 0);
		input_7_segment_3 : in STD_LOGIC_VECTOR (6 downto 0);
		ground : out STD_LOGIC_VECTOR (3 downto 0)
	);
end OutputController;

architecture Behavioral of OutputController is
	component MUX is
		port (
			Selector : in STD_LOGIC_VECTOR (1 downto 0);
			input_MUX_0 : in STD_LOGIC;
			input_MUX_1 : in STD_LOGIC;
			input_MUX_2 : in STD_LOGIC;
			input_MUX_3 : in STD_LOGIC;
			output_MUX : out STD_LOGIC
		);
	end component;
 
	component GroundMUX is
		port (
			Selector : in STD_LOGIC_VECTOR (1 downto 0);
			ground_connect : out STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;
 
	type state is (S0, S1, S2, S3);
	signal present_state, Next_state : state;
	signal select_digit : STD_LOGIC_VECTOR (1 downto 0);
	signal temp0 : STD_LOGIC_VECTOR (3 downto 0);
 
begin
	Ground_Connector : GroundMUX
	port map(Selector => select_digit, ground_connect => ground);
	MUX_0 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(0), input_MUX_1 => input_7_segment_1(0), input_MUX_2 => input_7_segment_2(0), input_MUX_3 => input_7_segment_3(0), output_MUX => output_7_segment(0));
	MUX_1 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(1), input_MUX_1 => input_7_segment_1(1), input_MUX_2 => input_7_segment_2(1), input_MUX_3 => input_7_segment_3(1), output_MUX => output_7_segment(1));
	MUX_2 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(2), input_MUX_1 => input_7_segment_1(2), input_MUX_2 => input_7_segment_2(2), input_MUX_3 => input_7_segment_3(2), output_MUX => output_7_segment(2));
	MUX_3 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(3), input_MUX_1 => input_7_segment_1(3), input_MUX_2 => input_7_segment_2(3), input_MUX_3 => input_7_segment_3(3), output_MUX => output_7_segment(3));
	MUX_4 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(4), input_MUX_1 => input_7_segment_1(4), input_MUX_2 => input_7_segment_2(4), input_MUX_3 => input_7_segment_3(4), output_MUX => output_7_segment(4));
	MUX_5 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(5), input_MUX_1 => input_7_segment_1(5), input_MUX_2 => input_7_segment_2(5), input_MUX_3 => input_7_segment_3(5), output_MUX => output_7_segment(5));
	MUX_6 : MUX
	port map(Selector => select_digit, input_MUX_0 => input_7_segment_0(6), input_MUX_1 => input_7_segment_1(6), input_MUX_2 => input_7_segment_2(6), input_MUX_3 => input_7_segment_3(6), output_MUX => output_7_segment(6));
 
	State_machine : process(present_state) begin
		case present_state is
			when S0 => 
				select_digit <= "00";
				next_state <= S1;
			when S1 => 
				select_digit <= "01";
				next_state <= S2;
			when S2 => 
				select_digit <= "10";
				next_state <= S3;
			when S3 => 
				select_digit <= "11";
				next_state <= S0;
		end case;
	end process state_machine;
	
	SelectDigit : process (Select_digit, ck) begin
		if rising_edge(Ck) then
			present_state <= next_state;
		end if;
	end process SelectDigit;
	
end Behavioral;
