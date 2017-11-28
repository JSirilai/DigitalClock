library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Digital_CLK is
	port (
		button : in STD_LOGIC_VECTOR (2 downto 0);
		CLK : in STD_LOGIC;
		SemiColon_signal : out STD_LOGIC;
		SevenSegment_out : out STD_LOGIC_VECTOR (6 downto 0);
		Ground_pin_in : out STD_LOGIC_VECTOR (3 downto 0)
	);
end Digital_CLK;

architecture Behavioral of Digital_CLK is

	component freq_gen_1min is
		port (
			CLK_in : in STD_LOGIC;
			CLK_out : out STD_LOGIC
		);
	end component;
	component freq_gen_1kHZ is
		port (
			CLK_in : in STD_LOGIC;
			CLK_out : out STD_LOGIC
		);
	end component;
	component freq_gen_1HZ is
		port (
			CLK_in : in STD_LOGIC;
			CLK_out : out STD_LOGIC
		);
	end component;

	component SevenSegment_decoder is
		port (
			N_in : in STD_LOGIC_VECTOR (4 downto 0);
			S_out : out STD_LOGIC_VECTOR (13 downto 0)
		);
	end component;

	component CounterController is
		port (
			AccuSignal : in STD_LOGIC;
			H_digit : out STD_LOGIC_VECTOR (4 downto 0);
			M1_digit : out STD_LOGIC_VECTOR (4 downto 0);
			M2_digit : out STD_LOGIC_VECTOR (4 downto 0);
			Reset : in STD_LOGIC;
			Set_M : in STD_LOGIC;
			Set_H : in STD_LOGIC
		);
	end component;

	component OutputController is
		port (
			Ck : in STD_LOGIC;
			output_7_segment : out STD_LOGIC_VECTOR (6 downto 0);
			input_7_segment_0 : in STD_LOGIC_VECTOR (6 downto 0);
			input_7_segment_1 : in STD_LOGIC_VECTOR (6 downto 0);
			input_7_segment_2 : in STD_LOGIC_VECTOR (6 downto 0);
			input_7_segment_3 : in STD_LOGIC_VECTOR (6 downto 0);
			ground : out STD_LOGIC_VECTOR (3 downto 0)
		);
	end component;

	signal Clk_f, Ck_frame, Ck_minute : STD_LOGIC;
	signal H_digit1, M_digit1, M_digit2 : STD_LOGIC_VECTOR (4 downto 0);
	signal SevenSegment_out_1, SevenSegment_out_2, SevenSegment_out_3 : STD_LOGIC_VECTOR (13 downto 0);
	signal output : STD_LOGIC_VECTOR (6 downto 0);
	signal count : integer range 0 to 60;
begin
	-- Clock signal generator
	CLOCK_Signal_1sec : freq_gen_1HZ
	port map(CLK_in => CLK, CLK_out => Clk_f);

	FrameRate : freq_gen_1kHZ
	port map(CLK_in => CLK, CLK_out => Ck_frame);
 
	minuteControl : freq_gen_1min
	port map(CLK_in => CLK, CLK_out => Ck_minute);
 
	ClockControl : CounterController
	port map(AccuSignal => Ck_minute, H_digit => H_digit1, M1_digit => M_digit1, M2_digit => M_digit2, Reset => button(0), Set_H => button(1), Set_M => button(2));

	-- 7 Segment decoder
	FirstAndSecondDigit : SevenSegment_decoder
	port map(N_in => H_digit1, S_out => SevenSegment_out_3);
	ThirdDigit : SevenSegment_decoder
	port map(N_in => M_digit1, S_out => SevenSegment_out_2);
	ForthDigit : SevenSegment_decoder
	port map(N_in => M_digit2, S_out => SevenSegment_out_1);
	OutputControl : OutputController -- Forth Third Second First
	port map(Ck => Ck_frame, output_7_segment => output, input_7_segment_0 => SevenSegment_out_1 (6 downto 0), input_7_segment_1 => SevenSegment_out_2 (6 downto 0), input_7_segment_2 => SevenSegment_out_3 (6 downto 0), input_7_segment_3 => SevenSegment_out_3 (13 downto 7), Ground => Ground_pin_in);
 
	ClockChecker : process (Clk_f, output) begin
		SemiColon_signal <= Clk_f;
		SevenSegment_out <= output;
	end process ClockChecker;

end Behavioral;
