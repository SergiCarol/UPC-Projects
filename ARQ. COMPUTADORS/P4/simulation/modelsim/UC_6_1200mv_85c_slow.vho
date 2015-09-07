-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 32-bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/12/2014 10:26:42"

-- 
-- Device: Altera EP4CGX22CF19C6 Package FBGA324
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	simbol_UC IS
    PORT (
	l_sor1 : OUT std_logic;
	Reset : IN std_logic;
	clk : IN std_logic;
	z : IN std_logic;
	c : IN std_logic;
	co : IN std_logic_vector(5 DOWNTO 0);
	func : IN std_logic_vector(5 DOWNTO 0);
	l_sor2 : OUT std_logic;
	e_reg : OUT std_logic;
	l_mem : OUT std_logic;
	e_mem : OUT std_logic;
	e_mar : OUT std_logic;
	l_mdr : OUT std_logic;
	e_mdr : OUT std_logic;
	e_ir : OUT std_logic;
	l_pc : OUT std_logic;
	e_pc : OUT std_logic;
	pc_sup : OUT std_logic;
	inc_pc : OUT std_logic;
	l_desp1 : OUT std_logic;
	l_desp2 : OUT std_logic;
	l_extsign : OUT std_logic;
	l_acc : OUT std_logic;
	e_acc : OUT std_logic;
	Tancar : OUT std_logic;
	mux_dest : OUT std_logic_vector(1 DOWNTO 0);
	op_alu : OUT std_logic_vector(2 DOWNTO 0);
	Sortida_Estat : OUT std_logic_vector(31 DOWNTO 0)
	);
END simbol_UC;

