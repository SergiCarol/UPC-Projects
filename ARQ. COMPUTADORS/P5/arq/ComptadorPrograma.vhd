library ieee;							--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.std_logic_unsigned.all;

entity ComptadorPrograma is
	Port ( Reset : in STD_LOGIC;	--Inicialitza PC=0.
			clk : in STD_LOGIC;
			IncPC : in STD_LOGIC;	--Increment del PC+4.
			LPC : in STD_LOGIC;		--Lectura del valor PC.
			EPC : in STD_LOGIC;		--Actualitza valor PC.
			Din : in STD_LOGIC_VECTOR (31 downto 0);	--Valor per realitzar salt en PC.
			Dout : out STD_LOGIC_VECTOR (31 downto 0)); --Valor de sortida del PC.
end ComptadorPrograma;

architecture PC_Arch of ComptadorPrograma is
--Creem dos senyals per llegir i guardar el contingut del PC.
signal ContingutPC: STD_LOGIC_VECTOR (31 downto 0):= x"00000000";
signal LecturaPC: STD_LOGIC_VECTOR (31 downto 0):= x"00000000";
begin
process (clk, reset)
begin
	if rising_edge(clk) then
		if reset = '1' then
			LecturaPC <= x"00000000";
		else LecturaPC <= ContingutPC;
		end if;
	end if;
end process;
process (clk,reset)
begin
	if (falling_edge(clk)) then
		if reset = '1' then						--Posem PC=0.
			ContingutPC <= x"00000000";
		elsif IncPC='1' then						--Incrementem PC=PC+4.
			ContingutPC <= ContingutPC + 4;
		elsif EPC='1' then
			ContingutPC <= Din;					--Actualitzem PC=Din.
		end if;
	end if;
end process;
Dout <= LecturaPC when LPC = '1' else "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
end PC_Arch;