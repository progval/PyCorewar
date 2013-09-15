;redcode-94nop
;name Ethanol vE
;author G.Labarga
;assert CORESIZE==8000
;strategy	Q^3->stone/imp
;strategy	ver 1.1 boots 7pt imp-pump and stone, (Rosebudish stone)
;strategy	ver 1.2 Modified Thunderstrike-like stone -> d-clear
;strategy	ver 1.3 better offset constants
;strategy	ver 1.4 modified stone, new boot code
;strategy	ver 1.5 modified imp launcher (3pt), boot and initial structure
;strategy	ver 1.6 Optimized all the constants

	IP_LOC EQU SCL+5049		;where the imp-pump is
	ST_LOC EQU IP_LOC - 281		;where the stone is
	SG_LOC EQU ST_LOC - 50
	ILOC EQU 4423			;imp's first point
	ISTEP EQU 2667			;3-pt imps
	STEP EQU 2684
	DIST EQU CHK+2*STEP
	DIST2 EQU DIST+(1695*STEP)+1
	GATE EQU SCL-3

BOOT:	MOV CBM,*SPTR
	MOV BMB,@SPTR
	SUB.F #10,>7			;(>GOST -> SPTR)
	SPL 0,}0			;3 procs. (1|2 non parallel)
	MOV.I <MOREP,{SPTR		;copy stone's gate
	MOV.I IMP,>SP2
	MOV.I <GOIP,{GOIP		;move out imp-pump
MOREP:	MOV.I SP2,#SCL+3		;3->5 procs, source ptr gate
	MOV.I {SSRC,<SPTR		;move out stone
GOST:	DJN.B @SPTR,SPTR		;go to stone, (4 procs)
GOIP:	SPL IP_LOC,IPMP+3		;go to imp-pump, (1 proc) and pointers
SPTR:	SUB.F #SG_LOC+10,#ST_LOC+7	;launch vector/pointers; self-erases
SSRC:	DAT STONE+5,{5			;source ptr stone, process counter

FOR 20
	DAT 0,0
ROF

SCL:	SPL #0,>GATE-140
CLR:	MOV CBM+10,>GATE
	DJN.F CLR,>GATE

CBM:	DAT <2667,10	;9

STONE:	SPL #-2*STEP,<-2*STEP
REF:	MOV {DIST2,*DIST
	MOV BMB+7,@REF
CHK:	SUB.F STONE,REF
	DJN.F @CHK,{3692	;<- That location is bombed later

BMB:	DAT STEP,SCL-CHK-44

IPMP:	SPL #-100,>-5969
	ADD.A #ISTEP+1,IGO
IGO:	DJN.F IPMP+ILOC-ISTEP+2,<IPMP-4186
IMP:	MOV.I #ISTEP,*0
FOR 10
	DAT 0,0
ROF

;---------- cut'n pasted Q^3 Quick scanner ------------

qf 		equ 	qKil
qs 		equ 	200
qd 		equ 	4000
qi 		equ 	7
qr 		equ 	8
;----

qBmb 		dat  	{qi*qr-10	, {1
qGo  		seq  	qd+qf+qs	, qf+qs
    		jmp  	qSki		, {qd+qf+qs+qi+2
    		sne  	qd+qf+5*qs	, qf+5*qs
    		seq  	qf+4*qs		, {qTab
		jmp  	qFas		, }qTab
		sne  	qd+qf+8*qs	, qf+8*qs
    		seq  	qf+7*qs		, {qTab-1
    		jmp  	qFas		, {qFas
		sne  	qd+qf+10*qs	, qf+10*qs
    		seq  	qf+9*qs		, {qTab+1
		jmp  	qFas		, }qFas
		seq  	qd+qf+2*qs	, qf+2*qs
		jmp	qFas		, {qTab
		seq	qd+qf+6*qs	, qf+6*qs
		djn.a	qFas		, {qFas
		seq  	qd+qf+3*qs	, qf+3*qs
      		jmp  	qFas		, {qd+qf+3*qs+qi+2
		sne  	qd+qf+14*qs	, qf+14*qs
		seq 	qf+13*qs  	, <qTab
		jmp  	qSlo		, >qTab
		sne  	qd+qf+17*qs	, qf+17*qs
		seq  	qf+16*qs	, <qTab-1
		jmp  	qSlo		, {qSlo
		seq  	qd+qf+11*qs	, qf+11*qs
		jmp  	qSlo		, <qTab
		seq  	qd+qf+15*qs	, qf+15*qs
		djn.b	 qSlo		, {qSlo
		sne  	qd+qf+12*qs	, qf+12*qs
		jmz  	BOOT		, qd+qf+12*qs-qi
qSlo 		mov.ba 	qTab		, qTab
qFas	 	mul.ab 	qTab		, qKil
qSki  		sne  	qBmb-1		, @qKil
    	 	add  	#qd		, qKil
qLoo  		mov.i  	qBmb		, @qKil
qKil	  	mov.i  	qBmb		, *qs
      		sub.ab 	#qi		, qKil
      		djn    	qLoo		, #qr
      		jmp    	BOOT		, <-4000
    		dat  	5408		, 7217
qTab  		dat  	4804		, 6613
dSrc  		dat  	5810		, qBmb-5

SP2:	SPL 1,IP_LOC+ILOC

	END qGo

