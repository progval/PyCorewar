;redcode-94nop
;name Blacken
;author Ian Oversby
;strategy Q^2 -> Stone/imp
;assert 1

; Reverse Engineered from the compiled code
; After everybody thought it was gone forever
; 17 Oct 2005, Roy van Rijn

sStep	equ	1370
sStep2	equ	3044
sBoot	equ	1800
cBomb	equ	cGo-9

iAway	equ	950
iStep	equ	2667

;Vector launch for the imps

iPmp	spl	1		, <-2200
	spl	1		, <-2208
	spl	<0		, #iTab+1
	djn.a	@iTab		, #0
iImp	mov.i	#iStep		, *0

	jmp iImp+iAway+(iStep*7), iImp+iAway+(iStep*6)
	jmp iImp+iAway+(iStep*5), iImp+iAway+(iStep*4)
	jmp iImp+iAway+(iStep*3), iImp+iAway+(iStep*2)
iTab	jmp iImp+iAway+iStep	, iImp+iAway

for 21
	dat	0		, 0
rof

; Taken the Q^2 from Newt
; Removed the lower 4 scans
; Changed the constants
; A perfect match (code is 100% the same)

QB	EQU	(start-550)
QS	EQU	(QD*2)
QD	EQU	-100

GAP	EQU	12
REP	EQU	8
REP2	EQU	2

datz	EQU	(table-3)

	dat     10*QS		, 2*QS
table:  dat     4*QS		, 1*QS
	dat     23*QS		, 3*QS
; can get 21 values from this table
; and can also use the initial value
; of fnd

qinc:   spl    	#GAP		, -GAP
tab:    add.a  	table		, table
slow:   add.a  	@tab		, fnd
fast:   add.ba 	*tab		, @slow
which:  sne.i  	datz		, *fnd
	add.a  	#QD		, fnd
	mov.i  	datone		, *fnd
	add.ab 	fnd		, fnd

fnd:    mov.i  	QB		, GAP/2
        add.f  	qinc		, fnd
	mov.i  	datone		, *fnd
	djn.b  	fnd		, #REP
	jmp    	boot		, }QS*13

start:	seq.i	QB+QS*0		, QB+QS*0+QD
	jmp	which		, }QB+QS*0+QD/2

	seq.i	QB+QS*1		, QB+QS*1+QD
  	jmp    	fast		, }QB+QS*1+QD/2

  	seq.i  	QB+QS*13	, QB+QS*13+QD
  	jmp    	fast		, {fast
  	seq.i  	QB+QS*2		, QB+QS*2+QD
  	jmp    	fast		, {tab
  	seq.i  	QB+QS*3		, QB+QS*3+QD
  	jmp    	fast		, }tab

  	seq.i  	QB+QS*4		, QB+QS*4+QD
	jmp    	>fast		, }QB+QS*4+QD/2
	seq.i   QB+QS*5		, QB+QS*5+QD
	jmp     slow		, }QB+QS*5+QD/2

	seq.i   QB+QS*6		, QB+QS*6+QD
	jmp     slow		, {tab
	seq.i   QB+QS*7		, QB+QS*7+QD
	jmp     slow		, }tab
	seq.i   QB+QS*10	, QB+QS*10+QD
	jmp     >fast		, <tab
	seq.i   QB+QS*11	, QB+QS*11+QD
	jmp     slow		, <tab
	seq.i   QB+QS*12	, QB+QS*12+QD
	djn.f   slow		, tab
	seq.i   QB+QS*23	, QB+QS*23+QD
	jmp     >fast		, >tab
	seq.i   QB+QS*24	, QB+QS*24+QD
	jmp     slow		, >tab
	seq.i   QB+QS*17	, QB+QS*17+QD
	jmp     slow		, {fast

	seq.i   QB+QS*8		, QB+QS*8+QD
	jmp     <fast		, }QB+QS*8+QD/2

; Boot the stone away
; And the pointer

boot	mov	cGate		, <bPtr
for 7
	mov	<bEnd+1		, {bPtr
rof
	spl	*bPtr		, <-1000
	spl	*bPtr		, <-1108
	mov	iImp		, iImp+iAway
	spl	iPmp		, <-1217
bPtr  	div.f	#sBoot		, #sBoot-10

; Bomb for the qscan
datone	dat	}300		, >200

cGate	dat	1		, #18

sStart	spl	#sStep2		, <sStep
sAtt    mov	{-sStep2+1	, *-sStep+3
	mov.i	sStart		, @sAtt
	sub.f	sStart		, sAtt
	djn.f	sAtt		, <sStep-4

cGo   	mov.i	cBomb		, >cGate-4
bEnd	djn.f	cGo		, {cGate-4

end	start

