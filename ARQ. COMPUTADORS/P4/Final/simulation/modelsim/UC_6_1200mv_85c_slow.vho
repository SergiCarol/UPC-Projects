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
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "05/12/2014 14:25:10"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
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

ENTITY 	UC_simbol IS
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
	op_alu : OUT std_logic_vector(2 DOWNTO 0)
	);
END UC_simbol;

-- Design Ports Information
-- l_sor1	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_sor2	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_reg	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_mem	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mem	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mar	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_mdr	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_mdr	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_ir	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_pc	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_pc	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- pc_sup	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inc_pc	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_desp1	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_desp2	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_extsign	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- l_acc	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- e_acc	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Tancar	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mux_dest[1]	=>  Location: PIN_E13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- mux_dest[0]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[2]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[1]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- op_alu[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[5]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[4]	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[2]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[0]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[3]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- func[1]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[5]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[0]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[1]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[4]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[2]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- co[3]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Reset	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- z	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF UC_simbol IS
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
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Reset~input_o\ : std_logic;
SIGNAL \func[4]~input_o\ : std_logic;
SIGNAL \func[0]~input_o\ : std_logic;
SIGNAL \func[2]~input_o\ : std_logic;
SIGNAL \func[5]~input_o\ : std_logic;
SIGNAL \inst|Equal6~0_combout\ : std_logic;
SIGNAL \func[3]~input_o\ : std_logic;
SIGNAL \func[1]~input_o\ : std_logic;
SIGNAL \inst|Equal6~1_combout\ : std_logic;
SIGNAL \co[4]~input_o\ : std_logic;
SIGNAL \co[1]~input_o\ : std_logic;
SIGNAL \co[2]~input_o\ : std_logic;
SIGNAL \co[0]~input_o\ : std_logic;
SIGNAL \inst|Equal0~0_combout\ : std_logic;
SIGNAL \co[3]~input_o\ : std_logic;
SIGNAL \inst|Equal4~0_combout\ : std_logic;
SIGNAL \co[5]~input_o\ : std_logic;
SIGNAL \inst|Estat~65_combout\ : std_logic;
SIGNAL \inst|Equal12~0_combout\ : std_logic;
SIGNAL \inst|Estat~64_combout\ : std_logic;
SIGNAL \z~input_o\ : std_logic;
SIGNAL \inst|Estat~91_combout\ : std_logic;
SIGNAL \inst|Estat.E7~q\ : std_logic;
SIGNAL \inst|Estat~67_combout\ : std_logic;
SIGNAL \inst|Estat.E8~q\ : std_logic;
SIGNAL \inst|Selector0~1_combout\ : std_logic;
SIGNAL \inst|Equal7~3_combout\ : std_logic;
SIGNAL \inst|Equal9~0_combout\ : std_logic;
SIGNAL \inst|Estat~71_combout\ : std_logic;
SIGNAL \inst|Equal7~2_combout\ : std_logic;
SIGNAL \inst|Estat~69_combout\ : std_logic;
SIGNAL \inst|Selector11~0_combout\ : std_logic;
SIGNAL \inst|Estat~86_combout\ : std_logic;
SIGNAL \inst|Estat~87_combout\ : std_logic;
SIGNAL \inst|Estat.E9~q\ : std_logic;
SIGNAL \inst|Estat~90_combout\ : std_logic;
SIGNAL \inst|Estat.E9a~q\ : std_logic;
SIGNAL \inst|Equal13~0_combout\ : std_logic;
SIGNAL \inst|Estat~70_combout\ : std_logic;
SIGNAL \inst|Estat~73_combout\ : std_logic;
SIGNAL \inst|Estat.E14i~q\ : std_logic;
SIGNAL \inst|Estat~93_combout\ : std_logic;
SIGNAL \inst|Estat~74_combout\ : std_logic;
SIGNAL \inst|Estat.E15i~q\ : std_logic;
SIGNAL \inst|Equal12~1_combout\ : std_logic;
SIGNAL \inst|Estat~72_combout\ : std_logic;
SIGNAL \inst|Estat.E11i~q\ : std_logic;
SIGNAL \inst|Selector13~0_combout\ : std_logic;
SIGNAL \inst|Estat.E12i~q\ : std_logic;
SIGNAL \inst|WideOr16~2_wirecell_combout\ : std_logic;
SIGNAL \inst|Estat.E12~q\ : std_logic;
SIGNAL \inst|Selector0~3_combout\ : std_logic;
SIGNAL \inst|Estat~81_combout\ : std_logic;
SIGNAL \inst|Estat~82_combout\ : std_logic;
SIGNAL \inst|Estat.E18~q\ : std_logic;
SIGNAL \inst|Estat~89_combout\ : std_logic;
SIGNAL \inst|Estat.E19~q\ : std_logic;
SIGNAL \inst|Estat~88_combout\ : std_logic;
SIGNAL \inst|Estat.E17~q\ : std_logic;
SIGNAL \inst|WideOr22~0_combout\ : std_logic;
SIGNAL \inst|Estat.E0~0_combout\ : std_logic;
SIGNAL \inst|Estat.E0~q\ : std_logic;
SIGNAL \inst|Selector0~0_combout\ : std_logic;
SIGNAL \inst|Estat~66_combout\ : std_logic;
SIGNAL \inst|Estat.E20~q\ : std_logic;
SIGNAL \inst|Estat~94_combout\ : std_logic;
SIGNAL \inst|Estat.E2~q\ : std_logic;
SIGNAL \inst|Estat~68_combout\ : std_logic;
SIGNAL \inst|Estat.E3~q\ : std_logic;
SIGNAL \inst|Estat~83_combout\ : std_logic;
SIGNAL \inst|Estat~84_combout\ : std_logic;
SIGNAL \inst|Estat.E4~q\ : std_logic;
SIGNAL \inst|Selector5~0_combout\ : std_logic;
SIGNAL \inst|Selector5~1_combout\ : std_logic;
SIGNAL \inst|Estat.E5~q\ : std_logic;
SIGNAL \inst|Selector0~2_combout\ : std_logic;
SIGNAL \inst|Selector0~4_combout\ : std_logic;
SIGNAL \inst|Selector0~5_combout\ : std_logic;
SIGNAL \inst|Estat.E1~q\ : std_logic;
SIGNAL \inst|Estat~85_combout\ : std_logic;
SIGNAL \inst|Estat.E1a~q\ : std_logic;
SIGNAL \inst|Estat~92_combout\ : std_logic;
SIGNAL \inst|Selector11~1_combout\ : std_logic;
SIGNAL \inst|Estat.E10~q\ : std_logic;
SIGNAL \inst|Equal9~1_combout\ : std_logic;
SIGNAL \inst|Estat~80_combout\ : std_logic;
SIGNAL \inst|Estat.E14~q\ : std_logic;
SIGNAL \inst|Equal7~4_combout\ : std_logic;
SIGNAL \inst|Estat~78_combout\ : std_logic;
SIGNAL \inst|Estat.E11~q\ : std_logic;
SIGNAL \inst|Equal8~0_combout\ : std_logic;
SIGNAL \inst|Estat~79_combout\ : std_logic;
SIGNAL \inst|Estat.E13~q\ : std_logic;
SIGNAL \inst|Estat~76_combout\ : std_logic;
SIGNAL \inst|Estat~77_combout\ : std_logic;
SIGNAL \inst|Estat.E16~q\ : std_logic;
SIGNAL \inst|Equal10~0_combout\ : std_logic;
SIGNAL \inst|Estat~75_combout\ : std_logic;
SIGNAL \inst|Estat.E15~q\ : std_logic;
SIGNAL \inst|WideOr16~1_combout\ : std_logic;
SIGNAL \inst|WideOr16~2_combout\ : std_logic;
SIGNAL \inst|WideOr16~0_combout\ : std_logic;
SIGNAL \inst|WideOr16~combout\ : std_logic;
SIGNAL \inst|WideOr16~3_combout\ : std_logic;
SIGNAL \inst|WideOr18~0_combout\ : std_logic;
SIGNAL \inst|l_mem~combout\ : std_logic;
SIGNAL \inst|l_mdr~combout\ : std_logic;
SIGNAL \inst|WideOr21~combout\ : std_logic;
SIGNAL \inst|WideOr22~combout\ : std_logic;
SIGNAL \inst|l_desp1~combout\ : std_logic;
SIGNAL \inst|WideOr24~0_combout\ : std_logic;
SIGNAL \inst|WideOr24~combout\ : std_logic;
SIGNAL \inst|WideOr25~0_combout\ : std_logic;
SIGNAL \inst|WideOr26~0_combout\ : std_logic;
SIGNAL \inst|WideOr27~0_combout\ : std_logic;
SIGNAL \inst|WideOr28~0_combout\ : std_logic;
SIGNAL \inst|WideOr28~1_combout\ : std_logic;
SIGNAL \inst|WideOr29~combout\ : std_logic;
SIGNAL \ALT_INV_clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr27~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr22~0_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr16~3_combout\ : std_logic;
SIGNAL \inst|ALT_INV_WideOr16~0_combout\ : std_logic;

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
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clk~inputclkctrl_outclk\ <= NOT \clk~inputclkctrl_outclk\;
\inst|ALT_INV_WideOr27~0_combout\ <= NOT \inst|WideOr27~0_combout\;
\inst|ALT_INV_WideOr22~0_combout\ <= NOT \inst|WideOr22~0_combout\;
\inst|ALT_INV_WideOr16~3_combout\ <= NOT \inst|WideOr16~3_combout\;
\inst|ALT_INV_WideOr16~0_combout\ <= NOT \inst|WideOr16~0_combout\;

-- Location: IOOBUF_X24_Y31_N2
\l_sor1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr16~combout\,
	devoe => ww_devoe,
	o => \l_sor1~output_o\);

