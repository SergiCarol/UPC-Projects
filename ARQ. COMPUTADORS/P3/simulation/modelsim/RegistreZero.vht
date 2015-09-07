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
-- Generated on "04/26/2014 20:32:04"
                                                            
-- Vhdl Test Bench template for design  :  RegistreZero
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY RegistreZero_vhd_tst IS
END RegistreZero_vhd_tst;
ARCHITECTURE RegistreZero_arch OF RegistreZero_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Dout1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Dout2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL E1 : STD_LOGIC;
SIGNAL E2 : STD_LOGIC;
SIGNAL reset : STD_LOGIC;
COMPONENT RegistreZero
	PORT (
	clk : IN STD_LOGIC;
	Dout1 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	Dout2 : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	E1 : IN STD_LOGIC;
	E2 : IN STD_LOGIC;
	reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : RegistreZero
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Dout1 => Dout1,
	Dout2 => Dout2,
	E1 => E1,
	E2 => E2,
	reset => reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN          
	clk<='0';
	E1<='1';
	E2<='0';
	reset<='0';
	wait for 10 us;
	clk<='1';
	wait for 10 us;
	clk<='0';
	E1<='0';
	E2<='1';
	wait for 10 us;
	clk<='1';
	reset<='1';
	wait for 10 us;                                              
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
END RegistreZero_arch;
