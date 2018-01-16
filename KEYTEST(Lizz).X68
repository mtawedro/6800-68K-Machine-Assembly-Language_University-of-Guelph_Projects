DUART 	EQU $C001 
ISR 	EQU $1A 
OPR_SET EQU $1C 
OPR_CLR EQU $1E 
SRA		EQU	2
RBA		EQU	6

		ORG	$8000
START	MOVE.L #duart,a0

LOOP	MOVE.B SRA(A0),D4
		ANDI.B	#1,D4
		BEQ LOOP
		MOVE.B RBA(A0),D0
		CMP.B	#113,D0
		BEQ EXIT
		BSR OUT681
		BRA LOOP

OUT681	MOVE.B D0,OPR_CLR(A0)
		NOT.B	D0
		MOVE.B D0,OPR_SET(A0)
		RTS	

EXIT	TRAP #14

		END	START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