-- Location: IOOBUF_X20_Y31_N9
\l_sor2~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr16~3_combout\,
	devoe => ww_devoe,
	o => \l_sor2~output_o\);

-- Location: IOOBUF_X20_Y31_N2
\e_reg~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr18~0_combout\,
	devoe => ww_devoe,
	o => \e_reg~output_o\);

-- Location: IOOBUF_X10_Y31_N2
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

-- Location: IOOBUF_X12_Y0_N2
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

-- Location: IOOBUF_X12_Y31_N9
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

-- Location: IOOBUF_X33_Y12_N2
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

-- Location: IOOBUF_X12_Y31_N2
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

-- Location: IOOBUF_X29_Y0_N9
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

-- Location: IOOBUF_X33_Y22_N9
\l_pc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr21~combout\,
	devoe => ww_devoe,
	o => \l_pc~output_o\);

-- Location: IOOBUF_X33_Y14_N9
\e_pc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr22~combout\,
	devoe => ww_devoe,
	o => \e_pc~output_o\);

-- Location: IOOBUF_X26_Y31_N9
\pc_sup~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr22~0_combout\,
	devoe => ww_devoe,
	o => \pc_sup~output_o\);

-- Location: IOOBUF_X29_Y0_N2
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

-- Location: IOOBUF_X33_Y12_N9
\l_desp1~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|l_desp1~combout\,
	devoe => ww_devoe,
	o => \l_desp1~output_o\);

-- Location: IOOBUF_X29_Y31_N9
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

