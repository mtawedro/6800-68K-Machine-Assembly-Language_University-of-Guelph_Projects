DUART   EQU $C001
SRA     EQU 1*2
TBA     EQU 2*3
CR      EQU $0D
LF      EQU $0A

        ORG $8000
MESSAGE MOVE.W  #9,D7
LOOP    MOVEA.L #MESS,A1

        BSR.S   OUTSTR
        DBRA    D7,LOOP
        BRA     *-2      
OUTCHR  MOVE.L  A0,-(A7)
        MOVE.W  D7,-(A7)
        MOVEA.L #DUART,A0
        
OUTCHR2 MOVE.B  SRA(A0),D7
        ANDI    #4,D7
        BEQ.S   OUTCHR2
        MOVE.B  D0,TBA(A0)
        MOVE.W  (A7)+,D7
        MOVE.L  (A7)+,A0
        RTS
        
OUTSTR  MOVE.L  D0,-(A7)
OUTSTR2 MOVE.B  (A1)+,D0
        BEQ.S   EXIT
        BSR.S   OUTCHR
        BRA.S   OUTSTR2
EXIT    MOVE.L  (A7)+,D0
        RTS
        
MESS DC.B	CR,LF,'assembly language programming',0
               
        END	MESSAGE

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