-- Design Ports Information
-- l_sor1	=>  Location: PIN_U15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c	=>  Location: PIN_T17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_sor2	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_reg	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_mem	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mem	=>  Location: PIN_V10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mar	=>  Location: PIN_P13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_mdr	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mdr	=>  Location: PIN_P12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_ir	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_pc	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_pc	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_sup	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inc_pc	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_desp1	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_desp2	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_extsign	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_acc	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_acc	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tancar	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mux_dest[1]	=>  Location: PIN_F18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mux_dest[0]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[2]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[1]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[0]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[31]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[30]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[29]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[28]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[27]	=>  Location: PIN_V17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[26]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[25]	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[24]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[23]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[22]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[21]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[20]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[19]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[18]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[17]	=>  Location: PIN_N17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[16]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[15]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[14]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[13]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[12]	=>  Location: PIN_N18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[11]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[10]	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[9]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[8]	=>  Location: PIN_M17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[7]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[6]	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[5]	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[4]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[3]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[2]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[1]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Sortida_Estat[0]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[3]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[5]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[4]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[2]	=>  Location: PIN_M16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[0]	=>  Location: PIN_B15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[1]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[5]	=>  Location: PIN_A16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[0]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[1]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[2]	=>  Location: PIN_D18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[4]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[3]	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF simbol_UC IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_l_sor1 : std_logic;
SIGNAL ww_Reset : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_z : std_logic;
SIGNAL ww_c : std_logic;
SIGNAL ww_co : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_func : std_logic_vector(5 DOWNTO 0);
SIGNAL ww_l_sor2 : std_logic;
SIGNAL ww_e_reg : std_logic;
SIGNAL ww_l_mem : std_logic;
SIGNAL ww_e_mem : std_logic;
SIGNAL ww_e_mar : std_logic;
SIGNAL ww_l_mdr : std_logic;
SIGNAL ww_e_mdr : std_logic;
SIGNAL ww_e_ir : std_logic;
SIGNAL ww_l_pc : std_logic;
SIGNAL ww_e_pc : std_logic;
SIGNAL ww_pc_sup : std_logic;
SIGNAL ww_inc_pc : std_logic;
SIGNAL ww_l_desp1 : std_logic;
SIGNAL ww_l_desp2 : std_logic;
SIGNAL ww_l_extsign : std_logic;
SIGNAL ww_l_acc : std_logic;
SIGNAL ww_e_acc : std_logic;
SIGNAL ww_Tancar : std_logic;
SIGNAL ww_mux_dest : std_logic_vector(1 DOWNTO 0);
SIGNAL ww_op_alu : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Sortida_Estat : std_logic_vector(31 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \c~input_o\ : std_logic;
SIGNAL \l_sor1~output_o\ : std_logic;
SIGNAL \l_sor2~output_o\ : std_logic;
SIGNAL \e_reg~output_o\ : std_logic;
SIGNAL \l_mem~output_o\ : std_logic;
SIGNAL \e_mem~output_o\ : std_logic;
SIGNAL \e_mar~output_o\ : std_logic;
SIGNAL \l_mdr~output_o\ : std_logic;
SIGNAL \e_mdr~output_o\ : std_logic;
SIGNAL \e_ir~output_o\ : std_logic;
SIGNAL \l_pc~output_o\ : std_logic;
SIGNAL \e_pc~output_o\ : std_logic;
SIGNAL \pc_sup~output_o\ : std_logic;
SIGNAL \inc_pc~output_o\ : std_logic;
SIGNAL \l_desp1~output_o\ : std_logic;
SIGNAL \l_desp2~output_o\ : std_logic;
SIGNAL \l_extsign~output_o\ : std_logic;
SIGNAL \l_acc~output_o\ : std_logic;
SIGNAL \e_acc~output_o\ : std_logic;
SIGNAL \Tancar~output_o\ : std_logic;
SIGNAL \mux_dest[1]~output_o\ : std_logic;
SIGNAL \mux_dest[0]~output_o\ : std_logic;
SIGNAL \op_alu[2]~output_o\ : std_logic;
SIGNAL \op_alu[1]~output_o\ : std_logic;
SIGNAL \op_alu[0]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[31]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[30]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[29]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[28]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[27]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[26]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[25]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[24]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[23]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[22]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[21]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[20]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[19]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[18]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[17]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[16]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[15]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[14]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[13]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[12]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[11]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[10]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[9]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[8]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[7]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[6]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[5]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[4]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[3]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[2]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[1]~output_o\ : std_logic;
SIGNAL \Sortida_Estat[0]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \co[3]~input_o\ : std_logic;
SIGNAL \co[5]~input_o\ : std_logic;
SIGNAL \co[4]~input_o\ : std_logic;
SIGNAL \co[1]~input_o\ : std_logic;
SIGNAL \inst|Equal12~0_combout\ : std_logic;
SIGNAL \co[2]~input_o\ : std_logic;
SIGNAL \inst|Estat~65_combout\ : std_logic;
SIGNAL \co[0]~input_o\ : std_logic;
SIGNAL \z~input_o\ : std_logic;
SIGNAL \inst|Selector0~2_combout\ : std_logic;
SIGNAL \func[3]~input_o\ : std_logic;
SIGNAL \func[0]~input_o\ : std_logic;
SIGNAL \func[5]~input_o\ : std_logic;
SIGNAL \func[4]~input_o\ : std_logic;
SIGNAL \func[2]~input_o\ : std_logic;
SIGNAL \inst|Equal7~0_combout\ : std_logic;
SIGNAL \func[1]~input_o\ : std_logic;
SIGNAL \inst|Selector11~1_combout\ : std_logic;
SIGNAL \inst|Selector11~0_combout\ : std_logic;
SIGNAL \inst|Equal9~0_combout\ : std_logic;
SIGNAL \inst|Equal9~1_combout\ : std_logic;
SIGNAL \inst|Equal6~0_combout\ : std_logic;
SIGNAL \inst|Equal6~1_combout\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \inst|Equal4~0_combout\ : std_logic;
SIGNAL \inst|Estat~66_combout\ : std_logic;
SIGNAL \inst|Estat~92_combout\ : std_logic;
SIGNAL \inst|Selector11~3_combout\ : std_logic;
SIGNAL \inst|Estat.E10~q\ : std_logic;
SIGNAL \inst|Selector11~2_combout\ : std_logic;
SIGNAL \inst|Selector0~1_combout\ : std_logic;
SIGNAL \inst|Estat~94_combout\ : std_logic;
SIGNAL \inst|Estat.E2~q\ : std_logic;
SIGNAL \inst|Estat~74_combout\ : std_logic;
SIGNAL \inst|Estat.E3~q\ : std_logic;
SIGNAL \inst|Estat.E0~0_combout\ : std_logic;
SIGNAL \inst|Estat.E0~q\ : std_logic;
SIGNAL \inst|Selector5~0_combout\ : std_logic;
SIGNAL \inst|Estat~83_combout\ : std_logic;
SIGNAL \inst|Estat~84_combout\ : std_logic;
SIGNAL \inst|Estat.E4~q\ : std_logic;
SIGNAL \inst|Selector5~1_combout\ : std_logic;
SIGNAL \inst|Estat.E5~q\ : std_logic;
SIGNAL \inst|Equal12~1_combout\ : std_logic;
SIGNAL \inst|Estat~75_combout\ : std_logic;
SIGNAL \inst|Estat~93_combout\ : std_logic;
SIGNAL \inst|Estat~76_combout\ : std_logic;
SIGNAL \inst|Estat.E11i~q\ : std_logic;
SIGNAL \inst|Equal13~0_combout\ : std_logic;
SIGNAL \inst|Estat~77_combout\ : std_logic;
SIGNAL \inst|Estat.E14i~q\ : std_logic;
SIGNAL \inst|Estat~78_combout\ : std_logic;
SIGNAL \inst|Estat~79_combout\ : std_logic;
SIGNAL \inst|Estat.E15i~q\ : std_logic;
SIGNAL \inst|Estat~82_combout\ : std_logic;
SIGNAL \inst|Estat.E12i~q\ : std_logic;
SIGNAL \inst|Estat~72_combout\ : std_logic;
SIGNAL \inst|Estat~73_combout\ : std_logic;
SIGNAL \inst|Estat.E16~q\ : std_logic;
SIGNAL \inst|Equal9~2_combout\ : std_logic;
SIGNAL \inst|Estat~70_combout\ : std_logic;
SIGNAL \inst|Estat.E14~q\ : std_logic;
SIGNAL \inst|Equal8~0_combout\ : std_logic;
SIGNAL \inst|Estat~69_combout\ : std_logic;
SIGNAL \inst|Estat.E13~q\ : std_logic;
SIGNAL \inst|Equal7~1_combout\ : std_logic;
SIGNAL \inst|Estat~68_combout\ : std_logic;
SIGNAL \inst|Estat.E11~q\ : std_logic;
SIGNAL \inst|Equal10~0_combout\ : std_logic;
SIGNAL \inst|Estat~71_combout\ : std_logic;
SIGNAL \inst|Estat.E15~q\ : std_logic;
SIGNAL \inst|WideOr28~0_combout\ : std_logic;
SIGNAL \inst|WideOr32~0_combout\ : std_logic;
SIGNAL \inst|WideOr32~0_wirecell_combout\ : std_logic;
SIGNAL \inst|Estat.E12~q\ : std_logic;
SIGNAL \inst|Selector0~3_combout\ : std_logic;
SIGNAL \inst|Estat~80_combout\ : std_logic;
SIGNAL \inst|Estat~88_combout\ : std_logic;
SIGNAL \inst|Estat.E17~q\ : std_logic;
SIGNAL \inst|Estat~67_combout\ : std_logic;
SIGNAL \inst|Estat.E20~q\ : std_logic;
SIGNAL \inst|Estat~86_combout\ : std_logic;
SIGNAL \inst|Estat~87_combout\ : std_logic;
SIGNAL \inst|Estat.E9~q\ : std_logic;
SIGNAL \inst|Estat~90_combout\ : std_logic;
SIGNAL \inst|Estat.E9a~q\ : std_logic;
SIGNAL \inst|Estat~81_combout\ : std_logic;
SIGNAL \inst|Estat.E18~q\ : std_logic;
SIGNAL \inst|Estat~89_combout\ : std_logic;
SIGNAL \inst|Estat.E19~q\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|Selector0~4_combout\ : std_logic;
SIGNAL \inst|Selector0~5_combout\ : std_logic;
SIGNAL \inst|Estat.E1~q\ : std_logic;
SIGNAL \inst|Estat~85_combout\ : std_logic;
SIGNAL \inst|Estat.E1a~q\ : std_logic;
SIGNAL \inst|Estat~91_combout\ : std_logic;
SIGNAL \inst|Estat.E7~q\ : std_logic;
SIGNAL \inst|Estat~64_combout\ : std_logic;
SIGNAL \inst|Estat.E8~q\ : std_logic;
SIGNAL \inst|WideOr39~0_combout\ : std_logic;
SIGNAL \inst|WideOr32~combout\ : std_logic;
SIGNAL \inst|WideOr33~combout\ : std_logic;
SIGNAL \inst|WideOr34~combout\ : std_logic;
SIGNAL \inst|l_mem~combout\ : std_logic;
SIGNAL \inst|l_mdr~combout\ : std_logic;
SIGNAL \inst|pc_sup~0_combout\ : std_logic;
SIGNAL \inst|WideOr37~combout\ : std_logic;
SIGNAL \inst|l_desp1~0_combout\ : std_logic;
SIGNAL \inst|WideOr40~2_combout\ : std_logic;
SIGNAL \inst|WideOr40~combout\ : std_logic;
SIGNAL \inst|WideOr37~0_combout\ : std_logic;
SIGNAL \inst|WideOr41~combout\ : std_logic;
SIGNAL \inst|WideOr42~combout\ : std_logic;
SIGNAL \inst|WideOr43~combout\ : std_logic;
SIGNAL \inst|WideOr31~0_combout\ : std_logic;
SIGNAL \inst|WideOr44~combout\ : std_logic;
SIGNAL \inst|WideOr45~0_combout\ : std_logic;
SIGNAL \inst|Sortida_Estat[31]~feeder_combout\ : std_logic;
SIGNAL \inst|Sortida_Estat~0_combout\ : std_logic;
SIGNAL \inst|Sortida_Estat~0_wirecell_combout\ : std_logic;
SIGNAL \inst|WideOr16~0_combout\ : std_logic;
SIGNAL \inst|WideOr17~combout\ : std_logic;
SIGNAL \inst|WideOr18~combout\ : std_logic;
SIGNAL \inst|WideOr19~combout\ : std_logic;
SIGNAL \inst|WideOr16~1_combout\ : std_logic;
SIGNAL \inst|WideOr20~0_combout\ : std_logic;
SIGNAL \inst|WideOr21~combout\ : std_logic;
SIGNAL \inst|WideOr22~combout\ : std_logic;
SIGNAL \inst|WideOr23~combout\ : std_logic;
SIGNAL \inst|WideOr24~combout\ : std_logic;
SIGNAL \inst|WideOr25~combout\ : std_logic;
SIGNAL \inst|WideOr24~0_combout\ : std_logic;
SIGNAL \inst|WideOr27~0_combout\ : std_logic;
SIGNAL \inst|WideOr27~1_combout\ : std_logic;
SIGNAL \inst|WideOr28~1_combout\ : std_logic;
SIGNAL \inst|WideOr28~combout\ : std_logic;
SIGNAL \inst|WideOr31~1_combout\ : std_logic;
SIGNAL \inst|WideOr29~0_combout\ : std_logic;
SIGNAL \inst|WideOr29~combout\ : std_logic;
SIGNAL \inst|WideOr30~1_combout\ : std_logic;
SIGNAL \inst|WideOr30~0_combout\ : std_logic;
SIGNAL \inst|WideOr30~2_combout\ : std_logic;
SIGNAL \inst|WideOr30~3_combout\ : std_logic;
SIGNAL \inst|WideOr31~2_combout\ : std_logic;
SIGNAL \inst|Sortida_Estat~1_combout\ : std_logic;
SIGNAL \inst|Sortida_Estat\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|ALT_INV_Sortida_Estat\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \inst|ALT_INV_l_desp1~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_Selector0~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_pc_sup~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr39~0_combout\ : std_logic;

BEGIN

l_sor1 <= ww_l_sor1;
ww_Reset <= Reset;
ww_clk <= clk;
ww_z <= z;
ww_c <= c;
ww_co <= co;
ww_func <= func;
l_sor2 <= ww_l_sor2;
e_reg <= ww_e_reg;
l_mem <= ww_l_mem;
e_mem <= ww_e_mem;
e_mar <= ww_e_mar;
l_mdr <= ww_l_mdr;
e_mdr <= ww_e_mdr;
e_ir <= ww_e_ir;
l_pc <= ww_l_pc;
e_pc <= ww_e_pc;
pc_sup <= ww_pc_sup;
inc_pc <= ww_inc_pc;
l_desp1 <= ww_l_desp1;
l_desp2 <= ww_l_desp2;
l_extsign <= ww_l_extsign;
l_acc <= ww_l_acc;
e_acc <= ww_e_acc;
Tancar <= ww_Tancar;
mux_dest <= ww_mux_dest;
op_alu <= ww_op_alu;
Sortida_Estat <= ww_Sortida_Estat;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;
\inst|ALT_INV_Sortida_Estat\(0) <= NOT \inst|Sortida_Estat\(0);
\inst|ALT_INV_Sortida_Estat\(31) <= NOT \inst|Sortida_Estat\(31);
\inst|ALT_INV_l_desp1~0_combout\ <= NOT \inst|l_desp1~0_combout\;
\inst|ALT_INV_Selector0~0_combout\ <= NOT \inst|Selector0~0_combout\;
\inst|ALT_INV_pc_sup~0_combout\ <= NOT \inst|pc_sup~0_combout\;
\inst|ALT_INV_WideOr39~0_combout\ <= NOT \inst|WideOr39~0_combout\;

-- Location: IOOBUF_X41_Y0_N9
\l_sor1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr32~combout\,
	devoe => ww_devoe,
	o => \l_sor1~output_o\);

-- Location: IOOBUF_X52_Y32_N9
\l_sor2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr33~combout\,
	devoe => ww_devoe,
	o => \l_sor2~output_o\);

-- Location: IOOBUF_X25_Y41_N9
\e_reg~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr34~combout\,
	devoe => ww_devoe,
	o => \e_reg~output_o\);

-- Location: IOOBUF_X36_Y0_N9
\l_mem~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|l_mem~combout\,
	devoe => ww_devoe,
	o => \l_mem~output_o\);

-- Location: IOOBUF_X21_Y0_N2
\e_mem~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \e_mem~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\e_mar~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|l_mem~combout\,
	devoe => ww_devoe,
	o => \e_mar~output_o\);

-- Location: IOOBUF_X46_Y41_N16
\l_mdr~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|l_mdr~combout\,
	devoe => ww_devoe,
	o => \l_mdr~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\e_mdr~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|l_mem~combout\,
	devoe => ww_devoe,
	o => \e_mdr~output_o\);

