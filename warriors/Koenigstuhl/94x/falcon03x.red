;redcode-94x quiet
;name Falcon v0.3 X
;author Ian Oversby
;strategy P-Warrior
;assert 1

; Slightly modified for the big hill

plc	equ	312		; P-Space stuff
pval	equ	(bptr+30)

gate1	equ	(stone-3)	; Simple
impstep equ     34117		; 13 point imp step
sval    equ     1900

gat1		equ (gat-3)	; Tsunami

org res

;;------------------------------------------------------------

mimp    SPL.B   1,      <-5000	; 64 process 13 point imp
        SPL.B   1,      {-5000	; and decoy-maker :-)
        SPL.B   1,      <-5000        
        SPL.B   1,      {-5000        
        SPL.B   1,      <-5000        
        SPL.B   1,      <-5000        

        SPL.B   2,      {-5000
        JMP.B   imp
        ADD.A   #impstep, -1
die     DAT.F   $0,     $0
imp     MOV.I   #-5,    impstep

boot    MOV.I   {sptr,  <sptr
for 6
        MOV.I   {sptr,  <sptr
rof
        SPL.B   @sptr,	<-300
        MOV.I   die,    sptr
        JMP.B   mimp,	<-300
sptr    DAT.F   gate+1,	sval

stone	SPL.B   #95,    >-95
	SPL.B   #0,     >gate1-hit
loop	MOV.I   {0+95,	2-95
	ADD.F   stone,  loop
hit	DJN.F   loop,   <1900
last    MOV.I   gate,	}gate1
gate	DAT.F	gate-gate1+2,	>gate1

for 60
	DAT.F	$0,	$0
rof

;;------------------------------------------------------------

res	LDP.AB	#0,	#0
	SNE.AB	#-1,	res	; first round
	STP.AB	#54206,	#plc	; (8 // 171) + 170  [55440]

	LDP.A	#plc,	pval
	MOD.A	#171,	pval
	SLT.A	#169,	pval	; Is 169 less than pval?

	JMP.B	boot		; Second strategy, Simple

	LDP.A	#plc,	pval
	SNE.AB	#0,	res
lost	ADD.A	#171,	pval
	SNE.AB	#1,	res
won	SUB.A	#171,	pval
	STP.AB	pval,	#plc
jump	JMP.B	sloop,	<-100	; Select Tsunami

;;------------------------------------------------------------

for 80
	dat.f	$0,	$0
rof

gat	dat.f	#-25,	bptr-gat1+3
	spl.b	#-20,	#20
b1	spl.b	#310,	#300
sloop	add.f	step,	@scan
scan	sne.i	*b1,	@b1
	djn.f	sloop,	<-800
step	spl.b	#20,	#20
cloop	mov.i	@bptr,	>gat1
bptr	djn.b	cloop,	{b1

end
