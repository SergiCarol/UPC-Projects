EOR R16, R16      ;R16 = 0
LAB1:
	LDI R17, 65 
	ADD R17, R16
	OUT 2, R17 
	SUBI R16, -1 
	LDI R17, 26 
	SUB R17, R16 
	BRBC 2, LAB1 
BREAK 
