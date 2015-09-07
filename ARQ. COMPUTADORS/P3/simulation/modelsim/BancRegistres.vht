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
-- Generated on "04/27/2014 13:29:46"
                                                            
-- Vhdl Test Bench template for design  :  BancRegistres
-- 
-- Simulation tool : ModelSim-Altera (VHDL)
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY BancRegistres_vhd_tst IS
END BancRegistres_vhd_tst;
ARCHITECTURE BancRegistres_arch OF BancRegistres_vhd_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL dades : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL esc : STD_LOGIC;
SIGNAL lSor1 : STD_LOGIC;
SIGNAL lSor2 : STD_LOGIC;
SIGNAL rdest : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL Reset : STD_LOGIC;
SIGNAL rf1 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL rf2 : STD_LOGIC_VECTOR(4 DOWNTO 0);
SIGNAL sor1 : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL sor2 : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT BancRegistres
	PORT (
	clk : IN STD_LOGIC;
	dades : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	esc : IN STD_LOGIC;
	lSor1 : IN STD_LOGIC;
	lSor2 : IN STD_LOGIC;
	rdest : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	Reset : IN STD_LOGIC;
	rf1 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	rf2 : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
	sor1 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	sor2 : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : BancRegistres
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	dades => dades,
	esc => esc,
	lSor1 => lSor1,
	lSor2 => lSor2,
	rdest => rdest,
	Reset => Reset,
	rf1 => rf1,
	rf2 => rf2,
	sor1 => sor1,
	sor2 => sor2
	);
init : PROCESS                                               
-- variable declarations                                     
BEGIN
	clk <= '1';
	dades <=x"00000011";
	esc <= '1';
	lSor1 <= '1';
	lSor2 <= '1';
	rdest <= "00001";
	Reset <= '0';
	rf1 <= "00001";
	rf2 <= "00000";
	wait for 10 us;
	clk <= '0';
	wait for 10 us;
	clk <= '1';
	rdest <= "00001";
	rf1 <= "00001";
	rf2 <= "00001";
	wait for 10 us;
	clk <= '0';
	wait for 10 us;
	clk <= '1';
	rdest <= "00000";
	rf1 <= "00000";
	rf2 <= "00000";
	wait for 10 us;
	clk <= '0';
	lSor1 <= '1';
	lSor2 <= '0';
	wait for 10 us;
	clk <= '1';
	wait for 10 us;
	clk <= '0';
	lSor1 <= '0';
	lSor2 <= '1';
	rdest <= "00101";
	rf1 <= "00000";
	rf2 <= "00101";
	wait for 10 us;
	clk <='1';
	wait for 10 us;
	clk <='0';
	wait for 10 us;
	reset <= '1';
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
END BancRegistres_arch;