-- Location: IOOBUF_X52_Y18_N9
\e_ir~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Estat.E1a~q\,
	devoe => ww_devoe,
	o => \e_ir~output_o\);

-- Location: IOOBUF_X31_Y41_N2
\l_pc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr37~combout\,
	devoe => ww_devoe,
	o => \l_pc~output_o\);

-- Location: IOOBUF_X36_Y41_N2
\e_pc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_Selector0~0_combout\,
	devoe => ww_devoe,
	o => \e_pc~output_o\);

-- Location: IOOBUF_X34_Y41_N2
\pc_sup~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_pc_sup~0_combout\,
	devoe => ww_devoe,
	o => \pc_sup~output_o\);

-- Location: IOOBUF_X52_Y18_N2
\inc_pc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Estat.E1a~q\,
	devoe => ww_devoe,
	o => \inc_pc~output_o\);

-- Location: IOOBUF_X31_Y41_N23
\l_desp1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_l_desp1~0_combout\,
	devoe => ww_devoe,
	o => \l_desp1~output_o\);

-- Location: IOOBUF_X52_Y32_N23
\l_desp2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Estat.E19~q\,
	devoe => ww_devoe,
	o => \l_desp2~output_o\);

-- Location: IOOBUF_X29_Y41_N2
\l_extsign~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr39~0_combout\,
	devoe => ww_devoe,
	o => \l_extsign~output_o\);

-- Location: IOOBUF_X31_Y41_N16
\l_acc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr40~combout\,
	devoe => ww_devoe,
	o => \l_acc~output_o\);

-- Location: IOOBUF_X29_Y41_N9
\e_acc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr41~combout\,
	devoe => ww_devoe,
	o => \e_acc~output_o\);

-- Location: IOOBUF_X52_Y23_N9
\Tancar~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr42~combout\,
	devoe => ww_devoe,
	o => \Tancar~output_o\);

-- Location: IOOBUF_X52_Y30_N2
\mux_dest[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Estat.E18~q\,
	devoe => ww_devoe,
	o => \mux_dest[1]~output_o\);

-- Location: IOOBUF_X34_Y41_N9
\mux_dest[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Estat.E12~q\,
	devoe => ww_devoe,
	o => \mux_dest[0]~output_o\);

-- Location: IOOBUF_X52_Y27_N2
\op_alu[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr43~combout\,
	devoe => ww_devoe,
	o => \op_alu[2]~output_o\);

-- Location: IOOBUF_X41_Y41_N9
\op_alu[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr44~combout\,
	devoe => ww_devoe,
	o => \op_alu[1]~output_o\);

-- Location: IOOBUF_X52_Y28_N9
\op_alu[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr45~0_combout\,
	devoe => ww_devoe,
	o => \op_alu[0]~output_o\);

-- Location: IOOBUF_X18_Y41_N2
\Sortida_Estat[31]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_Sortida_Estat\(31),
	devoe => ww_devoe,
	o => \Sortida_Estat[31]~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\Sortida_Estat[30]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[30]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\Sortida_Estat[29]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[29]~output_o\);

-- Location: IOOBUF_X48_Y0_N2
\Sortida_Estat[28]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[28]~output_o\);

-- Location: IOOBUF_X43_Y0_N2
\Sortida_Estat[27]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[27]~output_o\);

-- Location: IOOBUF_X12_Y41_N9
\Sortida_Estat[26]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[26]~output_o\);

-- Location: IOOBUF_X10_Y0_N2
\Sortida_Estat[25]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[25]~output_o\);

-- Location: IOOBUF_X25_Y41_N2
\Sortida_Estat[24]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[24]~output_o\);

-- Location: IOOBUF_X23_Y41_N9
\Sortida_Estat[23]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[23]~output_o\);

-- Location: IOOBUF_X7_Y41_N16
\Sortida_Estat[22]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[22]~output_o\);

-- Location: IOOBUF_X5_Y0_N9
\Sortida_Estat[21]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[21]~output_o\);

-- Location: IOOBUF_X3_Y41_N2
\Sortida_Estat[20]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[20]~output_o\);

-- Location: IOOBUF_X10_Y0_N9
\Sortida_Estat[19]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[19]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\Sortida_Estat[18]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Sortida_Estat[18]~output_o\);

-- Location: IOOBUF_X52_Y16_N2
\Sortida_Estat[17]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(17),
	devoe => ww_devoe,
	o => \Sortida_Estat[17]~output_o\);

-- Location: IOOBUF_X52_Y32_N2
\Sortida_Estat[16]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(16),
	devoe => ww_devoe,
	o => \Sortida_Estat[16]~output_o\);

-- Location: IOOBUF_X52_Y28_N2
\Sortida_Estat[15]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(15),
	devoe => ww_devoe,
	o => \Sortida_Estat[15]~output_o\);

-- Location: IOOBUF_X46_Y41_N23
\Sortida_Estat[14]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(14),
	devoe => ww_devoe,
	o => \Sortida_Estat[14]~output_o\);

-- Location: IOOBUF_X52_Y27_N9
\Sortida_Estat[13]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(13),
	devoe => ww_devoe,
	o => \Sortida_Estat[13]~output_o\);

-- Location: IOOBUF_X52_Y16_N9
\Sortida_Estat[12]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(12),
	devoe => ww_devoe,
	o => \Sortida_Estat[12]~output_o\);

-- Location: IOOBUF_X52_Y25_N9
\Sortida_Estat[11]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(11),
	devoe => ww_devoe,
	o => \Sortida_Estat[11]~output_o\);

-- Location: IOOBUF_X52_Y19_N2
\Sortida_Estat[10]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(10),
	devoe => ww_devoe,
	o => \Sortida_Estat[10]~output_o\);

-- Location: IOOBUF_X52_Y25_N2
\Sortida_Estat[9]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(9),
	devoe => ww_devoe,
	o => \Sortida_Estat[9]~output_o\);

-- Location: IOOBUF_X52_Y15_N9
\Sortida_Estat[8]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(8),
	devoe => ww_devoe,
	o => \Sortida_Estat[8]~output_o\);

-- Location: IOOBUF_X52_Y23_N2
\Sortida_Estat[7]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(7),
	devoe => ww_devoe,
	o => \Sortida_Estat[7]~output_o\);

-- Location: IOOBUF_X52_Y19_N9
\Sortida_Estat[6]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(6),
	devoe => ww_devoe,
	o => \Sortida_Estat[6]~output_o\);

-- Location: IOOBUF_X52_Y32_N16
\Sortida_Estat[5]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(5),
	devoe => ww_devoe,
	o => \Sortida_Estat[5]~output_o\);

-- Location: IOOBUF_X36_Y41_N9
\Sortida_Estat[4]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(4),
	devoe => ww_devoe,
	o => \Sortida_Estat[4]~output_o\);

-- Location: IOOBUF_X46_Y41_N2
\Sortida_Estat[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(3),
	devoe => ww_devoe,
	o => \Sortida_Estat[3]~output_o\);

-- Location: IOOBUF_X41_Y41_N16
\Sortida_Estat[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(2),
	devoe => ww_devoe,
	o => \Sortida_Estat[2]~output_o\);

-- Location: IOOBUF_X36_Y0_N2
\Sortida_Estat[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|Sortida_Estat\(1),
	devoe => ww_devoe,
	o => \Sortida_Estat[1]~output_o\);

-- Location: IOOBUF_X31_Y41_N9
\Sortida_Estat[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_Sortida_Estat\(0),
	devoe => ww_devoe,
	o => \Sortida_Estat[0]~output_o\);

-- Location: IOIBUF_X27_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X43_Y41_N1
\Reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: IOIBUF_X43_Y41_N8
\co[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(3),
	o => \co[3]~input_o\);

-- Location: IOIBUF_X38_Y41_N1
\co[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(5),
	o => \co[5]~input_o\);

-- Location: IOIBUF_X41_Y0_N22
\co[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(4),
	o => \co[4]~input_o\);

-- Location: IOIBUF_X46_Y41_N8
\co[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(1),
	o => \co[1]~input_o\);

