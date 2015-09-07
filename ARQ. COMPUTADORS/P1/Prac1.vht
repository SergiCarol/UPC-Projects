-- Copyright (C) 1991-2010 Altera Corporation
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
-- Generated on "02/24/2014 11:16:02"
                                                            
-- Vhdl Test Bench template for design  :  Prac1
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Prac1_vhd_tst IS
END Prac1_vhd_tst;
ARCHITECTURE Prac1_arch OF Prac1_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL a : std_logic;
SIGNAL b : std_logic;
SIGNAL c : std_logic;
SIGNAL ctrl : std_logic;
COMPONENT Prac1
	PORT (
	a : IN std_logic;
	b : IN std_logic;
	c : OUT std_logic;
	ctrl : IN std_logic
	);
END COMPONENT;
BEGIN
	i1 : Prac1
	PORT MAP (
-- list connections between master ports and signals
	a => a,
	b => b,
	c => c,
	ctrl => ctrl
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
       
	a <= '1';
	b <= '0';
	ctrl <= '0';
	wait for 10 ns;
	ctrl <= '1';
	wait for 10 ns; 
	-- code that executes only once                      
WAIT;                                                       
END PROCESS init;                                           
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         
WAIT;

END PROCESS always;                                          
END Prac1_arch;
