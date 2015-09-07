library ieee;														--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;



entity ALU32 is 													--Unitat aritmetico i logica.
port ( ControlALU: in STD_LOGIC_VECTOR (2 downto 0);	--Linies de control indiquen instruccio a realitzar. 
 Op1, Op2: in STD_LOGIC_VECTOR (31 downto 0);			--Els dos operands.
 Res: out STD_LOGIC_VECTOR (31 downto 0); 				--Resultat operacio realitzada
 Z, C: out STD_LOGIC); 											--Sortides de Zero i Carry.
end ALU32;

architecture ALU of ALU32 is
 
--Creem una senyal per operar amb un bit de mes.
signal result_int_32 :STD_LOGIC_VECTOR (32 downto 0);
begin 

process (ControlALU, Op1 ,Op2)

begin
case ControlALU is												--Realitzem l'operacio especificada per ControlALU.
	--Insertem un bit=0 en Op1 i Op2 per contemplar l'existencia de carry.
	when "000" => result_int_32 <= (('0' & Op1) and ('0' & Op2));
	when "001" => result_int_32 <= (('0' & Op1) or ('0' & Op2));
	when "010" => result_int_32 <= (('0' & Op1) + ('0' & Op2));
	when "110" => result_int_32 <= (('0' & Op1) - ('0' & Op2));
	when "111" => 
			if Op1 < Op2 then										--Si Op1 es mes petit que Op2.
				result_int_32 <= '0' & x"00000001";			--Bit menys sginificatiu=1 del resultat. 
			else
				result_int_32 <= '0' & x"00000000";			--Bit menys sginificatiu=0 del resultat. 
			end if;
	when others => result_int_32 <= '0' & x"00000000";
end case;
end process;

process (result_int_32) 
	begin																--Comprovem si el resultat es 0.
		if result_int_32 ='0' &  x"00000000" then 
			Z <= '1';												--Activem Z si el resultat es 0.
		else
			Z	<= '0';												--No activem Z si el resultat es diferent a 0.
		end if;
end process;

Res <= result_int_32(31 downto 0);							--Guardem el resultat sense le bit de Carry a Res.
C <= result_int_32(32);											--Guardem el bit de Carry a C.
end ALU;