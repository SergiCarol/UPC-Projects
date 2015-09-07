library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package paquet is					
	constant N : natural := 8;
	constant M : natural := 3;
	type operacio is (suma, resta, multiplicacio, op_xor, op_and, op_or);
	function op_seg (operacio_actual : operacio) return operacio;
	function calcular(a, b : signed(N-1 downto 0); operacio_actual : operacio) return signed;
	function tipus(operacio_actual : operacio) return std_logic_vector;
end package paquet;

package body paquet is

	--Té com entrada l’operació actual i retorna la següent operació.
	--S'executa quan es modifica l’entrada de selecció.
	function op_seg (operacio_actual : operacio) return operacio is
	variable op : operacio;	--Creem variable 'op' de tipus 'operacio'.
	begin
		case operacio_actual is
			when suma => op:= resta;
			when resta => op:= multiplicacio;
			when multiplicacio => op:= op_xor;
			when op_xor => op:= op_and;
			when op_and => op:= op_or;
			when op_or => op:= suma;
			when others => op:=suma;
		end case;
	return op;
	end function op_seg;
	
	--Retorna el resultat de l’operació actual entre les entrades A i B.
	--S'executa quan es modifiquen les entrades A, B o la de selecció.
	function calcular (a, b : signed(N-1 downto 0); operacio_actual : operacio) return signed is
	variable cal : signed(N-1 downto 0);
	variable cal_m : signed (2*N-1 downto 0);
	begin
		case operacio_actual is
			when suma => cal:= a+b;
			when resta => cal:= a-b;
			when multiplicacio => cal_m:= a*b;
										 cal := cal_m(N-1 downto 0);
			when op_xor => cal:= a XOR b;
			when op_and => cal:= a AND b;
			when op_or => cal:= a OR b;
			--when others => cal:= 0;
		end case;
	return cal;
	end function calcular;
	
	--Retorna el codi de l’operació actual.
	--S’executa quan es modifica l’entrada de selecció
	function tipus (operacio_actual : operacio) return std_logic_vector is
	variable tip : std_logic_vector(2 downto 0);
	begin
		case operacio_actual is
			when suma => tip:= "000";
			when resta => tip:= "001";
			when multiplicacio => tip:= "010";
			when op_xor => tip:= "011";
			when op_and => tip:= "100";
			when op_or => tip:= "101";
			when others => tip:= "111";
		end case;
	return tip;
	end function tipus;
end package body;