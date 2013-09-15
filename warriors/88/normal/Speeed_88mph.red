;redcode
;name Speeed 88mph
;author Christian Schmidt
;strategy Blurstone '88 with zooom-trick
;strategy added a bunch of further tricks
;assert CORESIZE==8000
;optimax cds

bdist equ (adj+772)
STEP	equ   70
x	equ	-2

adj   mov   #1    ,     top
top	mov	sptr	,	@2
	mov	bspl	,	<cptr
	sub	step	,	sptr
sptr	mov	STEP+x,	<STEP+1+5+x
scan	jmz	@top	,	<sptr
      djn   adj   ,     #17
bspl	spl	0	,	<-STEP+1
	mov	step	,	<top-6
tp	djn	-1	,	<top-7+2667
step	dat	<-STEP,	#-STEP-1
cptr	dat	<-STEP,	#-4500

   for 9
      dat   #0    ,     #0 
   rof 

boot  mov   cptr  ,     bdist+11
      mov   <from ,     <boot
brep  mov   <from ,     <boot
      mov   <from ,     <boot
      mov   <from ,     <boot
      mov   <from ,     <boot
      mov   <from ,     <boot
      djn   brep  ,     #2
from  jmp   bdist+4,    cptr

   for 30
      dat   #0    ,     #0 
   rof 

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

