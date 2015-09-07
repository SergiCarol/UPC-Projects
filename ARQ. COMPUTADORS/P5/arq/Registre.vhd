library ieee;								--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Registre is 
	Port ( Reset : in STD_LOGIC; 
			clk : in STD_LOGIC; 			--Senyal de rellotge.
			enable : in STD_LOGIC; 		--Senyal d'habilitacio.
			Din : in STD_LOGIC_VECTOR(31 downto 0); --Dades d'entrada.
			Dout : out STD_LOGIC_VECTOR(31 downto 0)); --Dades de sortida.
end Registre;

architecture Behavioral of Registre is
--Creem senyal per modificar valor del registre.
signal reg : std_logic_vector(31 downto 0):=x"00000000";
begin

process(clk,reset)
begin
	if (reset = '1') then
		reg <= x"00000000";	--Posem a zero el registre.
	elsif (enable = '1') then
		--Actuem en el flanc de baixada del senyal del rellotge.
		if (falling_edge(clk)) then	
			reg <= Din;			--Posem la dada d'entrada al registre.
		end if;
	end if;
end process;
Dout <= reg;					--Asociem el valor del registre a la sortida.

end Behavioral;

		