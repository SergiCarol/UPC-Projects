library ieee;								--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity RegistreZero is 
	port ( clk : in STD_LOGIC;
			reset : in 	STD_LOGIC; 
			E1 : in STD_LOGIC; --Indica on s'ha de deixar l'informacio del registre.
			E2 : in STD_LOGIC;
			Dout1 : out STD_LOGIC_VECTOR(31 downto 0); 
			Dout2 : out STD_LOGIC_VECTOR(31 downto 0)); 
end RegistreZero;

architecture Zero of RegistreZero is
begin
	--Indiquem valor sortida (0 o Z) segons E1 i E2.
	Dout1 <= x"00000000" when E1='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	Dout2 <= x"00000000" when E2='1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end Zero;