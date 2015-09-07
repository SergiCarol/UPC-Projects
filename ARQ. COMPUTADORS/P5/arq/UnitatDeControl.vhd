library ieee;

use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity UnitatDeControl is
	
Port ( Reset : in STD_LOGIC;
	clk : in STD_LOGIC;
	co : in STD_LOGIC_VECTOR (5 downto 0);
	func : in STD_LOGIC_VECTOR (5 downto 0);
	z : in STD_LOGIC;
	c : in STD_LOGIC;
	l_sor1 : out STD_LOGIC;
	l_sor2 : out STD_LOGIC;
	e_reg : out STD_LOGIC;
	mux_dest : out STD_LOGIC_VECTOR (1 downto 0);
	l_mem : out STD_LOGIC;
	e_mem : out STD_LOGIC;
	e_mar : out STD_LOGIC;
	l_mdr : out STD_LOGIC;
	e_mdr : out STD_LOGIC;
	e_ir : out STD_LOGIC;
	l_pc : out STD_LOGIC;
	e_pc : out STD_LOGIC;
	pc_sup : out STD_LOGIC;
	inc_pc : out STD_LOGIC;
	l_desp1 : out STD_LOGIC;
	l_desp2 : out STD_LOGIC;
	l_extsign : out STD_LOGIC;
	l_acc : out STD_LOGIC;
	e_acc : out STD_LOGIC;
	Tancar : out STD_LOGIC;
	op_alu : out STD_LOGIC_VECTOR (2 downto 0);
	Sortida_Estat : out integer
	);

end UnitatDeControl;

architecture Behavioral of UnitatDeControl is

type Tipus_Estats is (E0, E1, E1a, E2, E3, E4, E5, E6, E6a, E7, E8, E9, E9a, E10, E11, E11i, E12, E12i, E13, E14, E14i, E15, E15i, E16, E17, E18, E19, E20);

signal Estat : Tipus_Estats;

