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
-- Generated on "05/21/2014 15:04:00"
                                                            
-- Vhdl Test Bench template for design  :  Microprocessador
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Microprocessador_vhd_tst IS
END Microprocessador_vhd_tst;
ARCHITECTURE Microprocessador_arch OF Microprocessador_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL CLK : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT Microprocessador
	PORT (
	CLK : IN STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Microprocessador
	PORT MAP (
-- list connections between master ports and signals
	CLK => CLK,
	Reset => Reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                        
        -- code that executes only once                      
WAIT;                                                       
END PROCESS init; 
clock : PROCESS
BEGIN
	CLK <= '0';
	WAIT FOR 50 ns;
	CLK <= '1';
	WAIT FOR 50 ns;
end process clock;                                          
always : PROCESS                                              
-- optional sensitivity list                                  
-- (        )                                                 
-- variable declarations                                      
BEGIN                                                         

	RESET <= '1';
	WAIT FOR 120 ns;
	RESET <= '0';
	WAIT FOR 20 us;
WAIT;
        -- code executes for every event on sensitivity list  
WAIT;                                                        
END PROCESS always;                                          
END Microprocessador_arch;
