library ieee;
use ieee.std_logic_1164.all;

entity INV is							--Creem funcio logica NOT.

	port ( a: in std_logic;
			c : out std_logic);
			
end entity;

architecture i of INV is
begin
		c<= not a;						--Negem 'a' i surt per 'c'.
end i;
