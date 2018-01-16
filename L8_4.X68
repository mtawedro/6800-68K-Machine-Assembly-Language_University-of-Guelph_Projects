*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:  move.w  x,-(sp)
        move.w  y,-(sp)
        lea     z,a0
        move.l  a0,-(sp)
        
        jsr     squared
        lea     6(sp),sp
        trap    #14

squared link    a6,#-6
        movem.l d0-d5/a0,-(sp)
        
        move.w  14(a6),d0
        move.w  12(a6),d1
        move.w  8(a6),a0
        
        move.w  -2(a6),d3
        move.w -4(a6),d4
        move.w  -6(a6),d5
        
        move.w  d0,d3
        move.w  d1,d4
        
        muls    d3,d3
        muls    d4,d4
        
        move.w  #2,d5
        muls    d0,d5
        muls    d1,d5
        
        add.w   d4,d5
        add.w   d3,d5
        
        move.l  d5,(a0)
        move    d5,d7
        movem.l (sp)+,d0-d5/a0
        unlk    a6
        
        rts
                        


    ORG $9000

x   dc.w    80
y   dc.w    -70
z   ds.l    1   

    END    START        

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
