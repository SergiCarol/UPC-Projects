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
-- Generated on "04/26/2014 11:01:37"
                                                            
-- Vhdl Test Bench template for design  :  Registre
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY Registre_vhd_tst IS
END Registre_vhd_tst;
ARCHITECTURE Registre_arch OF Registre_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL Din : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Dout : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL enable : STD_LOGIC;
SIGNAL Reset : STD_LOGIC;
COMPONENT Registre
	PORT (
	clk : IN STD_LOGIC;
	Din : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	Dout : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	enable : IN STD_LOGIC;
	Reset : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : Registre
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	Din => Din,
	Dout => Dout,
	enable => enable,
	Reset => Reset
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN                                                      
	clk<='0';
	Reset<='0';
	enable<='0';
	Din<=x"00000011";
	wait for 10 us;
	clk<='1';
	enable<='1';
	wait for 10 us;
	clk<='0';
	wait for 10 us;
	clk<='1';
	Reset<='1';
	wait for 10 us;
	clk<='0';
	Reset<='0';
	Din<=x"11110000";
	wait for 10 us;
	clk<='1';
	wait for 10 us;
	clk<='0';
	enable<='0';
	Din<=x"00001111";
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
END Registre_arch;
