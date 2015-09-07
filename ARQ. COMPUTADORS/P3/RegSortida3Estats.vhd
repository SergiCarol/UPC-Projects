library ieee;								--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RegSortida3Estats is 
	Port ( 
		Reset : in STD_LOGIC; 
		clk : in STD_LOGIC; 
		WE : in STD_LOGIC; 			--Senyal d'habilitacio d'escriptura.
		Din : in STD_LOGIC_VECTOR (31 downto 0); 
		E1 : in STD_LOGIC; 
		E2 : in STD_LOGIC; 
		Dout1 : out STD_LOGIC_VECTOR (31 downto 0);  --Bus del cami de dades anomenat sor1.
		Dout2 : out STD_LOGIC_VECTOR (31 downto 0)); --Bus del cami de dades anomenat sor2.
end RegSortida3Estats; 
 
architecture Behavioral of RegSortida3Estats is 
	--Cridem els components dels altres arxius.
	component Registre is 
		Port ( 
			Reset : in STD_LOGIC; 
			clk : in STD_LOGIC; 
			Enable : in STD_LOGIC; 
			Din : in STD_LOGIC_VECTOR (31 downto 0); 
			Dout : out STD_LOGIC_VECTOR (31 downto 0)); 
end component;
	--Creem una senyal de sortida per modificar els valors.
	signal SortidReg : STD_LOGIC_VECTOR (31 downto 0);

	begin 
	--Associem els diferents senyals de l'arxiu Registre amb aquets.
	reg : Registre port map(
		Reset => Reset,
		clk => clk,
		enable =>WE,
		Din => Din,
		Dout => SortidReg);
	--Indiquem valor sortida segons E1 i E2.	
	Dout1 <= SortidReg when E1='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	Dout2 <= SortidReg when E2='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end Behavioral;