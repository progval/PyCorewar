;redcode
;author Lukasz Grabun
;name Pixie 88
;assert (CORESIZE==8000)
;strategy qscan -> stone/imp

step	equ	107
first	equ	(-115-1)
hop	equ	(6916+1)
gate	equ	(hop+m-1)

soff	equ	3467
ioff	equ	3846

stone	spl	0 	, <gate
ptr	mov	bomb 	, <first	  
m	mov     bomb 	, @ptr
	sub    	#step 	, ptr
	djn     ptr  	, <5500
bomb	dat    	<1    	, #hop

split	spl	1    	, imp
	spl	1
vortex	spl	0
	add	#2667	, launch
launch	jmp	@0	, imp-2668
imp	mov	0	, 2667

boot	mov	bomb	, soff-CURLINE	
	mov	imp	, ioff-CURLINE
src	spl	2	, bomb
dst	spl	2	, soff-CURLINE
	spl	1	, ioff-CURLINE
	mov	<src	, <dst
	mov	<split	, <boot+1
	djn	@dst	, #5
	jmp	@boot+1

qs    equ 322
qd    equ 161

qscan cmp 2*qs+qd       , 2*qs
qt1   jmp qa0           , <3*qs
      cmp qscan+5*qs+qd , qscan+5*qs
qt2   jmp qa1           , <4*qs
      cmp qscan+4*qs+qd , qscan+4*qs
qs1   djn qa1           , #qt1
      cmp qscan+10*qs-2 , qscan+10*qs+qd-2  ; qscan-(qt2-1) = -2
qs2   djn qa2           , #qt2
      cmp qscan+9*qs+qd , qscan+9*qs
qt3   jmp qa2           , <6*qs
      cmp qscan+6*qs+qd , qscan+6*qs
      jmp qa2           , <qa1
      cmp qscan+8*qs+qd , qscan+8*qs
      jmp qa2           , <qs1
      cmp qscan+11*qs   , qscan+11*qs+qd
      jmp qa3           , <qa2
      cmp qscan+18*qs-8 , qscan+18*qs+qd-8  ; qscan-(qt3-1) = -8
qs3   djn qa3           , #qt3
      cmp qscan+16*qs-2 , qscan+16*qs+qd-2  ; qscan-(qt2-1) = -2
      jmp qa3           , <qs2
      cmp qscan+12*qs   , qscan+12*qs+qd
      jmp qa3           , <qa1
      cmp qscan+14*qs   , qscan+14*qs+qd
      jmp qa3           , <qs1
      jmz boot          , qscan+15*qs

qa3   add @qs3          , qp
qa2   add @qs2          , @qa3
qa1   add @qs1          , @qa3
qa0   cmp @qp           , <1234
      cmp @0            , 0
      add #qd           , qp
ql    mov qb            , @qp
qp    mov <2345         , <qscan+2*qs
      sub #9            , @ql
      djn ql            , #6
qb    jmp boot          , <43

      end qscan

