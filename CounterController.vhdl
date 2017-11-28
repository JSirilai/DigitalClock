library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CounterController is
	port (
		AccuSignal : in STD_LOGIC;
		H_digit : out STD_LOGIC_VECTOR (4 downto 0);
		M1_digit : out STD_LOGIC_VECTOR (4 downto 0);
		M2_digit : out STD_LOGIC_VECTOR (4 downto 0);
		Reset : in STD_LOGIC;
		Set_M : in STD_LOGIC;
		Set_H : in STD_LOGIC
	);
end CounterController;

architecture Behavioral of CounterController is

	component CounterZtoTwefour is
		port (
			BitCode : out STD_LOGIC_VECTOR (4 downto 0);
			Next_up : out STD_LOGIC;
			CK_in : in STD_LOGIC;
			set : in STD_LOGIC;
			R : in STD_LOGIC
		);
	end component;

	component CounterZtoNine is
		port (
			BitCode : out STD_LOGIC_VECTOR (4 downto 0);
			Next_up : out STD_LOGIC;
			set : in STD_LOGIC;
			CK_in : in STD_LOGIC;
			R : in STD_LOGIC
		);
	end component;

	component CounterZtoFive is
		port (
			BitCode : out STD_LOGIC_VECTOR (4 downto 0);
			Next_up : out STD_LOGIC;
			CK_in : in STD_LOGIC;
			set : in STD_LOGIC;
			R : in STD_LOGIC
		);
	end component;

	signal Temp1, temp2, temp3, temp4 : STD_LOGIC;

begin
	forthDigit : CounterZtoNine		-- 4th digit
	port map(BitCode => M2_digit, CK_in => AccuSignal, Set => Set_M, Next_up => temp1, R => Reset);
	thirdDigit : CounterZtoFive		--3rd digit
	port map(BitCode => M1_digit, Next_up => temp2, CK_in => temp1, Set => '0', R => Reset);
	firstAndsecondDigit : CounterZtoTwefour	--1st and 2nd digit
	port map(BitCode => H_digit, Next_up => temp3, CK_in => temp2, Set => Set_H, R => Reset);

end Behavioral;
