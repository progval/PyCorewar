;redcode-94x
;name black & white
;author Anders Ivner
;strategy switch paper from white warrior with multipass coreclear.
;strategy I haven't time for anything more sophisticated. Or testing.
;assert 1

RESULT	equ	#0
CHOICE	equ	#1

result	ldp	RESULT,	#result
choice	ldp	CHOICE,	#choice
	add.b	result,	choice
	add	#1,	choice
	mod	#2,	choice
	stp	choice,	CHOICE
	jmn	black,	choice


white       SPL.B  $     1, $     0
       SPL.B  $     1, $     0     
       SPL.B  $     1, $     0     

       SPL.B  @     0, }  1800     
       MOV.I  }    -1, >    -1     
       SPL.B  @     0, }  3740     
       MOV.I  }    -1, >    -1     
       MOV.I  {    -2, <     1     
       JMP.B  @     0, > -1874     
       DAT.F  > -2467, >   200     
       MOV.I  $    -1, $     1     

	dat	0,0
	dat	0,0

black	mov	b,	b+3400
	for	5
	mov	{black,	<black
	rof
	jmp	s1+3400

pt	dat	#-1,	#10
d1	dat	#-2,	b+2-pt
s1	spl	#-3,	b+2-pt
	mov	@b,	>pt
	mov	@b,	>pt
b	djn	-2,	{s1

       END result