begin

	transicions: process(clk)
		begin

		if falling_edge(clk) then
			if reset='1' then
				Estat <= E0;
				Sortida_Estat <= 0;
			else
				case Estat is
					when E0 => Estat <= E1;
					when E1 => Estat <= E1a;
					when E1a =>
						-- lw o sw
						if co="100011" or co="101011" then
							Estat <= E2;
						-- beq/bne
						elsif co="000100" or co="000101" then
							Estat <= E7;
						-- J
						elsif  co="000010" then
							Estat <= E17;
						-- jal
						elsif  co="000011" then
							Estat <= E18;
						-- jr
						elsif co="000000" and func="001000" then
							Estat <= E20 ;
						-- Arit-log
						else
							Estat <= E10;
					end if;
					when E2 => Estat <= E3;
					when E3 =>
						-- lw
						if co="100011" then
							Estat <= E4;
						-- sw
						elsif co="101011" then
							Estat <= E6;
						else
							Estat <= E1;
					end if;
					when E4 => Estat <= E5;
					when E5 => Estat <= E1;
					when E6 => Estat <= E6a;
					when E6a => Estat <= E1;
					when E7 => Estat <= E8;
					when E8 => 
						-- beq sense flag de 0
						if co="000100" and z='0' then
							Estat <= E1;
						-- bne amb flag de 0
						elsif co="000101" and z='1' then
							Estat <= E1;
						else
							Estat <= E9;
					end if;
					when E9 => Estat <= E9a;
					when E9a => Estat <= E1;
					when E10 =>
						-- add
						if co="000000" and func = "100000" then
							Estat <= E11;
						-- sub
						elsif co="000000" and func = "100010" then
							Estat <= E13;
						-- and 
						elsif co="000000" and func = "100100" then
							Estat <= E14 ;
						-- or
						elsif co="000000" and func = "100101" then
							Estat <= E15;
						-- slt
						elsif  co="000000" and func = "101010" then
							Estat <= E16;
						-- addi
						elsif co = "001000" then
							Estat <= E11i;
						-- andi
						elsif co = "001100" then
							Estat <= E14i;
						-- ori
						elsif co = "001101" then
							Estat <= E15i;
					end if;
					-- Estats logics
					when E11 => Estat <= E12;
					when E13 => Estat <= E12; 
					when E14 => Estat <= E12;
					when E15 => Estat <= E12;
					when E16 => Estat <= E12;
					-- Estats inmediats
					when E11i => Estat <= E12i;
					when E14i => Estat <= E12i;
					when E15i => Estat <= E12i;
					when E12 => Estat <= E1;
					when E12i => Estat <= E1;
					-- Estats de jump
					when E17 => Estat <= E1;
					when E18 => Estat <= E19;
					when E20 => Estat <= E1;
					when others => Estat <= E1;
				end case;
				
			case Estat is
					when E0 => Sortida_Estat <= 0;
					when E1 => Sortida_Estat <= 1;
					when E1a => Sortida_Estat <= 10001;
					when E2 => Sortida_Estat <= 2;
					when E3 => Sortida_Estat <= 3;
					when E4 => Sortida_Estat <= 4;
					when E5 => Sortida_Estat <= 5;
					when E6 => Sortida_Estat <= 6;
					when E6a => Sortida_Estat <= 60001;
					when E7 => Sortida_Estat <= 7;
					when E8 => Sortida_Estat <= 8;
					when E9 => Sortida_Estat <= 9;
					when E9a => Sortida_Estat <= 90001;
					when E10 => Sortida_Estat <= 10;
					when E11 => Sortida_Estat <= 11;
					when E11i => Sortida_Estat <= 110002;
					when E12 => Sortida_Estat <= 12;
					when E12i => Sortida_Estat <= 120002;
					when E13 => Sortida_Estat <= 13;
					when E14 => Sortida_Estat <= 14;
					when E14i => Sortida_Estat <= 140002;
					when E15 => Sortida_Estat <= 15;
					when E15i => Sortida_Estat <= 150002;
					when E16 => Sortida_Estat <= 16;
					when E17 => Sortida_Estat <= 17;
					when E18 => Sortida_Estat <= 18;
					when E19 => Sortida_Estat <= 19;
					when E20 => Sortida_Estat <= 20;
				end case;
			end if;
		end if;
	end process;
	sortides: process (Estat)
	begin
	case Estat is
		when E0 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E1 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '1';
			e_mem <= '0';
			e_mar <= '1';
			l_mdr <= '0';
			e_mdr <= '1';
			e_ir <= '0';
			l_pc <= '1';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E1a =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '1';
			e_mdr <= '0';
			e_ir <= '1';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '1';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E2 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E3 =>
			l_sor1 <= '1';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '1';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E4 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '1';
			e_mem <= '0';
			e_mar <= '1';
			l_mdr <= '0';
			e_mdr <= '1';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '1';
			op_alu <= "000";
		when E5 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '1';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '1';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E6 =>
			l_sor1 <= '0';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '1';
			e_mar <= '1';
			l_mdr <= '0';
			e_mdr <= '1';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '1';
			op_alu <= "000";
		when E6a =>
			l_sor1 <= '0';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '1';
			e_mar <= '1';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '1';
			op_alu <= "000";
		when E7 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E8 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "110";
		when E9 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '1';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '1';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E9a =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '1';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E10 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E11 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E11i =>
			l_sor1 <= '1';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '1';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E12 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '1';
			mux_dest <= "01";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E12i =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '1';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '0';
			Tancar <= '0';
			op_alu <= "000";
		when E13 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "110";
		when E14 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "000";
		when E14i =>
			l_sor1 <= '1';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '1';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "000";
		when E15 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "001";
		when E15i =>
			l_sor1 <= '1';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '1';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "001";
		when E16 =>
			l_sor1 <= '1';
			l_sor2 <= '1';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "111";
		when E17 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '1';
			e_pc <= '1';
			pc_sup <= '1';
			inc_pc <= '0';
			l_desp1 <= '1';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E18 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '1';
			mux_dest <= "10";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '1';
			e_pc <= '0';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '1';
			op_alu <= "000";
		when E19 =>
			l_sor1 <= '0';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '1';
			e_pc <= '1';
			pc_sup <= '1';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '1';
			l_extsign <= '0';
			l_acc <= '1';
			e_acc <= '1';
			Tancar <= '0';
			op_alu <= "010";
		when E20 =>
			l_sor1 <= '1';
			l_sor2 <= '0';
			e_reg <= '0';
			mux_dest <= "00";
			l_mem <= '0';
			e_mem <= '0';
			e_mar <= '0';
			l_mdr <= '0';
			e_mdr <= '0';
			e_ir <= '0';
			l_pc <= '0';
			e_pc <= '1';
			pc_sup <= '0';
			inc_pc <= '0';
			l_desp1 <= '0';
			l_desp2 <= '0';
			l_extsign <= '0';
			l_acc <= '0';
			e_acc <= '0';
			Tancar <= '1';
			op_alu <= "000";
		end case;
	end process;
end Behavioral;	