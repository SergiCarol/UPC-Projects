library ieee;
use ieee.std_logic_1164.all;

entity AND_2 is						--Creem la funcio logica AND.

	port ( a,b : in std_logic;		  
			c : out std_logic);		
			
end entity;

architecture an_2 of AND_2 is
begin
		c<= a and b;					--Operem 'a' i 'b' i surt per 'c'.
end an_2;
