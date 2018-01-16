*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:  move.l   list1,d0
        move.l   list2,d1
        move.l   list3,d3

loop   
       cmpi.l   #1,d1
       beq      exit

       move.l   d1,d7
       andi.b   #1,d7
       bne    odd
       bra    rest
       
odd    move.l  d0,d5
       add.l   d5,d3
       bra  rest 

rest   
       lsl.w   #1,d0
       lsr.w   #1,d1 
       bra      loop 
       
exit   move.l  d0,d5
       add.l   d5,d3
       trap     #14
    org    $9000
list1   dc.l   30
list2   dc.l   25
list3   dc.l   0
result  ds.l   1
size    equ    result - list
    END    START        



*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
