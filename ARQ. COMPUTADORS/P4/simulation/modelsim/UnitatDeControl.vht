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

-- ***************************************************************************
-- This file contains a Vhdl test bench template that is freely editable to   
-- suit user's needs .Comments are provided in each section to help the user  
-- fill out necessary details.                                                
-- ***************************************************************************
-- Generated on "05/11/2014 18:07:41"
                                                            
-- Vhdl Test Bench template for design  :  UnitatDeControl
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;                              

ENTITY UnitatDeControl_vhd_tst IS
END UnitatDeControl_vhd_tst;
ARCHITECTURE UnitatDeControl_arch OF UnitatDeControl_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL c : STD_LOGIC;
SIGNAL clk : STD_LOGIC;
SIGNAL co : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL e_acc : STD_LOGIC;
SIGNAL e_ir : STD_LOGIC;
SIGNAL e_mar : STD_LOGIC;
SIGNAL e_mdr : STD_LOGIC;
SIGNAL e_mem : STD_LOGIC;
SIGNAL e_pc : STD_LOGIC;
SIGNAL e_reg : STD_LOGIC;
SIGNAL func : STD_LOGIC_VECTOR(5 DOWNTO 0);
SIGNAL inc_pc : STD_LOGIC;
SIGNAL l_acc : STD_LOGIC;
SIGNAL l_desp1 : STD_LOGIC;
SIGNAL l_desp2 : STD_LOGIC;
SIGNAL l_extsign : STD_LOGIC;
SIGNAL l_mdr : STD_LOGIC;
SIGNAL l_mem : STD_LOGIC;
SIGNAL l_pc : STD_LOGIC;
SIGNAL l_sor1 : STD_LOGIC;
SIGNAL Sortida_Estat : integer;
SIGNAL l_sor2 : STD_LOGIC;
SIGNAL mux_dest : STD_LOGIC_VECTOR(1 DOWNTO 0);
SIGNAL op_alu : STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL pc_sup : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
SIGNAL Tancar : STD_LOGIC;
SIGNAL z : STD_LOGIC;
COMPONENT UnitatDeControl
	PORT (
	c : IN STD_LOGIC;
	clk : IN STD_LOGIC;
	co : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	e_acc : OUT STD_LOGIC;
	e_ir : OUT STD_LOGIC;
	e_mar : OUT STD_LOGIC;
	e_mdr : OUT STD_LOGIC;
	e_mem : OUT STD_LOGIC;
	e_pc : OUT STD_LOGIC;
	e_reg : OUT STD_LOGIC;
	func : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
	inc_pc : OUT STD_LOGIC;
	l_acc : OUT STD_LOGIC;
	l_desp1 : OUT STD_LOGIC;
	l_desp2 : OUT STD_LOGIC;
	l_extsign : OUT STD_LOGIC;
	l_mdr : OUT STD_LOGIC;
	l_mem : OUT STD_LOGIC;
	l_pc : OUT STD_LOGIC;
	l_sor1 : OUT STD_LOGIC;
	l_sor2 : OUT STD_LOGIC;
	mux_dest : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
	op_alu : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
	pc_sup : OUT STD_LOGIC;
	Reset : IN STD_LOGIC;
	Tancar : OUT STD_LOGIC;
		Sortida_Estat : out integer;
	z : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : UnitatDeControl
	PORT MAP (
-- list connections between master ports and signals
	c => c,
	clk => clk,
	co => co,
	e_acc => e_acc,
	e_ir => e_ir,
	e_mar => e_mar,
	e_mdr => e_mdr,
	e_mem => e_mem,
	e_pc => e_pc,
	e_reg => e_reg,
	func => func,
	inc_pc => inc_pc,
	l_acc => l_acc,
	l_desp1 => l_desp1,
	l_desp2 => l_desp2,
	l_extsign => l_extsign,
	l_mdr => l_mdr,
	l_mem => l_mem,
	l_pc => l_pc,
	l_sor1 => l_sor1,
	l_sor2 => l_sor2,
	mux_dest => mux_dest,
	op_alu => op_alu,
	pc_sup => pc_sup,
	Reset => Reset,
	Tancar => Tancar,
	Sortida_Estat => Sortida_Estat,
	z => z
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
	clk <= '1';
	reset <= '1';
	co <= "000000";
	func <= "100000";
	z <= '0';
	c <= '0';
	wait for 100 ns;
	clk <= '0';
	reset <= '0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	wait for 100 ns;


                
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END UnitatDeControl_arch;