-- Location: LCCOMB_X38_Y31_N22
\inst|Equal12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal12~0_combout\ = (!\co[5]~input_o\ & (!\co[4]~input_o\ & !\co[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[5]~input_o\,
	datac => \co[4]~input_o\,
	datad => \co[1]~input_o\,
	combout => \inst|Equal12~0_combout\);

-- Location: IOIBUF_X52_Y31_N8
\co[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(2),
	o => \co[2]~input_o\);

-- Location: LCCOMB_X38_Y31_N24
\inst|Estat~65\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~65_combout\ = (!\co[3]~input_o\ & (\inst|Equal12~0_combout\ & \co[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \co[3]~input_o\,
	datac => \inst|Equal12~0_combout\,
	datad => \co[2]~input_o\,
	combout => \inst|Estat~65_combout\);

-- Location: IOIBUF_X38_Y41_N8
\co[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(0),
	o => \co[0]~input_o\);

-- Location: IOIBUF_X48_Y41_N1
\z~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z,
	o => \z~input_o\);

-- Location: LCCOMB_X37_Y30_N10
\inst|Selector0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~2_combout\ = (\inst|Estat~65_combout\ & (\inst|Estat.E8~q\ & (\co[0]~input_o\ $ (!\z~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat~65_combout\,
	datab => \co[0]~input_o\,
	datac => \inst|Estat.E8~q\,
	datad => \z~input_o\,
	combout => \inst|Selector0~2_combout\);

-- Location: IOIBUF_X52_Y30_N8
\func[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(3),
	o => \func[3]~input_o\);

-- Location: IOIBUF_X41_Y41_N1
\func[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(0),
	o => \func[0]~input_o\);

-- Location: IOIBUF_X41_Y41_N22
\func[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(5),
	o => \func[5]~input_o\);

-- Location: IOIBUF_X48_Y41_N8
\func[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(4),
	o => \func[4]~input_o\);

-- Location: IOIBUF_X52_Y15_N1
\func[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(2),
	o => \func[2]~input_o\);

-- Location: LCCOMB_X41_Y30_N22
\inst|Equal7~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal7~0_combout\ = (!\func[0]~input_o\ & (\func[5]~input_o\ & (!\func[4]~input_o\ & !\func[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[0]~input_o\,
	datab => \func[5]~input_o\,
	datac => \func[4]~input_o\,
	datad => \func[2]~input_o\,
	combout => \inst|Equal7~0_combout\);

-- Location: IOIBUF_X52_Y31_N1
\func[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(1),
	o => \func[1]~input_o\);

-- Location: LCCOMB_X39_Y30_N30
\inst|Selector11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~1_combout\ = ((\func[3]~input_o\ & !\func[1]~input_o\)) # (!\inst|Equal7~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111110101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[3]~input_o\,
	datac => \inst|Equal7~0_combout\,
	datad => \func[1]~input_o\,
	combout => \inst|Selector11~1_combout\);

-- Location: LCCOMB_X38_Y31_N28
\inst|Selector11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~0_combout\ = (((\co[0]~input_o\ & !\co[2]~input_o\)) # (!\inst|Equal12~0_combout\)) # (!\co[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal12~0_combout\,
	datad => \co[2]~input_o\,
	combout => \inst|Selector11~0_combout\);

-- Location: LCCOMB_X41_Y30_N28
\inst|Equal9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal9~0_combout\ = (!\func[3]~input_o\ & (!\func[4]~input_o\ & (\func[5]~input_o\ & !\func[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[3]~input_o\,
	datab => \func[4]~input_o\,
	datac => \func[5]~input_o\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal9~0_combout\);

-- Location: LCCOMB_X41_Y30_N14
\inst|Equal9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal9~1_combout\ = (\inst|Equal9~0_combout\ & \func[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Equal9~0_combout\,
	datad => \func[2]~input_o\,
	combout => \inst|Equal9~1_combout\);

-- Location: LCCOMB_X41_Y30_N26
\inst|Equal6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal6~0_combout\ = (!\func[0]~input_o\ & (!\func[5]~input_o\ & (!\func[4]~input_o\ & !\func[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[0]~input_o\,
	datab => \func[5]~input_o\,
	datac => \func[4]~input_o\,
	datad => \func[2]~input_o\,
	combout => \inst|Equal6~0_combout\);

-- Location: LCCOMB_X41_Y30_N8
\inst|Equal6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal6~1_combout\ = (\func[3]~input_o\ & (\inst|Equal6~0_combout\ & !\func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[3]~input_o\,
	datac => \inst|Equal6~0_combout\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal6~1_combout\);

-- Location: LCCOMB_X38_Y31_N12
\inst|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (!\co[4]~input_o\ & (\co[1]~input_o\ & (\co[0]~input_o\ & !\co[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[4]~input_o\,
	datab => \co[1]~input_o\,
	datac => \co[0]~input_o\,
	datad => \co[2]~input_o\,
	combout => \inst|Equal0~0_combout\);

-- Location: LCCOMB_X38_Y31_N30
\inst|Equal4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal4~0_combout\ = (!\co[4]~input_o\ & (\co[1]~input_o\ & (!\co[0]~input_o\ & !\co[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[4]~input_o\,
	datab => \co[1]~input_o\,
	datac => \co[0]~input_o\,
	datad => \co[2]~input_o\,
	combout => \inst|Equal4~0_combout\);

-- Location: LCCOMB_X35_Y30_N4
\inst|Estat~66\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~66_combout\ = (\co[5]~input_o\) # ((\co[3]~input_o\) # ((!\inst|Equal0~0_combout\ & !\inst|Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[5]~input_o\,
	datac => \inst|Equal4~0_combout\,
	datad => \co[3]~input_o\,
	combout => \inst|Estat~66_combout\);

-- Location: LCCOMB_X35_Y30_N28
\inst|Estat~92\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~92_combout\ = (!\inst|Estat~65_combout\ & (\inst|Estat.E1a~q\ & ((!\inst|Equal0~0_combout\) # (!\co[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat~65_combout\,
	datab => \co[5]~input_o\,
	datac => \inst|Equal0~0_combout\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|Estat~92_combout\);

-- Location: LCCOMB_X39_Y30_N18
\inst|Selector11~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~3_combout\ = (\inst|Selector11~2_combout\) # ((!\inst|Equal6~1_combout\ & (\inst|Estat~66_combout\ & \inst|Estat~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal6~1_combout\,
	datab => \inst|Selector11~2_combout\,
	datac => \inst|Estat~66_combout\,
	datad => \inst|Estat~92_combout\,
	combout => \inst|Selector11~3_combout\);

-- Location: FF_X39_Y30_N19
\inst|Estat.E10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Selector11~3_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E10~q\);

-- Location: LCCOMB_X39_Y30_N24
\inst|Selector11~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~2_combout\ = (\inst|Selector11~1_combout\ & (\inst|Selector11~0_combout\ & (!\inst|Equal9~1_combout\ & \inst|Estat.E10~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector11~1_combout\,
	datab => \inst|Selector11~0_combout\,
	datac => \inst|Equal9~1_combout\,
	datad => \inst|Estat.E10~q\,
	combout => \inst|Selector11~2_combout\);

-- Location: LCCOMB_X36_Y30_N12
\inst|Selector0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~1_combout\ = (!\co[5]~input_o\) # (!\inst|Equal0~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Equal0~0_combout\,
	datad => \co[5]~input_o\,
	combout => \inst|Selector0~1_combout\);

-- Location: LCCOMB_X35_Y30_N22
\inst|Estat~94\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~94_combout\ = (\inst|Estat.E1a~q\ & (\co[5]~input_o\ & (\inst|Equal0~0_combout\ & !\Reset~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E1a~q\,
	datab => \co[5]~input_o\,
	datac => \inst|Equal0~0_combout\,
	datad => \Reset~input_o\,
	combout => \inst|Estat~94_combout\);

-- Location: FF_X35_Y30_N23
\inst|Estat.E2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~94_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E2~q\);

-- Location: LCCOMB_X35_Y30_N16
\inst|Estat~74\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~74_combout\ = (\inst|Estat.E2~q\ & !\Reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E2~q\,
	datad => \Reset~input_o\,
	combout => \inst|Estat~74_combout\);

-- Location: FF_X35_Y30_N17
\inst|Estat.E3\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~74_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E3~q\);

-- Location: LCCOMB_X37_Y30_N24
\inst|Estat.E0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat.E0~0_combout\ = !\Reset~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	combout => \inst|Estat.E0~0_combout\);

-- Location: FF_X37_Y30_N25
\inst|Estat.E0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat.E0~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E0~q\);

-- Location: LCCOMB_X36_Y30_N2
\inst|Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst|Equal0~0_combout\ & (\co[3]~input_o\ & (\inst|Estat.E3~q\ & \co[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[3]~input_o\,
	datac => \inst|Estat.E3~q\,
	datad => \co[5]~input_o\,
	combout => \inst|Selector5~0_combout\);

-- Location: LCCOMB_X36_Y30_N28
\inst|Estat~83\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~83_combout\ = (!\Reset~input_o\ & \inst|Estat.E3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => \inst|Estat.E3~q\,
	combout => \inst|Estat~83_combout\);

-- Location: LCCOMB_X36_Y30_N6
\inst|Estat~84\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~84_combout\ = (\co[5]~input_o\ & (!\co[3]~input_o\ & (\inst|Equal0~0_combout\ & \inst|Estat~83_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[5]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal0~0_combout\,
	datad => \inst|Estat~83_combout\,
	combout => \inst|Estat~84_combout\);

-- Location: FF_X36_Y30_N7
\inst|Estat.E4\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~84_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E4~q\);

-- Location: LCCOMB_X37_Y30_N28
\inst|Selector5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector5~1_combout\ = (\inst|Selector5~0_combout\) # ((\inst|Estat.E4~q\) # ((\inst|Estat.E5~q\ & \inst|Selector11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector5~0_combout\,
	datab => \inst|Estat.E4~q\,
	datac => \inst|Estat.E5~q\,
	datad => \inst|Selector11~2_combout\,
	combout => \inst|Selector5~1_combout\);

-- Location: FF_X37_Y30_N29
\inst|Estat.E5\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Selector5~1_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E5~q\);

-- Location: LCCOMB_X38_Y31_N26
\inst|Equal12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal12~1_combout\ = (!\co[0]~input_o\ & (\co[3]~input_o\ & (\inst|Equal12~0_combout\ & !\co[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal12~0_combout\,
	datad => \co[2]~input_o\,
	combout => \inst|Equal12~1_combout\);

-- Location: LCCOMB_X39_Y30_N0
\inst|Estat~75\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~75_combout\ = (\inst|Estat.E10~q\ & (((!\func[1]~input_o\ & \func[3]~input_o\)) # (!\inst|Equal7~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[1]~input_o\,
	datab => \inst|Equal7~0_combout\,
	datac => \func[3]~input_o\,
	datad => \inst|Estat.E10~q\,
	combout => \inst|Estat~75_combout\);

-- Location: LCCOMB_X41_Y30_N12
\inst|Estat~93\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~93_combout\ = (\inst|Estat~75_combout\ & ((!\inst|Equal9~0_combout\) # (!\func[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[2]~input_o\,
	datab => \inst|Equal9~0_combout\,
	datad => \inst|Estat~75_combout\,
	combout => \inst|Estat~93_combout\);

-- Location: LCCOMB_X41_Y30_N24
\inst|Estat~76\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~76_combout\ = (!\Reset~input_o\ & (\inst|Equal12~1_combout\ & (!\inst|Selector11~2_combout\ & \inst|Estat~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Equal12~1_combout\,
	datac => \inst|Selector11~2_combout\,
	datad => \inst|Estat~93_combout\,
	combout => \inst|Estat~76_combout\);

-- Location: FF_X41_Y30_N25
\inst|Estat.E11i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~76_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E11i~q\);

-- Location: LCCOMB_X38_Y31_N4
\inst|Equal13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal13~0_combout\ = (!\co[0]~input_o\ & (\co[3]~input_o\ & (\inst|Equal12~0_combout\ & \co[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal12~0_combout\,
	datad => \co[2]~input_o\,
	combout => \inst|Equal13~0_combout\);

-- Location: LCCOMB_X41_Y30_N18
\inst|Estat~77\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~77_combout\ = (!\Reset~input_o\ & (\inst|Equal13~0_combout\ & (!\inst|Selector11~2_combout\ & \inst|Estat~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Equal13~0_combout\,
	datac => \inst|Selector11~2_combout\,
	datad => \inst|Estat~93_combout\,
	combout => \inst|Estat~77_combout\);

-- Location: FF_X41_Y30_N19
\inst|Estat.E14i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~77_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E14i~q\);

-- Location: LCCOMB_X38_Y31_N2
\inst|Estat~78\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~78_combout\ = (!\co[0]~input_o\ & (\co[3]~input_o\ & \inst|Equal12~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal12~0_combout\,
	combout => \inst|Estat~78_combout\);

-- Location: LCCOMB_X41_Y30_N20
\inst|Estat~79\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~79_combout\ = (!\Reset~input_o\ & (!\inst|Estat~78_combout\ & (!\inst|Selector11~2_combout\ & \inst|Estat~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Estat~78_combout\,
	datac => \inst|Selector11~2_combout\,
	datad => \inst|Estat~93_combout\,
	combout => \inst|Estat~79_combout\);

-- Location: FF_X41_Y30_N21
\inst|Estat.E15i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~79_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E15i~q\);

-- Location: LCCOMB_X38_Y30_N8
\inst|Estat~82\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~82_combout\ = (!\Reset~input_o\ & ((\inst|Estat.E11i~q\) # ((\inst|Estat.E14i~q\) # (\inst|Estat.E15i~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datab => \Reset~input_o\,
	datac => \inst|Estat.E14i~q\,
	datad => \inst|Estat.E15i~q\,
	combout => \inst|Estat~82_combout\);

-- Location: FF_X38_Y30_N9
\inst|Estat.E12i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~82_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E12i~q\);

-- Location: LCCOMB_X38_Y30_N28
\inst|Estat~72\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~72_combout\ = (!\Reset~input_o\ & \inst|Estat.E10~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \inst|Estat.E10~q\,
	combout => \inst|Estat~72_combout\);

-- Location: LCCOMB_X39_Y30_N8
\inst|Estat~73\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~73_combout\ = (\func[1]~input_o\ & (\inst|Equal7~0_combout\ & (\func[3]~input_o\ & \inst|Estat~72_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[1]~input_o\,
	datab => \inst|Equal7~0_combout\,
	datac => \func[3]~input_o\,
	datad => \inst|Estat~72_combout\,
	combout => \inst|Estat~73_combout\);

-- Location: FF_X39_Y30_N9
\inst|Estat.E16\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~73_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E16~q\);

-- Location: LCCOMB_X41_Y30_N16
\inst|Equal9~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal9~2_combout\ = (!\func[0]~input_o\ & (\inst|Equal9~0_combout\ & \func[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[0]~input_o\,
	datab => \inst|Equal9~0_combout\,
	datad => \func[2]~input_o\,
	combout => \inst|Equal9~2_combout\);

-- Location: LCCOMB_X39_Y30_N12
\inst|Estat~70\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~70_combout\ = (!\Reset~input_o\ & (\inst|Equal9~2_combout\ & (\inst|Estat.E10~q\ & !\inst|Selector11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Equal9~2_combout\,
	datac => \inst|Estat.E10~q\,
	datad => \inst|Selector11~2_combout\,
	combout => \inst|Estat~70_combout\);

-- Location: FF_X39_Y30_N13
\inst|Estat.E14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~70_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E14~q\);

-- Location: LCCOMB_X39_Y30_N22
\inst|Equal8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal8~0_combout\ = (!\func[3]~input_o\ & (\inst|Equal7~0_combout\ & \func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[3]~input_o\,
	datac => \inst|Equal7~0_combout\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal8~0_combout\);

-- Location: LCCOMB_X39_Y30_N14
\inst|Estat~69\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~69_combout\ = (\inst|Estat.E10~q\ & (!\Reset~input_o\ & (\inst|Equal8~0_combout\ & !\inst|Selector11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E10~q\,
	datab => \Reset~input_o\,
	datac => \inst|Equal8~0_combout\,
	datad => \inst|Selector11~2_combout\,
	combout => \inst|Estat~69_combout\);

-- Location: FF_X39_Y30_N15
\inst|Estat.E13\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E13~q\);

-- Location: LCCOMB_X39_Y30_N16
\inst|Equal7~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal7~1_combout\ = (!\func[3]~input_o\ & (\inst|Equal7~0_combout\ & !\func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[3]~input_o\,
	datac => \inst|Equal7~0_combout\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal7~1_combout\);

-- Location: LCCOMB_X39_Y30_N4
\inst|Estat~68\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~68_combout\ = (!\Reset~input_o\ & (\inst|Equal7~1_combout\ & (\inst|Estat.E10~q\ & !\inst|Selector11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Equal7~1_combout\,
	datac => \inst|Estat.E10~q\,
	datad => \inst|Selector11~2_combout\,
	combout => \inst|Estat~68_combout\);

-- Location: FF_X39_Y30_N5
\inst|Estat.E11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~68_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E11~q\);

-- Location: LCCOMB_X41_Y30_N10
\inst|Equal10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal10~0_combout\ = (\func[0]~input_o\ & (\inst|Equal9~0_combout\ & \func[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[0]~input_o\,
	datab => \inst|Equal9~0_combout\,
	datad => \func[2]~input_o\,
	combout => \inst|Equal10~0_combout\);

-- Location: LCCOMB_X38_Y30_N20
\inst|Estat~71\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~71_combout\ = (\inst|Equal10~0_combout\ & (\inst|Estat.E10~q\ & (!\Reset~input_o\ & !\inst|Selector11~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal10~0_combout\,
	datab => \inst|Estat.E10~q\,
	datac => \Reset~input_o\,
	datad => \inst|Selector11~2_combout\,
	combout => \inst|Estat~71_combout\);

-- Location: FF_X38_Y30_N21
\inst|Estat.E15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~71_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E15~q\);

-- Location: LCCOMB_X39_Y30_N26
\inst|WideOr28~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr28~0_combout\ = (!\inst|Estat.E14~q\ & (!\inst|Estat.E13~q\ & (!\inst|Estat.E11~q\ & !\inst|Estat.E15~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E14~q\,
	datab => \inst|Estat.E13~q\,
	datac => \inst|Estat.E11~q\,
	datad => \inst|Estat.E15~q\,
	combout => \inst|WideOr28~0_combout\);

-- Location: LCCOMB_X38_Y30_N18
\inst|WideOr32~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr32~0_combout\ = (!\inst|Estat.E16~q\ & \inst|WideOr28~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E16~q\,
	datad => \inst|WideOr28~0_combout\,
	combout => \inst|WideOr32~0_combout\);

-- Location: LCCOMB_X38_Y30_N16
\inst|WideOr32~0_wirecell\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr32~0_wirecell_combout\ = !\inst|WideOr32~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|WideOr32~0_combout\,
	combout => \inst|WideOr32~0_wirecell_combout\);

-- Location: FF_X38_Y30_N17
\inst|Estat.E12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr32~0_wirecell_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E12~q\);

-- Location: LCCOMB_X37_Y30_N14
\inst|Selector0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~3_combout\ = ((\inst|Estat.E5~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E12~q\))) # (!\inst|Estat.E0~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E0~q\,
	datab => \inst|Estat.E5~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E12~q\,
	combout => \inst|Selector0~3_combout\);

-- Location: LCCOMB_X35_Y30_N12
\inst|Estat~80\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~80_combout\ = (!\Reset~input_o\ & \inst|Estat~92_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datad => \inst|Estat~92_combout\,
	combout => \inst|Estat~80_combout\);

-- Location: LCCOMB_X36_Y30_N30
\inst|Estat~88\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~88_combout\ = (!\co[5]~input_o\ & (!\co[3]~input_o\ & (\inst|Equal4~0_combout\ & \inst|Estat~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[5]~input_o\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal4~0_combout\,
	datad => \inst|Estat~80_combout\,
	combout => \inst|Estat~88_combout\);

-- Location: FF_X36_Y30_N31
\inst|Estat.E17\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~88_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E17~q\);

-- Location: LCCOMB_X36_Y30_N16
\inst|Estat~67\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~67_combout\ = (\inst|Equal6~1_combout\ & (!\Reset~input_o\ & (\inst|Estat~66_combout\ & \inst|Estat~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal6~1_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat~66_combout\,
	datad => \inst|Estat~92_combout\,
	combout => \inst|Estat~67_combout\);

-- Location: FF_X36_Y30_N17
\inst|Estat.E20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~67_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E20~q\);

-- Location: LCCOMB_X37_Y30_N30
\inst|Estat~86\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~86_combout\ = (!\Reset~input_o\ & \inst|Estat.E8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => \inst|Estat.E8~q\,
	combout => \inst|Estat~86_combout\);

-- Location: LCCOMB_X37_Y30_N22
\inst|Estat~87\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~87_combout\ = (\inst|Estat~86_combout\ & ((\co[0]~input_o\ $ (\z~input_o\)) # (!\inst|Estat~65_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111000011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat~65_combout\,
	datab => \co[0]~input_o\,
	datac => \inst|Estat~86_combout\,
	datad => \z~input_o\,
	combout => \inst|Estat~87_combout\);

-- Location: FF_X37_Y30_N23
\inst|Estat.E9\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~87_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E9~q\);

-- Location: LCCOMB_X36_Y30_N8
\inst|Estat~90\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~90_combout\ = (!\Reset~input_o\ & \inst|Estat.E9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|Estat~90_combout\);

-- Location: FF_X36_Y30_N9
\inst|Estat.E9a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~90_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E9a~q\);

-- Location: LCCOMB_X35_Y30_N6
\inst|Estat~81\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~81_combout\ = (\inst|Equal0~0_combout\ & (!\co[3]~input_o\ & (!\co[5]~input_o\ & \inst|Estat~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[3]~input_o\,
	datac => \co[5]~input_o\,
	datad => \inst|Estat~80_combout\,
	combout => \inst|Estat~81_combout\);

-- Location: FF_X35_Y30_N7
\inst|Estat.E18\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~81_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E18~q\);

-- Location: LCCOMB_X36_Y30_N0
\inst|Estat~89\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~89_combout\ = (!\Reset~input_o\ & \inst|Estat.E18~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => \inst|Estat.E18~q\,
	combout => \inst|Estat~89_combout\);

-- Location: FF_X36_Y30_N1
\inst|Estat.E19\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E19~q\);

-- Location: LCCOMB_X36_Y30_N14
\inst|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = (!\inst|Estat.E17~q\ & (!\inst|Estat.E20~q\ & (!\inst|Estat.E9a~q\ & !\inst|Estat.E19~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E17~q\,
	datab => \inst|Estat.E20~q\,
	datac => \inst|Estat.E9a~q\,
	datad => \inst|Estat.E19~q\,
	combout => \inst|Selector0~0_combout\);

-- Location: LCCOMB_X37_Y30_N16
\inst|Selector0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~4_combout\ = (\inst|Selector0~3_combout\) # (((\inst|Selector0~1_combout\ & \inst|Estat.E3~q\)) # (!\inst|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector0~1_combout\,
	datab => \inst|Estat.E3~q\,
	datac => \inst|Selector0~3_combout\,
	datad => \inst|Selector0~0_combout\,
	combout => \inst|Selector0~4_combout\);

-- Location: LCCOMB_X37_Y30_N2
\inst|Selector0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~5_combout\ = (\inst|Selector0~2_combout\) # ((\inst|Selector0~4_combout\) # ((\inst|Selector11~2_combout\ & \inst|Estat.E1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector0~2_combout\,
	datab => \inst|Selector11~2_combout\,
	datac => \inst|Estat.E1~q\,
	datad => \inst|Selector0~4_combout\,
	combout => \inst|Selector0~5_combout\);

-- Location: FF_X37_Y30_N3
\inst|Estat.E1\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Selector0~5_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E1~q\);

-- Location: LCCOMB_X35_Y30_N10
\inst|Estat~85\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~85_combout\ = (\inst|Estat.E1~q\ & !\Reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E1~q\,
	datad => \Reset~input_o\,
	combout => \inst|Estat~85_combout\);

-- Location: FF_X35_Y30_N11
\inst|Estat.E1a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~85_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E1a~q\);

-- Location: LCCOMB_X37_Y30_N0
\inst|Estat~91\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~91_combout\ = (!\Reset~input_o\ & (\inst|Estat.E1a~q\ & \inst|Estat~65_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datac => \inst|Estat.E1a~q\,
	datad => \inst|Estat~65_combout\,
	combout => \inst|Estat~91_combout\);

-- Location: FF_X37_Y30_N1
\inst|Estat.E7\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~91_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E7~q\);

-- Location: LCCOMB_X37_Y30_N8
\inst|Estat~64\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~64_combout\ = (\inst|Estat.E7~q\ & !\Reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E7~q\,
	datac => \Reset~input_o\,
	combout => \inst|Estat~64_combout\);

-- Location: FF_X37_Y30_N9
\inst|Estat.E8\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~64_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E8~q\);

-- Location: LCCOMB_X38_Y30_N12
\inst|WideOr39~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr39~0_combout\ = (!\inst|Estat.E11i~q\ & (!\inst|Estat.E3~q\ & (!\inst|Estat.E14i~q\ & !\inst|Estat.E15i~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datab => \inst|Estat.E3~q\,
	datac => \inst|Estat.E14i~q\,
	datad => \inst|Estat.E15i~q\,
	combout => \inst|WideOr39~0_combout\);

-- Location: LCCOMB_X38_Y30_N26
\inst|WideOr32\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr32~combout\ = (\inst|Estat.E8~q\) # (((\inst|Estat.E20~q\) # (!\inst|WideOr39~0_combout\)) # (!\inst|WideOr32~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E8~q\,
	datab => \inst|WideOr32~0_combout\,
	datac => \inst|Estat.E20~q\,
	datad => \inst|WideOr39~0_combout\,
	combout => \inst|WideOr32~combout\);

-- Location: LCCOMB_X39_Y30_N6
\inst|WideOr33\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr33~combout\ = (\inst|Estat.E8~q\) # ((\inst|Estat.E16~q\) # (!\inst|WideOr28~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E8~q\,
	datac => \inst|WideOr28~0_combout\,
	datad => \inst|Estat.E16~q\,
	combout => \inst|WideOr33~combout\);

-- Location: LCCOMB_X35_Y30_N20
\inst|WideOr34\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr34~combout\ = (\inst|Estat.E18~q\) # ((\inst|Estat.E12~q\) # ((\inst|Estat.E5~q\) # (\inst|Estat.E12i~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E18~q\,
	datab => \inst|Estat.E12~q\,
	datac => \inst|Estat.E5~q\,
	datad => \inst|Estat.E12i~q\,
	combout => \inst|WideOr34~combout\);

-- Location: LCCOMB_X36_Y30_N24
\inst|l_mem\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_mem~combout\ = (\inst|Estat.E4~q\) # (\inst|Estat.E1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E4~q\,
	datad => \inst|Estat.E1~q\,
	combout => \inst|l_mem~combout\);

-- Location: LCCOMB_X39_Y30_N20
\inst|l_mdr\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_mdr~combout\ = (\inst|Estat.E1a~q\) # (\inst|Estat.E5~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E1a~q\,
	datad => \inst|Estat.E5~q\,
	combout => \inst|l_mdr~combout\);

-- Location: LCCOMB_X36_Y30_N10
\inst|pc_sup~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|pc_sup~0_combout\ = (!\inst|Estat.E19~q\ & !\inst|Estat.E17~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E19~q\,
	datac => \inst|Estat.E17~q\,
	combout => \inst|pc_sup~0_combout\);

-- Location: LCCOMB_X35_Y30_N0
\inst|WideOr37\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr37~combout\ = (\inst|Estat.E18~q\) # ((\inst|Estat.E1~q\) # ((\inst|Estat.E9~q\) # (!\inst|pc_sup~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E18~q\,
	datab => \inst|Estat.E1~q\,
	datac => \inst|pc_sup~0_combout\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|WideOr37~combout\);

-- Location: LCCOMB_X35_Y30_N2
\inst|l_desp1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_desp1~0_combout\ = (!\inst|Estat.E17~q\ & !\inst|Estat.E9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E17~q\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|l_desp1~0_combout\);

-- Location: LCCOMB_X36_Y30_N20
\inst|WideOr40~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr40~2_combout\ = (\inst|Estat.E4~q\) # ((\inst|Estat.E19~q\) # ((\inst|Estat.E9a~q\) # (\inst|Estat.E17~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E4~q\,
	datab => \inst|Estat.E19~q\,
	datac => \inst|Estat.E9a~q\,
	datad => \inst|Estat.E17~q\,
	combout => \inst|WideOr40~2_combout\);

-- Location: LCCOMB_X35_Y30_N26
\inst|WideOr40\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr40~combout\ = (\inst|Estat.E9~q\) # ((\inst|Estat.E12~q\) # ((\inst|WideOr40~2_combout\) # (\inst|Estat.E12i~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E9~q\,
	datab => \inst|Estat.E12~q\,
	datac => \inst|WideOr40~2_combout\,
	datad => \inst|Estat.E12i~q\,
	combout => \inst|WideOr40~combout\);

-- Location: LCCOMB_X36_Y30_N18
\inst|WideOr37~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr37~0_combout\ = (!\inst|Estat.E19~q\ & (!\inst|Estat.E17~q\ & !\inst|Estat.E9~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E19~q\,
	datac => \inst|Estat.E17~q\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|WideOr37~0_combout\);

-- Location: LCCOMB_X38_Y30_N24
\inst|WideOr41\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr41~combout\ = (((\inst|Estat.E16~q\) # (!\inst|WideOr39~0_combout\)) # (!\inst|WideOr28~0_combout\)) # (!\inst|WideOr37~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr37~0_combout\,
	datab => \inst|WideOr28~0_combout\,
	datac => \inst|Estat.E16~q\,
	datad => \inst|WideOr39~0_combout\,
	combout => \inst|WideOr41~combout\);

-- Location: LCCOMB_X38_Y30_N30
\inst|WideOr42\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr42~combout\ = (\inst|Estat.E20~q\) # ((\inst|Estat.E18~q\) # (\inst|Estat.E4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E20~q\,
	datac => \inst|Estat.E18~q\,
	datad => \inst|Estat.E4~q\,
	combout => \inst|WideOr42~combout\);

-- Location: LCCOMB_X39_Y30_N10
\inst|WideOr43\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr43~combout\ = (\inst|Estat.E8~q\) # ((\inst|Estat.E13~q\) # (\inst|Estat.E16~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E8~q\,
	datac => \inst|Estat.E13~q\,
	datad => \inst|Estat.E16~q\,
	combout => \inst|WideOr43~combout\);

-- Location: LCCOMB_X36_Y30_N4
\inst|WideOr31~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr31~0_combout\ = (!\inst|Estat.E3~q\ & (!\inst|Estat.E11~q\ & (!\inst|Estat.E13~q\ & \inst|WideOr37~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E3~q\,
	datab => \inst|Estat.E11~q\,
	datac => \inst|Estat.E13~q\,
	datad => \inst|WideOr37~0_combout\,
	combout => \inst|WideOr31~0_combout\);

-- Location: LCCOMB_X38_Y30_N4
\inst|WideOr44\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr44~combout\ = (\inst|Estat.E8~q\) # ((\inst|Estat.E16~q\) # ((\inst|Estat.E11i~q\) # (!\inst|WideOr31~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E8~q\,
	datab => \inst|Estat.E16~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|WideOr31~0_combout\,
	combout => \inst|WideOr44~combout\);

-- Location: LCCOMB_X38_Y30_N10
\inst|WideOr45~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr45~0_combout\ = (\inst|Estat.E15~q\) # ((\inst|Estat.E16~q\) # (\inst|Estat.E15i~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E15~q\,
	datac => \inst|Estat.E16~q\,
	datad => \inst|Estat.E15i~q\,
	combout => \inst|WideOr45~0_combout\);

-- Location: LCCOMB_X19_Y40_N0
\inst|Sortida_Estat[31]~feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Sortida_Estat[31]~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \inst|Sortida_Estat[31]~feeder_combout\);

-- Location: FF_X19_Y40_N1
\inst|Sortida_Estat[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Sortida_Estat[31]~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(31));

-- Location: LCCOMB_X44_Y30_N18
\inst|Sortida_Estat~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Sortida_Estat~0_combout\ = (!\inst|Estat.E15i~q\ & !\inst|Estat.E14i~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E15i~q\,
	datad => \inst|Estat.E14i~q\,
	combout => \inst|Sortida_Estat~0_combout\);

-- Location: LCCOMB_X44_Y30_N0
\inst|Sortida_Estat~0_wirecell\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Sortida_Estat~0_wirecell_combout\ = !\inst|Sortida_Estat~0_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|Sortida_Estat~0_combout\,
	combout => \inst|Sortida_Estat~0_wirecell_combout\);

-- Location: FF_X44_Y30_N1
\inst|Sortida_Estat[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Sortida_Estat~0_wirecell_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(17));

-- Location: LCCOMB_X44_Y30_N26
\inst|WideOr16~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~0_combout\ = (\inst|Estat.E11i~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E9a~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E9a~q\,
	combout => \inst|WideOr16~0_combout\);

-- Location: FF_X44_Y30_N27
\inst|Sortida_Estat[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr16~0_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(16));

-- Location: LCCOMB_X44_Y30_N16
\inst|WideOr17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr17~combout\ = (\inst|Estat.E11i~q\) # (\inst|Estat.E12i~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datac => \inst|Estat.E12i~q\,
	combout => \inst|WideOr17~combout\);

-- Location: FF_X44_Y30_N17
\inst|Sortida_Estat[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr17~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(15));

-- Location: LCCOMB_X44_Y30_N10
\inst|WideOr18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr18~combout\ = (\inst|Estat.E15i~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E9a~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E9a~q\,
	combout => \inst|WideOr18~combout\);

-- Location: FF_X44_Y30_N11
\inst|Sortida_Estat[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr18~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(14));

-- Location: LCCOMB_X44_Y30_N12
\inst|WideOr19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr19~combout\ = (\inst|Estat.E14i~q\) # ((\inst|Estat.E11i~q\) # (\inst|Estat.E1a~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E14i~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|WideOr19~combout\);

-- Location: FF_X44_Y30_N13
\inst|Sortida_Estat[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr19~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(13));

-- Location: LCCOMB_X44_Y30_N6
\inst|WideOr16~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~1_combout\ = (\inst|Estat.E12i~q\) # (\inst|Estat.E9a~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E9a~q\,
	combout => \inst|WideOr16~1_combout\);

-- Location: FF_X44_Y30_N7
\inst|Sortida_Estat[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr16~1_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(12));

-- Location: LCCOMB_X44_Y30_N28
\inst|WideOr20~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr20~0_combout\ = (\inst|Estat.E15i~q\) # ((\inst|Estat.E11i~q\) # (\inst|Estat.E9a~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E9a~q\,
	combout => \inst|WideOr20~0_combout\);

-- Location: FF_X44_Y30_N29
\inst|Sortida_Estat[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr20~0_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(11));

-- Location: LCCOMB_X44_Y30_N2
\inst|WideOr21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr21~combout\ = (\inst|Estat.E11i~q\) # ((\inst|Estat.E9a~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E1a~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datab => \inst|Estat.E9a~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|WideOr21~combout\);

-- Location: FF_X44_Y30_N3
\inst|Sortida_Estat[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr21~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(10));

-- Location: LCCOMB_X44_Y30_N24
\inst|WideOr22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr22~combout\ = (\inst|Estat.E14i~q\) # ((\inst|Estat.E9a~q\) # (\inst|Estat.E1a~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E14i~q\,
	datac => \inst|Estat.E9a~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|WideOr22~combout\);

-- Location: FF_X44_Y30_N25
\inst|Sortida_Estat[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr22~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(9));

-- Location: LCCOMB_X44_Y30_N30
\inst|WideOr23\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr23~combout\ = (\inst|Estat.E15i~q\) # ((\inst|Estat.E9a~q\) # ((\inst|Estat.E11i~q\) # (\inst|Estat.E1a~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datab => \inst|Estat.E9a~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|WideOr23~combout\);

-- Location: FF_X44_Y30_N31
\inst|Sortida_Estat[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr23~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(8));

-- Location: LCCOMB_X44_Y30_N8
\inst|WideOr24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr24~combout\ = (\inst|Estat.E11i~q\) # ((\inst|Estat.E9a~q\) # ((\inst|Estat.E12i~q\) # (!\inst|Sortida_Estat~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11i~q\,
	datab => \inst|Estat.E9a~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Sortida_Estat~0_combout\,
	combout => \inst|WideOr24~combout\);

-- Location: FF_X44_Y30_N9
\inst|Sortida_Estat[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr24~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(7));

-- Location: LCCOMB_X44_Y30_N22
\inst|WideOr25\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr25~combout\ = (\inst|Estat.E15i~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E14i~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E14i~q\,
	combout => \inst|WideOr25~combout\);

-- Location: FF_X44_Y30_N23
\inst|Sortida_Estat[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr25~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(6));

-- Location: LCCOMB_X44_Y30_N20
\inst|WideOr24~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr24~0_combout\ = (\inst|Estat.E15i~q\) # ((\inst|Estat.E11i~q\) # (\inst|Estat.E14i~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E14i~q\,
	combout => \inst|WideOr24~0_combout\);

-- Location: FF_X44_Y30_N21
\inst|Sortida_Estat[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr24~0_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(5));

-- Location: LCCOMB_X38_Y30_N2
\inst|WideOr27~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr27~0_combout\ = (\inst|Estat.E1a~q\) # ((\inst|Estat.E16~q\) # ((\inst|Estat.E11i~q\) # (\inst|Estat.E15i~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E1a~q\,
	datab => \inst|Estat.E16~q\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E15i~q\,
	combout => \inst|WideOr27~0_combout\);

-- Location: LCCOMB_X38_Y30_N22
\inst|WideOr27~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr27~1_combout\ = (\inst|Estat.E18~q\) # ((\inst|WideOr27~0_combout\) # (!\inst|Selector0~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E18~q\,
	datac => \inst|Selector0~0_combout\,
	datad => \inst|WideOr27~0_combout\,
	combout => \inst|WideOr27~1_combout\);

-- Location: FF_X38_Y30_N23
\inst|Sortida_Estat[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr27~1_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(4));

-- Location: LCCOMB_X38_Y30_N14
\inst|WideOr28~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr28~1_combout\ = (!\inst|Estat.E12~q\ & !\inst|Estat.E9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E12~q\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|WideOr28~1_combout\);

-- Location: LCCOMB_X39_Y30_N28
\inst|WideOr28\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr28~combout\ = ((\inst|Estat.E8~q\) # ((\inst|Estat.E10~q\) # (!\inst|WideOr28~1_combout\))) # (!\inst|WideOr28~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr28~0_combout\,
	datab => \inst|Estat.E8~q\,
	datac => \inst|Estat.E10~q\,
	datad => \inst|WideOr28~1_combout\,
	combout => \inst|WideOr28~combout\);

-- Location: FF_X39_Y30_N29
\inst|Sortida_Estat[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr28~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(3));

-- Location: LCCOMB_X37_Y30_N18
\inst|WideOr31~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr31~1_combout\ = (!\inst|Estat.E15~q\ & !\inst|Estat.E7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E15~q\,
	datad => \inst|Estat.E7~q\,
	combout => \inst|WideOr31~1_combout\);

-- Location: LCCOMB_X37_Y30_N20
\inst|WideOr29~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr29~0_combout\ = (!\inst|Estat.E20~q\ & (!\inst|Estat.E5~q\ & (!\inst|Estat.E4~q\ & !\inst|Estat.E12~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E20~q\,
	datab => \inst|Estat.E5~q\,
	datac => \inst|Estat.E4~q\,
	datad => \inst|Estat.E12~q\,
	combout => \inst|WideOr29~0_combout\);

-- Location: LCCOMB_X37_Y30_N4
\inst|WideOr29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr29~combout\ = (\inst|Estat.E13~q\) # (((\inst|Estat.E14~q\) # (!\inst|WideOr29~0_combout\)) # (!\inst|WideOr31~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E13~q\,
	datab => \inst|WideOr31~1_combout\,
	datac => \inst|Estat.E14~q\,
	datad => \inst|WideOr29~0_combout\,
	combout => \inst|WideOr29~combout\);

-- Location: FF_X37_Y30_N5
\inst|Sortida_Estat[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr29~combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(2));

-- Location: LCCOMB_X37_Y30_N12
\inst|WideOr30~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr30~1_combout\ = (\inst|Estat.E9a~q\) # ((\inst|Estat.E17~q\) # ((\inst|Estat.E9~q\) # (!\inst|Estat.E0~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E9a~q\,
	datab => \inst|Estat.E17~q\,
	datac => \inst|Estat.E9~q\,
	datad => \inst|Estat.E0~q\,
	combout => \inst|WideOr30~1_combout\);

-- Location: LCCOMB_X38_Y30_N0
\inst|WideOr30~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr30~0_combout\ = (!\inst|Estat.E8~q\ & !\inst|Estat.E16~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E8~q\,
	datac => \inst|Estat.E16~q\,
	combout => \inst|WideOr30~0_combout\);

-- Location: LCCOMB_X37_Y30_N6
\inst|WideOr30~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr30~2_combout\ = (\inst|Estat.E1~q\) # ((\inst|Estat.E1a~q\) # (\inst|Estat.E13~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E1~q\,
	datac => \inst|Estat.E1a~q\,
	datad => \inst|Estat.E13~q\,
	combout => \inst|WideOr30~2_combout\);

-- Location: LCCOMB_X37_Y30_N26
\inst|WideOr30~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr30~3_combout\ = (!\inst|WideOr30~1_combout\ & (\inst|WideOr29~0_combout\ & (\inst|WideOr30~0_combout\ & !\inst|WideOr30~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr30~1_combout\,
	datab => \inst|WideOr29~0_combout\,
	datac => \inst|WideOr30~0_combout\,
	datad => \inst|WideOr30~2_combout\,
	combout => \inst|WideOr30~3_combout\);

-- Location: FF_X37_Y30_N27
\inst|Sortida_Estat[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr30~3_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(1));

-- Location: LCCOMB_X36_Y30_N26
\inst|WideOr31~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr31~2_combout\ = (\inst|Estat.E1~q\) # ((\inst|Estat.E5~q\) # ((\inst|Estat.E9a~q\) # (\inst|Estat.E1a~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E1~q\,
	datab => \inst|Estat.E5~q\,
	datac => \inst|Estat.E9a~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|WideOr31~2_combout\);

-- Location: LCCOMB_X36_Y30_N22
\inst|Sortida_Estat~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Sortida_Estat~1_combout\ = (\Reset~input_o\) # ((!\inst|WideOr31~2_combout\ & (\inst|WideOr31~0_combout\ & \inst|WideOr31~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr31~2_combout\,
	datab => \Reset~input_o\,
	datac => \inst|WideOr31~0_combout\,
	datad => \inst|WideOr31~1_combout\,
	combout => \inst|Sortida_Estat~1_combout\);

-- Location: FF_X36_Y30_N23
\inst|Sortida_Estat[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Sortida_Estat~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Sortida_Estat\(0));

-- Location: IOIBUF_X46_Y0_N1
\c~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_c,
	o => \c~input_o\);

ww_l_sor1 <= \l_sor1~output_o\;

ww_l_sor2 <= \l_sor2~output_o\;

ww_e_reg <= \e_reg~output_o\;

ww_l_mem <= \l_mem~output_o\;

ww_e_mem <= \e_mem~output_o\;

ww_e_mar <= \e_mar~output_o\;

ww_l_mdr <= \l_mdr~output_o\;

ww_e_mdr <= \e_mdr~output_o\;

ww_e_ir <= \e_ir~output_o\;

ww_l_pc <= \l_pc~output_o\;

ww_e_pc <= \e_pc~output_o\;

ww_pc_sup <= \pc_sup~output_o\;

ww_inc_pc <= \inc_pc~output_o\;

ww_l_desp1 <= \l_desp1~output_o\;

ww_l_desp2 <= \l_desp2~output_o\;

ww_l_extsign <= \l_extsign~output_o\;

ww_l_acc <= \l_acc~output_o\;

ww_e_acc <= \e_acc~output_o\;

ww_Tancar <= \Tancar~output_o\;

ww_mux_dest(1) <= \mux_dest[1]~output_o\;

ww_mux_dest(0) <= \mux_dest[0]~output_o\;

ww_op_alu(2) <= \op_alu[2]~output_o\;

ww_op_alu(1) <= \op_alu[1]~output_o\;

ww_op_alu(0) <= \op_alu[0]~output_o\;

ww_Sortida_Estat(31) <= \Sortida_Estat[31]~output_o\;

ww_Sortida_Estat(30) <= \Sortida_Estat[30]~output_o\;

ww_Sortida_Estat(29) <= \Sortida_Estat[29]~output_o\;

ww_Sortida_Estat(28) <= \Sortida_Estat[28]~output_o\;

ww_Sortida_Estat(27) <= \Sortida_Estat[27]~output_o\;

ww_Sortida_Estat(26) <= \Sortida_Estat[26]~output_o\;

ww_Sortida_Estat(25) <= \Sortida_Estat[25]~output_o\;

ww_Sortida_Estat(24) <= \Sortida_Estat[24]~output_o\;

ww_Sortida_Estat(23) <= \Sortida_Estat[23]~output_o\;

ww_Sortida_Estat(22) <= \Sortida_Estat[22]~output_o\;

ww_Sortida_Estat(21) <= \Sortida_Estat[21]~output_o\;

ww_Sortida_Estat(20) <= \Sortida_Estat[20]~output_o\;

ww_Sortida_Estat(19) <= \Sortida_Estat[19]~output_o\;

ww_Sortida_Estat(18) <= \Sortida_Estat[18]~output_o\;

ww_Sortida_Estat(17) <= \Sortida_Estat[17]~output_o\;

ww_Sortida_Estat(16) <= \Sortida_Estat[16]~output_o\;

ww_Sortida_Estat(15) <= \Sortida_Estat[15]~output_o\;

ww_Sortida_Estat(14) <= \Sortida_Estat[14]~output_o\;

ww_Sortida_Estat(13) <= \Sortida_Estat[13]~output_o\;

ww_Sortida_Estat(12) <= \Sortida_Estat[12]~output_o\;

ww_Sortida_Estat(11) <= \Sortida_Estat[11]~output_o\;

ww_Sortida_Estat(10) <= \Sortida_Estat[10]~output_o\;

ww_Sortida_Estat(9) <= \Sortida_Estat[9]~output_o\;

ww_Sortida_Estat(8) <= \Sortida_Estat[8]~output_o\;

ww_Sortida_Estat(7) <= \Sortida_Estat[7]~output_o\;

ww_Sortida_Estat(6) <= \Sortida_Estat[6]~output_o\;

ww_Sortida_Estat(5) <= \Sortida_Estat[5]~output_o\;

ww_Sortida_Estat(4) <= \Sortida_Estat[4]~output_o\;

ww_Sortida_Estat(3) <= \Sortida_Estat[3]~output_o\;

ww_Sortida_Estat(2) <= \Sortida_Estat[2]~output_o\;

ww_Sortida_Estat(1) <= \Sortida_Estat[1]~output_o\;

ww_Sortida_Estat(0) <= \Sortida_Estat[0]~output_o\;
END structure;


