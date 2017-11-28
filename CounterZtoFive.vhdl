library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity CounterZtoFive is
	port (
		BitCode : out STD_LOGIC_VECTOR (4 downto 0);
		Next_up : out STD_LOGIC;
		CK_in : in STD_LOGIC;
		set : in STD_LOGIC;
		R : in STD_logic
	);
end CounterZtoFive;

architecture Behavioral of CounterZtoFive is

	component T_FlipFlop is
		port (
			Ck : in STD_LOGIC;
			T : in STD_LOGIC;
			Reset : in STD_LOGIC;
			Preset : in STD_LOGIC;
			Q : out STD_LOGIC
		);
	end component;
	signal C, C_inv, D, D_inv, E, E_inv, TD, TC, TB, RS, tempNext : STD_LOGIC;
begin
	BitCode(0) <= E;
	BitCode(1) <= D;
	BitCode(2) <= C;
	BitCode(3) <= '0';
	BitCode(4) <= '0';
	tempNext <= (C and D);
	Next_up <= tempNext;
	RS <= tempNext;

	T_04 : T_FlipFlop
	port map(CK => CK_in, T => '1', Reset => RS, Q => E, Preset => set);
	E_inv <= not E;

	T_03 : T_FlipFlop
	port map(Ck => E_inv, T => '1', Reset => RS, Q => D, Preset => '0');
	D_inv <= not D;

	T_02 : T_FlipFlop
	port map(Ck => D_inv, T => '1', Reset => RS, Q => C, Preset => '0');
	C_inv <= not C;

end Behavioral;