-- Location: IOOBUF_X33_Y27_N2
\l_extsign~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr16~0_combout\,
	devoe => ww_devoe,
	o => \l_extsign~output_o\);

-- Location: IOOBUF_X22_Y31_N9
\l_acc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr24~combout\,
	devoe => ww_devoe,
	o => \l_acc~output_o\);

-- Location: IOOBUF_X14_Y31_N9
\e_acc~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr25~0_combout\,
	devoe => ww_devoe,
	o => \e_acc~output_o\);

-- Location: IOOBUF_X14_Y31_N2
\Tancar~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr26~0_combout\,
	devoe => ww_devoe,
	o => \Tancar~output_o\);

-- Location: IOOBUF_X33_Y25_N9
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

-- Location: IOOBUF_X33_Y24_N9
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

-- Location: IOOBUF_X33_Y28_N9
\op_alu[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|ALT_INV_WideOr27~0_combout\,
	devoe => ww_devoe,
	o => \op_alu[2]~output_o\);

-- Location: IOOBUF_X33_Y22_N2
\op_alu[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr28~1_combout\,
	devoe => ww_devoe,
	o => \op_alu[1]~output_o\);

-- Location: IOOBUF_X33_Y15_N9
\op_alu[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \inst|WideOr29~combout\,
	devoe => ww_devoe,
	o => \op_alu[0]~output_o\);

-- Location: IOIBUF_X16_Y0_N15
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

-- Location: IOIBUF_X33_Y28_N1
\Reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Reset,
	o => \Reset~input_o\);

-- Location: IOIBUF_X33_Y15_N1
\func[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(4),
	o => \func[4]~input_o\);

-- Location: IOIBUF_X33_Y24_N1
\func[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(0),
	o => \func[0]~input_o\);

-- Location: IOIBUF_X33_Y25_N1
\func[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(2),
	o => \func[2]~input_o\);

-- Location: IOIBUF_X33_Y14_N1
\func[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(5),
	o => \func[5]~input_o\);

-- Location: LCCOMB_X32_Y29_N12
\inst|Equal6~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal6~0_combout\ = (!\func[4]~input_o\ & (!\func[0]~input_o\ & (!\func[2]~input_o\ & !\func[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[4]~input_o\,
	datab => \func[0]~input_o\,
	datac => \func[2]~input_o\,
	datad => \func[5]~input_o\,
	combout => \inst|Equal6~0_combout\);

-- Location: IOIBUF_X31_Y31_N1
\func[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(3),
	o => \func[3]~input_o\);

-- Location: IOIBUF_X33_Y27_N8
\func[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_func(1),
	o => \func[1]~input_o\);

-- Location: LCCOMB_X32_Y29_N26
\inst|Equal6~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal6~1_combout\ = (\inst|Equal6~0_combout\ & (\func[3]~input_o\ & !\func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal6~0_combout\,
	datac => \func[3]~input_o\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal6~1_combout\);

-- Location: IOIBUF_X16_Y31_N8
\co[4]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(4),
	o => \co[4]~input_o\);

-- Location: IOIBUF_X16_Y31_N1
\co[1]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(1),
	o => \co[1]~input_o\);

-- Location: IOIBUF_X26_Y31_N1
\co[2]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(2),
	o => \co[2]~input_o\);

-- Location: IOIBUF_X22_Y31_N1
\co[0]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(0),
	o => \co[0]~input_o\);

