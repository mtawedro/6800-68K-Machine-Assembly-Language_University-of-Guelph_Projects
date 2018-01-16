*L4_2.x68: Absolute addressing

REGION1  EQU    $00000410
REGION2  EQU    $FFFF9000
REGION3  EQU    $00018000  

        ORG     $1000
START   MOVE.L  REGION1,D0
        MOVE.L  REGION2,D0
        MOVE.L  REGION3,D0          
        END     START        
