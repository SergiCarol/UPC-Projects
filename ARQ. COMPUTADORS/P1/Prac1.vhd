library ieee;								--Cridem les llibreries necessaries.
use ieee.std_logic_1164.all;

entity Prac1 is							--Multiplexor de 2 a 1.
	port ( a,b,ctrl : in std_logic;	--Dos entrades i una de control.
			c : out std_logic);			--Valor resultant.
end Prac1;
			
architecture mux of Prac1 is 			
signal ctrl_n,n1,n2 : std_logic; 	--Creem senyal per operar posteriorment.
component INV 								--Funcio logica NOT.
	port ( a : in std_logic; 			--Format per 1 entrada i 1 sortida.
			c : out std_logic); 
	end component; 

component AND_2 							--Funcio logica AND.
	port ( a,b : in std_logic; 		--Format per 2 entrades i 1 sortida.
			c : out std_logic); 
	end component; 

component OR_2 							--Funcio logica OR.	
	port ( a,b : in std_logic; 		--Format per 2 entrades i 1 sortida.
			c : out std_logic); 
	end component; 

begin 										--Realitzem les operacions necessaries.
	U0: INV port map (ctrl,ctrl_n); 	
	U1: AND_2 port map (ctrl_n,a,n1); 
	U2: AND_2 port map (ctrl,b,n2); 
	U3: OR_2 port map (n1,n2,c); 		--'c' conte el resultat de la MUX
end mux;