-- Location: LCCOMB_X27_Y29_N12
\inst|Equal0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal0~0_combout\ = (!\co[4]~input_o\ & (\co[1]~input_o\ & (!\co[2]~input_o\ & \co[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[4]~input_o\,
	datab => \co[1]~input_o\,
	datac => \co[2]~input_o\,
	datad => \co[0]~input_o\,
	combout => \inst|Equal0~0_combout\);

-- Location: IOIBUF_X29_Y31_N1
\co[3]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(3),
	o => \co[3]~input_o\);

-- Location: LCCOMB_X27_Y29_N22
\inst|Equal4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal4~0_combout\ = (!\co[4]~input_o\ & (\co[1]~input_o\ & (!\co[2]~input_o\ & !\co[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[4]~input_o\,
	datab => \co[1]~input_o\,
	datac => \co[2]~input_o\,
	datad => \co[0]~input_o\,
	combout => \inst|Equal4~0_combout\);

-- Location: IOIBUF_X31_Y31_N8
\co[5]~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_co(5),
	o => \co[5]~input_o\);

-- Location: LCCOMB_X27_Y29_N28
\inst|Estat~65\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~65_combout\ = (\co[3]~input_o\) # ((\co[5]~input_o\) # ((!\inst|Equal0~0_combout\ & !\inst|Equal4~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[3]~input_o\,
	datac => \inst|Equal4~0_combout\,
	datad => \co[5]~input_o\,
	combout => \inst|Estat~65_combout\);

-- Location: LCCOMB_X27_Y29_N2
\inst|Equal12~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal12~0_combout\ = (!\co[4]~input_o\ & (!\co[1]~input_o\ & !\co[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[4]~input_o\,
	datab => \co[1]~input_o\,
	datad => \co[5]~input_o\,
	combout => \inst|Equal12~0_combout\);

-- Location: LCCOMB_X27_Y29_N8
\inst|Estat~64\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~64_combout\ = (\inst|Equal12~0_combout\ & (\co[2]~input_o\ & !\co[3]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Equal12~0_combout\,
	datac => \co[2]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Estat~64_combout\);

-- Location: IOIBUF_X24_Y31_N8
\z~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_z,
	o => \z~input_o\);

-- Location: LCCOMB_X29_Y29_N4
\inst|Estat~91\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~91_combout\ = (\inst|Estat.E1a~q\ & (\inst|Estat~64_combout\ & !\Reset~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E1a~q\,
	datac => \inst|Estat~64_combout\,
	datad => \Reset~input_o\,
	combout => \inst|Estat~91_combout\);

-- Location: FF_X29_Y29_N5
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

-- Location: LCCOMB_X27_Y29_N0
\inst|Estat~67\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~67_combout\ = (!\Reset~input_o\ & \inst|Estat.E7~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datac => \inst|Estat.E7~q\,
	combout => \inst|Estat~67_combout\);

-- Location: FF_X27_Y29_N1
\inst|Estat.E8\ : dffeas
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
	q => \inst|Estat.E8~q\);

-- Location: LCCOMB_X27_Y29_N16
\inst|Selector0~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~1_combout\ = (\inst|Estat~64_combout\ & (\inst|Estat.E8~q\ & (\co[0]~input_o\ $ (!\z~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \inst|Estat~64_combout\,
	datac => \z~input_o\,
	datad => \inst|Estat.E8~q\,
	combout => \inst|Selector0~1_combout\);

-- Location: LCCOMB_X32_Y29_N0
\inst|Equal7~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal7~3_combout\ = (!\func[3]~input_o\ & !\func[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \func[3]~input_o\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal7~3_combout\);

-- Location: LCCOMB_X32_Y29_N30
\inst|Equal9~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal9~0_combout\ = (!\func[4]~input_o\ & (\func[2]~input_o\ & (\func[5]~input_o\ & \inst|Equal7~3_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[4]~input_o\,
	datab => \func[2]~input_o\,
	datac => \func[5]~input_o\,
	datad => \inst|Equal7~3_combout\,
	combout => \inst|Equal9~0_combout\);

-- Location: LCCOMB_X27_Y29_N20
\inst|Estat~71\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~71_combout\ = (\inst|Equal12~0_combout\ & (\co[3]~input_o\ & ((\co[2]~input_o\) # (!\co[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \inst|Equal12~0_combout\,
	datac => \co[2]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Estat~71_combout\);

-- Location: LCCOMB_X32_Y29_N20
\inst|Equal7~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal7~2_combout\ = (!\func[4]~input_o\ & (!\func[0]~input_o\ & (!\func[2]~input_o\ & \func[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[4]~input_o\,
	datab => \func[0]~input_o\,
	datac => \func[2]~input_o\,
	datad => \func[5]~input_o\,
	combout => \inst|Equal7~2_combout\);

-- Location: LCCOMB_X32_Y29_N10
\inst|Estat~69\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~69_combout\ = (\inst|Estat.E10~q\ & (((!\func[1]~input_o\ & \func[3]~input_o\)) # (!\inst|Equal7~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \func[1]~input_o\,
	datab => \func[3]~input_o\,
	datac => \inst|Equal7~2_combout\,
	datad => \inst|Estat.E10~q\,
	combout => \inst|Estat~69_combout\);

-- Location: LCCOMB_X32_Y29_N28
\inst|Selector11~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~0_combout\ = (!\inst|Equal9~0_combout\ & (!\inst|Estat~71_combout\ & \inst|Estat~69_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal9~0_combout\,
	datac => \inst|Estat~71_combout\,
	datad => \inst|Estat~69_combout\,
	combout => \inst|Selector11~0_combout\);

-- Location: LCCOMB_X27_Y29_N10
\inst|Estat~86\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~86_combout\ = (!\Reset~input_o\ & \inst|Estat.E8~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \inst|Estat.E8~q\,
	combout => \inst|Estat~86_combout\);

-- Location: LCCOMB_X29_Y29_N16
\inst|Estat~87\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~87_combout\ = (\inst|Estat~86_combout\ & ((\z~input_o\ $ (\co[0]~input_o\)) # (!\inst|Estat~64_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \z~input_o\,
	datab => \co[0]~input_o\,
	datac => \inst|Estat~64_combout\,
	datad => \inst|Estat~86_combout\,
	combout => \inst|Estat~87_combout\);

-- Location: FF_X29_Y29_N17
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

-- Location: LCCOMB_X29_Y29_N6
\inst|Estat~90\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~90_combout\ = (!\Reset~input_o\ & \inst|Estat.E9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|Estat~90_combout\);

-- Location: FF_X30_Y29_N9
\inst|Estat.E9a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \inst|Estat~90_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E9a~q\);

-- Location: LCCOMB_X27_Y29_N6
\inst|Equal13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal13~0_combout\ = (!\co[0]~input_o\ & (\inst|Equal12~0_combout\ & (\co[2]~input_o\ & \co[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \inst|Equal12~0_combout\,
	datac => \co[2]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Equal13~0_combout\);

-- Location: LCCOMB_X31_Y29_N4
\inst|Estat~70\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~70_combout\ = (!\inst|Equal9~0_combout\ & \inst|Estat~69_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal9~0_combout\,
	datac => \inst|Estat~69_combout\,
	combout => \inst|Estat~70_combout\);

-- Location: LCCOMB_X31_Y29_N20
\inst|Estat~73\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~73_combout\ = (\inst|Equal13~0_combout\ & (!\Reset~input_o\ & (\inst|Estat~70_combout\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal13~0_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat~70_combout\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~73_combout\);

-- Location: FF_X31_Y29_N21
\inst|Estat.E14i\ : dffeas
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
	q => \inst|Estat.E14i~q\);

-- Location: LCCOMB_X27_Y29_N24
\inst|Estat~93\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~93_combout\ = (((!\co[3]~input_o\) # (!\co[2]~input_o\)) # (!\inst|Equal12~0_combout\)) # (!\co[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \inst|Equal12~0_combout\,
	datac => \co[2]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Estat~93_combout\);

-- Location: LCCOMB_X31_Y29_N26
\inst|Estat~74\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~74_combout\ = (!\inst|Equal9~0_combout\ & (!\Reset~input_o\ & (\inst|Estat~69_combout\ & !\inst|Estat~93_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal9~0_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat~69_combout\,
	datad => \inst|Estat~93_combout\,
	combout => \inst|Estat~74_combout\);

-- Location: FF_X31_Y29_N27
\inst|Estat.E15i\ : dffeas
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
	q => \inst|Estat.E15i~q\);

-- Location: LCCOMB_X27_Y29_N14
\inst|Equal12~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal12~1_combout\ = (!\co[0]~input_o\ & (\inst|Equal12~0_combout\ & (!\co[2]~input_o\ & \co[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \co[0]~input_o\,
	datab => \inst|Equal12~0_combout\,
	datac => \co[2]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Equal12~1_combout\);

-- Location: LCCOMB_X31_Y29_N2
\inst|Estat~72\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~72_combout\ = (\inst|Equal12~1_combout\ & (!\Reset~input_o\ & (\inst|Estat~70_combout\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal12~1_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat~70_combout\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~72_combout\);

-- Location: FF_X31_Y29_N3
\inst|Estat.E11i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~72_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E11i~q\);

-- Location: LCCOMB_X31_Y29_N12
\inst|Selector13~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector13~0_combout\ = (\inst|Estat.E14i~q\) # ((\inst|Estat.E15i~q\) # (\inst|Estat.E11i~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E14i~q\,
	datac => \inst|Estat.E15i~q\,
	datad => \inst|Estat.E11i~q\,
	combout => \inst|Selector13~0_combout\);

-- Location: FF_X31_Y29_N13
\inst|Estat.E12i\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Selector13~0_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E12i~q\);

-- Location: LCCOMB_X29_Y29_N28
\inst|WideOr16~2_wirecell\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~2_wirecell_combout\ = !\inst|WideOr16~2_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \inst|WideOr16~2_combout\,
	combout => \inst|WideOr16~2_wirecell_combout\);

-- Location: FF_X29_Y29_N29
\inst|Estat.E12\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|WideOr16~2_wirecell_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E12~q\);

-- Location: LCCOMB_X30_Y29_N10
\inst|Selector0~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~3_combout\ = (\inst|Estat.E9a~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E12~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E9a~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E12~q\,
	combout => \inst|Selector0~3_combout\);

-- Location: LCCOMB_X30_Y29_N22
\inst|Estat~81\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~81_combout\ = (!\Reset~input_o\ & \inst|Estat~92_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datad => \inst|Estat~92_combout\,
	combout => \inst|Estat~81_combout\);

-- Location: LCCOMB_X30_Y29_N12
\inst|Estat~82\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~82_combout\ = (\inst|Equal0~0_combout\ & (!\co[3]~input_o\ & (!\co[5]~input_o\ & \inst|Estat~81_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[3]~input_o\,
	datac => \co[5]~input_o\,
	datad => \inst|Estat~81_combout\,
	combout => \inst|Estat~82_combout\);

-- Location: FF_X30_Y29_N13
\inst|Estat.E18\ : dffeas
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
	q => \inst|Estat.E18~q\);

-- Location: LCCOMB_X30_Y29_N4
\inst|Estat~89\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~89_combout\ = (\inst|Estat.E18~q\ & !\Reset~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E18~q\,
	datac => \Reset~input_o\,
	combout => \inst|Estat~89_combout\);

-- Location: FF_X30_Y29_N5
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

-- Location: LCCOMB_X30_Y29_N6
\inst|Estat~88\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~88_combout\ = (\inst|Equal4~0_combout\ & (!\co[3]~input_o\ & (!\co[5]~input_o\ & \inst|Estat~81_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal4~0_combout\,
	datab => \co[3]~input_o\,
	datac => \co[5]~input_o\,
	datad => \inst|Estat~81_combout\,
	combout => \inst|Estat~88_combout\);

-- Location: FF_X30_Y29_N7
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

-- Location: LCCOMB_X30_Y29_N18
\inst|WideOr22~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr22~0_combout\ = (!\inst|Estat.E19~q\ & !\inst|Estat.E17~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E19~q\,
	datad => \inst|Estat.E17~q\,
	combout => \inst|WideOr22~0_combout\);

-- Location: LCCOMB_X32_Y29_N24
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

-- Location: FF_X30_Y29_N3
\inst|Estat.E0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \inst|Estat.E0~0_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E0~q\);

-- Location: LCCOMB_X30_Y29_N16
\inst|Selector0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~0_combout\ = (!\inst|Equal0~0_combout\) # (!\co[5]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \co[5]~input_o\,
	datad => \inst|Equal0~0_combout\,
	combout => \inst|Selector0~0_combout\);

-- Location: LCCOMB_X30_Y29_N0
\inst|Estat~66\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~66_combout\ = (!\Reset~input_o\ & (\inst|Estat~65_combout\ & (\inst|Equal6~1_combout\ & \inst|Estat~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Estat~65_combout\,
	datac => \inst|Equal6~1_combout\,
	datad => \inst|Estat~92_combout\,
	combout => \inst|Estat~66_combout\);

-- Location: FF_X30_Y29_N1
\inst|Estat.E20\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~66_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E20~q\);

-- Location: LCCOMB_X30_Y29_N30
\inst|Estat~94\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~94_combout\ = (!\Reset~input_o\ & (\co[5]~input_o\ & (\inst|Equal0~0_combout\ & \inst|Estat.E1a~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \co[5]~input_o\,
	datac => \inst|Equal0~0_combout\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|Estat~94_combout\);

-- Location: FF_X30_Y29_N23
\inst|Estat.E2\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \inst|Estat~94_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E2~q\);

-- Location: LCCOMB_X30_Y29_N14
\inst|Estat~68\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~68_combout\ = (!\Reset~input_o\ & \inst|Estat.E2~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datac => \inst|Estat.E2~q\,
	combout => \inst|Estat~68_combout\);

-- Location: FF_X30_Y29_N15
\inst|Estat.E3\ : dffeas
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
	q => \inst|Estat.E3~q\);

-- Location: LCCOMB_X30_Y29_N8
\inst|Estat~83\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~83_combout\ = (!\Reset~input_o\ & \inst|Estat.E3~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Estat.E3~q\,
	combout => \inst|Estat~83_combout\);

-- Location: LCCOMB_X30_Y29_N26
\inst|Estat~84\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~84_combout\ = (\inst|Equal0~0_combout\ & (!\co[3]~input_o\ & (\co[5]~input_o\ & \inst|Estat~83_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \co[3]~input_o\,
	datac => \co[5]~input_o\,
	datad => \inst|Estat~83_combout\,
	combout => \inst|Estat~84_combout\);

-- Location: FF_X30_Y29_N27
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

-- Location: LCCOMB_X30_Y29_N20
\inst|Selector5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector5~0_combout\ = (\inst|Equal0~0_combout\ & (\inst|Estat.E3~q\ & (\co[5]~input_o\ & \co[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal0~0_combout\,
	datab => \inst|Estat.E3~q\,
	datac => \co[5]~input_o\,
	datad => \co[3]~input_o\,
	combout => \inst|Selector5~0_combout\);

-- Location: LCCOMB_X31_Y29_N18
\inst|Selector5~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector5~1_combout\ = (\inst|Estat.E4~q\) # ((\inst|Selector5~0_combout\) # ((\inst|Estat.E5~q\ & \inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E4~q\,
	datab => \inst|Selector5~0_combout\,
	datac => \inst|Estat.E5~q\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Selector5~1_combout\);

-- Location: FF_X31_Y29_N19
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

-- Location: LCCOMB_X30_Y29_N28
\inst|Selector0~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~2_combout\ = (\inst|Estat.E20~q\) # ((\inst|Estat.E5~q\) # ((\inst|Selector0~0_combout\ & \inst|Estat.E3~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector0~0_combout\,
	datab => \inst|Estat.E20~q\,
	datac => \inst|Estat.E3~q\,
	datad => \inst|Estat.E5~q\,
	combout => \inst|Selector0~2_combout\);

-- Location: LCCOMB_X30_Y29_N2
\inst|Selector0~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~4_combout\ = (\inst|Selector0~3_combout\) # (((\inst|Selector0~2_combout\) # (!\inst|Estat.E0~q\)) # (!\inst|WideOr22~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector0~3_combout\,
	datab => \inst|WideOr22~0_combout\,
	datac => \inst|Estat.E0~q\,
	datad => \inst|Selector0~2_combout\,
	combout => \inst|Selector0~4_combout\);

-- Location: LCCOMB_X31_Y29_N0
\inst|Selector0~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector0~5_combout\ = (\inst|Selector0~1_combout\) # ((\inst|Selector0~4_combout\) # ((\inst|Selector11~0_combout\ & \inst|Estat.E1~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Selector0~1_combout\,
	datab => \inst|Selector11~0_combout\,
	datac => \inst|Estat.E1~q\,
	datad => \inst|Selector0~4_combout\,
	combout => \inst|Selector0~5_combout\);

-- Location: FF_X31_Y29_N1
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

-- Location: LCCOMB_X31_Y29_N30
\inst|Estat~85\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~85_combout\ = (!\Reset~input_o\ & \inst|Estat.E1~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Reset~input_o\,
	datad => \inst|Estat.E1~q\,
	combout => \inst|Estat~85_combout\);

-- Location: FF_X30_Y29_N17
\inst|Estat.E1a\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	asdata => \inst|Estat~85_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E1a~q\);

-- Location: LCCOMB_X30_Y29_N24
\inst|Estat~92\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~92_combout\ = (!\inst|Estat~64_combout\ & (\inst|Estat.E1a~q\ & ((!\co[5]~input_o\) # (!\inst|Equal0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001010100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat~64_combout\,
	datab => \inst|Equal0~0_combout\,
	datac => \co[5]~input_o\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|Estat~92_combout\);

-- Location: LCCOMB_X32_Y29_N16
\inst|Selector11~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Selector11~1_combout\ = (\inst|Selector11~0_combout\) # ((!\inst|Equal6~1_combout\ & (\inst|Estat~65_combout\ & \inst|Estat~92_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal6~1_combout\,
	datab => \inst|Estat~65_combout\,
	datac => \inst|Estat~92_combout\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Selector11~1_combout\);

-- Location: FF_X32_Y29_N17
\inst|Estat.E10\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Selector11~1_combout\,
	sclr => \Reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E10~q\);

-- Location: LCCOMB_X32_Y29_N8
\inst|Equal9~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal9~1_combout\ = (!\func[0]~input_o\ & \inst|Equal9~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \func[0]~input_o\,
	datac => \inst|Equal9~0_combout\,
	combout => \inst|Equal9~1_combout\);

-- Location: LCCOMB_X32_Y29_N22
\inst|Estat~80\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~80_combout\ = (!\Reset~input_o\ & (\inst|Estat.E10~q\ & (\inst|Equal9~1_combout\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Reset~input_o\,
	datab => \inst|Estat.E10~q\,
	datac => \inst|Equal9~1_combout\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~80_combout\);

-- Location: FF_X32_Y29_N23
\inst|Estat.E14\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~80_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E14~q\);

-- Location: LCCOMB_X32_Y29_N6
\inst|Equal7~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal7~4_combout\ = (\inst|Equal7~2_combout\ & (!\func[3]~input_o\ & !\func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal7~2_combout\,
	datac => \func[3]~input_o\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal7~4_combout\);

-- Location: LCCOMB_X31_Y29_N22
\inst|Estat~78\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~78_combout\ = (\inst|Equal7~4_combout\ & (!\Reset~input_o\ & (\inst|Estat.E10~q\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal7~4_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat.E10~q\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~78_combout\);

-- Location: FF_X31_Y29_N23
\inst|Estat.E11\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~78_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E11~q\);

-- Location: LCCOMB_X32_Y29_N14
\inst|Equal8~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal8~0_combout\ = (\inst|Equal7~2_combout\ & (!\func[3]~input_o\ & \func[1]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal7~2_combout\,
	datac => \func[3]~input_o\,
	datad => \func[1]~input_o\,
	combout => \inst|Equal8~0_combout\);

-- Location: LCCOMB_X31_Y29_N24
\inst|Estat~79\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~79_combout\ = (\inst|Equal8~0_combout\ & (!\Reset~input_o\ & (\inst|Estat.E10~q\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal8~0_combout\,
	datab => \Reset~input_o\,
	datac => \inst|Estat.E10~q\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~79_combout\);

-- Location: FF_X31_Y29_N25
\inst|Estat.E13\ : dffeas
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
	q => \inst|Estat.E13~q\);

-- Location: LCCOMB_X32_Y29_N4
\inst|Estat~76\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~76_combout\ = (!\Reset~input_o\ & \inst|Estat.E10~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Reset~input_o\,
	datad => \inst|Estat.E10~q\,
	combout => \inst|Estat~76_combout\);

-- Location: LCCOMB_X31_Y29_N8
\inst|Estat~77\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~77_combout\ = (\inst|Equal7~2_combout\ & (\func[1]~input_o\ & (\func[3]~input_o\ & \inst|Estat~76_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Equal7~2_combout\,
	datab => \func[1]~input_o\,
	datac => \func[3]~input_o\,
	datad => \inst|Estat~76_combout\,
	combout => \inst|Estat~77_combout\);

-- Location: FF_X31_Y29_N9
\inst|Estat.E16\ : dffeas
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
	q => \inst|Estat.E16~q\);

-- Location: LCCOMB_X32_Y29_N18
\inst|Equal10~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Equal10~0_combout\ = (\func[0]~input_o\ & \inst|Equal9~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \func[0]~input_o\,
	datac => \inst|Equal9~0_combout\,
	combout => \inst|Equal10~0_combout\);

-- Location: LCCOMB_X31_Y29_N10
\inst|Estat~75\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|Estat~75_combout\ = (\inst|Estat.E10~q\ & (!\Reset~input_o\ & (\inst|Equal10~0_combout\ & !\inst|Selector11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E10~q\,
	datab => \Reset~input_o\,
	datac => \inst|Equal10~0_combout\,
	datad => \inst|Selector11~0_combout\,
	combout => \inst|Estat~75_combout\);

-- Location: FF_X31_Y29_N11
\inst|Estat.E15\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_clk~inputclkctrl_outclk\,
	d => \inst|Estat~75_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \inst|Estat.E15~q\);

-- Location: LCCOMB_X31_Y29_N6
\inst|WideOr16~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~1_combout\ = (!\inst|Estat.E11~q\ & (!\inst|Estat.E13~q\ & (!\inst|Estat.E16~q\ & !\inst|Estat.E15~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E11~q\,
	datab => \inst|Estat.E13~q\,
	datac => \inst|Estat.E16~q\,
	datad => \inst|Estat.E15~q\,
	combout => \inst|WideOr16~1_combout\);

-- Location: LCCOMB_X29_Y29_N10
\inst|WideOr16~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~2_combout\ = (!\inst|Estat.E14~q\ & \inst|WideOr16~1_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E14~q\,
	datad => \inst|WideOr16~1_combout\,
	combout => \inst|WideOr16~2_combout\);

-- Location: LCCOMB_X31_Y29_N16
\inst|WideOr16~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~0_combout\ = (!\inst|Estat.E15i~q\ & (!\inst|Estat.E14i~q\ & (!\inst|Estat.E3~q\ & !\inst|Estat.E11i~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E15i~q\,
	datab => \inst|Estat.E14i~q\,
	datac => \inst|Estat.E3~q\,
	datad => \inst|Estat.E11i~q\,
	combout => \inst|WideOr16~0_combout\);

-- Location: LCCOMB_X29_Y29_N0
\inst|WideOr16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~combout\ = ((\inst|Estat.E8~q\) # ((\inst|Estat.E20~q\) # (!\inst|WideOr16~0_combout\))) # (!\inst|WideOr16~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr16~2_combout\,
	datab => \inst|Estat.E8~q\,
	datac => \inst|Estat.E20~q\,
	datad => \inst|WideOr16~0_combout\,
	combout => \inst|WideOr16~combout\);

-- Location: LCCOMB_X29_Y29_N14
\inst|WideOr16~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr16~3_combout\ = (!\inst|Estat.E14~q\ & (!\inst|Estat.E8~q\ & \inst|WideOr16~1_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E14~q\,
	datab => \inst|Estat.E8~q\,
	datad => \inst|WideOr16~1_combout\,
	combout => \inst|WideOr16~3_combout\);

-- Location: LCCOMB_X29_Y29_N24
\inst|WideOr18~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr18~0_combout\ = (\inst|Estat.E5~q\) # ((\inst|Estat.E12~q\) # ((\inst|Estat.E12i~q\) # (\inst|Estat.E18~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E5~q\,
	datab => \inst|Estat.E12~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|Estat.E18~q\,
	combout => \inst|WideOr18~0_combout\);

-- Location: LCCOMB_X27_Y29_N26
\inst|l_mem\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_mem~combout\ = (\inst|Estat.E1~q\) # (\inst|Estat.E4~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \inst|Estat.E1~q\,
	datad => \inst|Estat.E4~q\,
	combout => \inst|l_mem~combout\);

-- Location: LCCOMB_X29_Y29_N26
\inst|l_mdr\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_mdr~combout\ = (\inst|Estat.E5~q\) # (\inst|Estat.E1a~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E5~q\,
	datad => \inst|Estat.E1a~q\,
	combout => \inst|l_mdr~combout\);

-- Location: LCCOMB_X29_Y29_N2
\inst|WideOr21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr21~combout\ = (\inst|Estat.E18~q\) # ((\inst|Estat.E9~q\) # ((\inst|Estat.E1~q\) # (!\inst|WideOr22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E18~q\,
	datab => \inst|Estat.E9~q\,
	datac => \inst|Estat.E1~q\,
	datad => \inst|WideOr22~0_combout\,
	combout => \inst|WideOr21~combout\);

-- Location: LCCOMB_X29_Y29_N20
\inst|WideOr22\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr22~combout\ = (\inst|Estat.E19~q\) # ((\inst|Estat.E20~q\) # ((\inst|Estat.E9a~q\) # (\inst|Estat.E17~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E19~q\,
	datab => \inst|Estat.E20~q\,
	datac => \inst|Estat.E9a~q\,
	datad => \inst|Estat.E17~q\,
	combout => \inst|WideOr22~combout\);

-- Location: LCCOMB_X29_Y29_N18
\inst|l_desp1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|l_desp1~combout\ = (\inst|Estat.E17~q\) # (\inst|Estat.E9~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E17~q\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|l_desp1~combout\);

-- Location: LCCOMB_X29_Y29_N8
\inst|WideOr24~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr24~0_combout\ = (!\inst|Estat.E9a~q\ & (!\inst|Estat.E12~q\ & (!\inst|Estat.E12i~q\ & \inst|WideOr22~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E9a~q\,
	datab => \inst|Estat.E12~q\,
	datac => \inst|Estat.E12i~q\,
	datad => \inst|WideOr22~0_combout\,
	combout => \inst|WideOr24~0_combout\);

-- Location: LCCOMB_X27_Y29_N4
\inst|WideOr24\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr24~combout\ = ((\inst|Estat.E9~q\) # (\inst|Estat.E4~q\)) # (!\inst|WideOr24~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr24~0_combout\,
	datab => \inst|Estat.E9~q\,
	datad => \inst|Estat.E4~q\,
	combout => \inst|WideOr24~combout\);

-- Location: LCCOMB_X27_Y29_N18
\inst|WideOr25~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr25~0_combout\ = (((\inst|Estat.E9~q\) # (!\inst|WideOr16~0_combout\)) # (!\inst|WideOr22~0_combout\)) # (!\inst|WideOr16~2_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr16~2_combout\,
	datab => \inst|WideOr22~0_combout\,
	datac => \inst|WideOr16~0_combout\,
	datad => \inst|Estat.E9~q\,
	combout => \inst|WideOr25~0_combout\);

-- Location: LCCOMB_X29_Y29_N30
\inst|WideOr26~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr26~0_combout\ = (\inst|Estat.E18~q\) # ((\inst|Estat.E20~q\) # (\inst|Estat.E4~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E18~q\,
	datac => \inst|Estat.E20~q\,
	datad => \inst|Estat.E4~q\,
	combout => \inst|WideOr26~0_combout\);

-- Location: LCCOMB_X31_Y29_N28
\inst|WideOr27~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr27~0_combout\ = (!\inst|Estat.E8~q\ & (!\inst|Estat.E13~q\ & !\inst|Estat.E16~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E8~q\,
	datab => \inst|Estat.E13~q\,
	datad => \inst|Estat.E16~q\,
	combout => \inst|WideOr27~0_combout\);

-- Location: LCCOMB_X29_Y29_N12
\inst|WideOr28~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr28~0_combout\ = (\inst|Estat.E17~q\) # ((\inst|Estat.E9~q\) # ((\inst|Estat.E3~q\) # (\inst|Estat.E19~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|Estat.E17~q\,
	datab => \inst|Estat.E9~q\,
	datac => \inst|Estat.E3~q\,
	datad => \inst|Estat.E19~q\,
	combout => \inst|WideOr28~0_combout\);

-- Location: LCCOMB_X29_Y29_N22
\inst|WideOr28~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr28~1_combout\ = (\inst|WideOr28~0_combout\) # (((\inst|Estat.E11i~q\) # (\inst|Estat.E11~q\)) # (!\inst|WideOr27~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \inst|WideOr28~0_combout\,
	datab => \inst|WideOr27~0_combout\,
	datac => \inst|Estat.E11i~q\,
	datad => \inst|Estat.E11~q\,
	combout => \inst|WideOr28~1_combout\);

-- Location: LCCOMB_X31_Y29_N14
\inst|WideOr29\ : cycloneiv_lcell_comb
-- Equation(s):
-- \inst|WideOr29~combout\ = (\inst|Estat.E15~q\) # ((\inst|Estat.E15i~q\) # (\inst|Estat.E16~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \inst|Estat.E15~q\,
	datac => \inst|Estat.E15i~q\,
	datad => \inst|Estat.E16~q\,
	combout => \inst|WideOr29~combout\);

-- Location: IOIBUF_X26_Y0_N8
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
END structure;


