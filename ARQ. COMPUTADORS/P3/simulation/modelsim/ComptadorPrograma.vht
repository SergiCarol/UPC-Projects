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
-- Generated on "04/27/2014 12:38:31"
                                                            
-- Vhdl Test Bench template for design  :  ComptadorPrograma
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ComptadorPrograma_vhd_tst IS
END ComptadorPrograma_vhd_tst;
ARCHITECTURE ComptadorPrograma_arch OF ComptadorPrograma_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Din : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Dout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL EPC : STD_LOGIC;
SIGNAL IncPC : STD_LOGIC;
SIGNAL LPC : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT ComptadorPrograma
	PORT (
	clk : IN STD_LOGIC;
	Din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	EPC : IN STD_LOGIC;
	IncPC : IN STD_LOGIC;
	LPC : IN STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : ComptadorPrograma
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Din => Din,
	Dout => Dout,
	EPC => EPC,
	IncPC => IncPC,
	LPC => LPC,
	Reset => Reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN
	clk <= '0';
	Din <= x"00000001";
	EPC <= '0';
	IncPC <= '0';
	LPC <= '1';
	Reset <='0';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	EPC <= '1';
	--IncPC <= '1';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	EPC <= '0';
	IncPC <= '1';
	wait for 100 ns;
	clk <= '1';
	wait for 100 ns;
	clk <= '0';
	reset <= '1';
	wait for 100 ns;
	clk <= '1';
	reset <= '0';
	LPC <= '0';
	wait for 100 ns;
	
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                                                                
BEGIN                                                         
WAIT;                                                        
END PROCESS always;                                          
END ComptadorPrograma_arch;
