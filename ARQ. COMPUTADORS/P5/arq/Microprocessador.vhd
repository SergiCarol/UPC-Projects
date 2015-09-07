library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Microprocessador is
	Port ( 
		Reset : in STD_LOGIC;
		CLK : in  STD_LOGIC
	);
end Microprocessador;

architecture Estructural of Microprocessador is

	component UnitatDeControl is
		Port (
			Reset : in STD_LOGIC;
			clk : in  STD_LOGIC;
			co : in  STD_LOGIC_VECTOR (5 downto 0);
			func : in  STD_LOGIC_VECTOR (5 downto 0);
			z : in  STD_LOGIC;
			c : in  STD_LOGIC;
			l_sor1 : out  STD_LOGIC;
			l_sor2 : out  STD_LOGIC;
			e_reg : out  STD_LOGIC;
			mux_dest : out  STD_LOGIC_VECTOR (1 downto 0);
			l_mem : out  STD_LOGIC;
			e_mem : out  STD_LOGIC;
			e_mar : out  STD_LOGIC;
			l_mdr : out  STD_LOGIC;
			e_mdr : out  STD_LOGIC;
			e_ir : out  STD_LOGIC;
			l_pc : out  STD_LOGIC;
			e_pc : out  STD_LOGIC;
			pc_sup : out  STD_LOGIC;
			inc_pc : out  STD_LOGIC;
			l_desp1 : out  STD_LOGIC;
			l_desp2 : out  STD_LOGIC;
			l_extsign : out  STD_LOGIC;
			l_acc : out  STD_LOGIC;
			e_acc : out  STD_LOGIC;
			Tancar : out  STD_LOGIC;
			op_alu : out  STD_LOGIC_VECTOR (2 downto 0)
		);
	end component;


	component ALU32 is
		Port (
			ControlALU : in  STD_LOGIC_VECTOR (2 downto 0);
			Op1 : in  STD_LOGIC_VECTOR (31 downto 0);
			Op2 : in  STD_LOGIC_VECTOR (31 downto 0);
			Res: out STD_LOGIC_VECTOR (31 downto 0);
			Z,C : out  STD_LOGIC 
		);
	end component;

	component BancRegistres is
		Port (
			Reset : in STD_LOGIC; 
			clk : in STD_LOGIC; 
			esc : in STD_LOGIC; 
			rdest : in STD_LOGIC_VECTOR (4 downto 0); 
			dades : in STD_LOGIC_VECTOR (31 downto 0); 
			lSor1 : in STD_LOGIC; 
			rf1 : in STD_LOGIC_VECTOR (4 downto 0); 
			lSor2 : in STD_LOGIC; 
			rf2 : in STD_LOGIC_VECTOR (4 downto 0); 
			sor1 : out STD_LOGIC_VECTOR (31 downto 0); 
			sor2 : out STD_LOGIC_VECTOR (31 downto 0) );	 
	end component;

	component PCSUP is
		Port ( 
			pc_sup : in std_logic;
			Entrada : in  STD_LOGIC_VECTOR (31 downto 0);
			Sortida : out  STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component ComptadorPrograma is
		Port (
			Reset : in STD_LOGIC;
			clk: in STD_LOGIC; 
			IncPC : in STD_LOGIC; 
			LPC : in STD_LOGIC; 
			EPC: in STD_LOGIC; 
			Din: in STD_LOGIC_VECTOR (31 downto 0); 
			Dout: out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component Desp25a0 is
		Port (
			l_desp2 : in std_logic;
			Entrada : in STD_LOGIC_VECTOR (25 downto 0);
			SortidaBus : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component DespExtSign15a0 is
		Port (
			l_desp1 : in STD_LOGIC;
			Entrada : in STD_LOGIC_VECTOR (31 downto 0);
			SortidaBus : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component ExtensioDeSigne is
		Port (
			l_extsign: in STD_LOGIC;
			DadaEntrada : in  STD_LOGIC_VECTOR (15 downto 0);
			DadaSortida1 : out  STD_LOGIC_VECTOR (31 downto 0);
			DadaSortida2 : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component RAMSin is
		Port (
			clk : in STD_LOGIC;
			Escr : in STD_LOGIC;
			Lect : in STD_LOGIC;
			Adress : in STD_LOGIC_VECTOR (5 downto 0);
			DadesE : in  STD_LOGIC_VECTOR (31 downto 0);
			DadesS : out  STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component Mux4a1_5Bits is
		Port (
			Sel : in  STD_LOGIC_VECTOR (1 downto 0);
			E0 : in  STD_LOGIC_VECTOR (4 downto 0);
			E1 : in  STD_LOGIC_VECTOR (4 downto 0);
			E2 : in  STD_LOGIC_VECTOR (4 downto 0);
			E3 : in  STD_LOGIC_VECTOR (4 downto 0);
			S : out  STD_LOGIC_VECTOR (4 downto 0) 
		);
	end component;

	component Acumulador is
		Port (
			clk : in STD_LOGIC;
			l_acc : in  STD_LOGIC;
			e_acc : in STD_LOGIC;
			DadaEntrada : in  STD_LOGIC_VECTOR (31 downto 0);
			DadaSortida : out  STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component Latch32Bits is
		Port (
			clk: in STD_LOGIC;
			E : in  STD_LOGIC;
			reset : in STD_LOGIC;
			Din : in  STD_LOGIC_VECTOR (31 downto 0);
			Dout : out  STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component RegistreMDR is
		Port (
			clk : in STD_LOGIC;
			reset : in STD_LOGIC;
			e_mdr : in  STD_LOGIC;
			l_mdr : in  STD_LOGIC;
			l_mem : in STD_LOGIC;
			DadesBus2 : in  STD_LOGIC_VECTOR (31 downto 0);
			DadesMemS : out  STD_LOGIC_VECTOR (31 downto 0);
			DadesMemE : in  STD_LOGIC_VECTOR (31 downto 0);
			DadesBus3 : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;

	component EnllacBus is
		Port (
			Tancar : in  STD_LOGIC;
			DadesBus3 : in STD_LOGIC_VECTOR (31 downto 0);
			DadesBus1 : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;
	

	component RegistreMAR is
		Port (
			Pas : in  STD_LOGIC;
			DadesEnt : in STD_LOGIC_VECTOR (31 downto 0);
			DadesSor : out STD_LOGIC_VECTOR (31 downto 0) 
		);
	end component;
	
	constant CONST31 : std_logic_vector(4 downto 0) := "01111";
	constant CONST0 : std_logic_vector(4 downto 0) := "00000";
	signal l_sor1, l_sor2,e_reg,l_mem,e_mem,e_mar,l_mdr,e_mdr,e_ir,l_pc,e_pc,pc_sup,inc_pc,l_desp1,l_desp2,l_extsign,l_acc,e_acc,Tancar,z,c : STD_LOGIC;
	signal mux_dest : STD_LOGIC_VECTOR(1 DOWNTO 0);
	signal op_alu : STD_LOGIC_VECTOR(2 downto 0);
	signal rdest : STD_LOGIC_VECTOR (4 downto 0);
	signal Instruccio, DB3 , DB2, DB1 , Alu_op1, Alu_op2, Sortida_Extensio,Adresa_RAM, Resultat_ALU , Dades_RAM , Dades_Out_Ram, Dades_Out_MDR_Ram : STD_LOGIC_VECTOR( 31 downto 0);
   
begin

	-- Unitat de Control --
  uc: UnitatDeControl port map ( Reset,CLK ,Instruccio(31 downto 26),Instruccio (5 downto 0),z ,c ,l_sor1,l_sor2,e_reg,mux_dest,l_mem,e_mem,e_mar,l_mdr,e_mdr,e_ir,l_pc,e_pc,pc_sup,inc_pc,l_desp1,l_desp2,l_extsign,l_acc,e_acc,Tancar,op_alu
											);																												
  -- Registre d'Instruccio --
  ir: Latch32Bits port map ( CLK ,e_ir,RESET,DB3 ,Instruccio);

  mx: Mux4a1_5Bits port map ( mux_dest ,Instruccio(20 downto 16),Instruccio(15 downto 11) ,CONST31 ,CONST0, rdest );
										
  -- Banc de Registres --
  breg: BancRegistres port map ( Reset ,CLK ,e_reg  ,rdest ,DB3 ,l_sor1 ,Instruccio(25 downto 21) ,l_sor2 ,Instruccio(20 downto 16) ,DB1, DB2);
  
  pcs: PCSUP port map ( pc_sup ,DB1, Alu_op1 );
								
  pc: ComptadorPrograma port map ( Reset,CLK , inc_pc,l_pc , e_pc , DB3 ,DB1);
  d1: Desp25a0 port map ( l_desp2 , Instruccio(25 downto 0) , DB2	); 
								  
  d2: DespExtSign15a0 port map ( l_desp1 ,Sortida_Extensio ,DB2);
											
  exts: ExtensioDeSigne port map ( l_extsign ,Instruccio (15 downto 0) , DB2, Sortida_Extensio);
  
  alu: ALU32 port map ( op_alu , Alu_op1 ,DB2 , Resultat_ALU, z,c); 
								
  acc: Acumulador port map (CLK ,l_acc , e_acc ,Resultat_ALU ,DB3);
									 
-- Diria que aixo es el MAR
  ma: RegistreMAR port map ( e_mar,DB1 , Adresa_RAM); 

-- Es te que arreglar la mida de la Adresa_RAM si es de 32 de 6 a 2									
  mr: RAMSin port map ( CLK,e_mem ,l_mem ,Adresa_RAM(7 downto 2) ,Dades_RAM ,Dades_Out_Ram); 
  
  mdr: RegistreMDR port map ( CLK ,Reset ,e_mdr ,l_mdr ,l_mem ,DB2 ,Dades_Ram,Dades_Out_Ram ,DB3); 
										
  enl:  EnllacBus port map ( Tancar , DB3 , DB1);
	
end Estructural;