library ieee;										--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.paquet.all;

entity main is
	port (
			a, b : in signed (N-1 downto 0);	--N=8.			
			selector, reset : in std_logic;
			sortida : out signed (N-1 downto 0);
			mode : out std_logic_vector (2 downto 0));
end main;

architecture main_arch of main is

signal estat : operacio:=suma;
begin


  process(reset,selector,a,b)
    begin
      if reset = '1' then		--Si tenim un flanc de pujada i s'activa el reset.
        estat<= suma;		
		sortida <= calcular(a,b,estat);	  --Posem l'estat a suma ->'000'.
		 end if;
		if selector = '1' then				--Si el selector s'ha activat.
			estat<=op_seg(estat);		--Passem al seguent mode d'operacio.
			sortida <= calcular(a,b,estat);			--Retorna codi de l'operaio actual.
      end if;
		mode<=tipus(estat);
		sortida <= calcular(a,b,estat);--Retorna resultat de l'operacio.
    end process;
  
end main_arch;

  