library ieee;
use ieee.std_logic_1164.all;

entity OR_2 is							--Creem funcio logica OR.

	port ( a,b : in std_logic;
			c : out std_logic);
			
end entity;

architecture o_2 of OR_2 is
begin
		c<= a or b;						--Operem 'a' i 'b' i surt per 'c'.
end o_2;
