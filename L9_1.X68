        ORG    $8000
START: 
        MOVE.W  VAL,-(SP)
        JSR     DIS
        lea     2(sp),sp
        trap    #14    
        
DIS     LINK    A6,#-4
        CLR.L   D0
        MOVE    8(A6),D0
        CMP.W   #0,D0
        BEQ     EXIT 
        DIVU    #10,D0
        MOVE.W  D0,-2(A6)
        SWAP    D0
        MOVE.W  D0,-4(A6)
        SWAP    D0
        MOVE.w  D0,-(sp)
        JSR     DIS
         
        lea     2(sp),sp  
        MOVE.b  #6,D0
        MOVE    -4(A6),D1
        ADD.b   #$30,D1
*       move.b  d1,d0
*       trap    #1
        TRAP    #15
                   
        
EXIT 
        UNLK    A6   
        RTS             


    ORG    $A000
VAL dc.w 1234


    END    START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
