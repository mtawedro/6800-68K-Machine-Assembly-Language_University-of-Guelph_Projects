        ORG    	$8024       
        JMP    	t5
        ORG    	$802A      
        JMP    	t6
      
        ORG	$8500       
     
t5      movem.l	d0/a0,-(sp)
	lea	(a1),a0

while5	move.b	(a0),d0
	addq	#1,a0
	tst	d0
	beq	exit5
	cmpi.b	#'a',d0
	blo	print5
	cmpi.b	#'z',d0
	bhi	print5
	sub.b	#$20,d0

print5	trap	#1
	bra	while5

exit5	movem.l	(sp)+,d0/a0
	RTE

	ORG	$8600
t6	movem.l	d0/a0,-(sp)
	lea	(a1),a0

while6	move.b	(a0),d0
	addq	#1,a0
	tst	d0
	beq	exit6
	cmpi.b	#'A',d0
	blo	print6
	cmpi.b	#'Z',d0
	bhi	print6
	add.b	#$20,d0

print6	trap	#1
	bra	while6

exit6	movem.l	(sp)+,d0/a0
	rte
	
        ORG     $9000
start	lea	$9500,a1  
	moveq	#20,d1

	trap	#3
	lea	$9500,a1

	move	#$0a,d0
	trap	#1

	trap	#2

	lea	$9500,a1
	moveq	#20,d1
	trap	#5
	trap	#1

	trap	#2
	moveq	#20,d1
	trap	#6
	trap	#1


	trap	#2

	trap	#14

        END     start