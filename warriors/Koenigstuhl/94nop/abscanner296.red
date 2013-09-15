;redcode-b
;name AB Scanner 2.9.6
;author Chris Hodson
;address chris@openix.com
;strategy a CMP-scanner, but compares a-fields to
;strategy b-fields.  Then carpets, clears and starts spiral.
;assert 1

scanrate	EQU	95
scandiff	EQU	21
scanstart	EQU	scanrate
extracpt	EQU	30
carpetlen	EQU	(extracpt+(scandiff))

	ORG cmppt
top:	DAT	0,		0
	DAT	-101,		0
for 4
dat 1,1
rof
	DAT	2,		0
for 4
dat 0,0
rof
	dat 0,0
for 4
dat 0,0
rof
	dat 0,0
dat 0,0
;-----------------------
scandat:	dat #(scanrate),	#(scanrate)
;-----------------------
carpet:	SPL	-1,		<-carpetlen
;-----------------------
cmpst:	SUB.f	scandat,	cmppt
cmppt:	SNE.AB	scanstart,	scanstart+scandiff	;SOP
jpnt:	JMP.A	cmpst,		<cmppt-100
found:	add.ab	#extracpt/2,	cmppt
lay:	MOV.I	carpet,		<cmppt
jump:	DJN	lay,		#carpetlen
;
	SPL	launch,		<top-159
	SPL	#step,		}close
corecl:	MOV.I	scandat,	<cmppt	
close:	slt.ab	#(scanrate),	cmppt
	MOV.ab	#cmppt-50,	cmppt
	djn	corecl,		<top-159
;
;-----
; 8-process 3-point spiral (coresize 8000, '94 standard)
step	equ	2667
launch
	spl	1
	spl	1
	spl	1
	mov	-1,	0
	spl	1
	spl	2
	jmp	imp
	add.a	#step,	-1
jmpbck	dat	<-200,	<top-159	; This must be a DAT
imp	mov.i	#0,	step
	dat 0,0
for 4
dat 0,0
rof
	dat 0,6
for 4
dat 0,0
rof
	dat 0,-3
for 4
dat 0,0
rof
	dat 0,1
for 4
dat 1,1
rof
