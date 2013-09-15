;redcode-94
;name Manfred v0.3
;author Ian Oversby
;strategy P-Spacer
;strategy v0.1  Imps/Imp gates/...
;strategy v0.2  Stronger gate
;strategy v0.3  Updated components
;assert 1

org str

plc     equ     5		; Not really

dval	equ	800
spt	equ	(last+300)

gate1	equ	(stone-3)
impstep equ     2667
sval    equ     1900

;;------------------------------------------------------------

str     LDP.A   #plc,   pval    ;load wins/losses
        ADD.A   pval,   check
        MOD.A   #13,    check
        JMN.A   boot,   check   ;permanent switch

res     LDP.AB  #0,     #0
sec     SNE.AB  #0,     res     ;check for loss
lost    ADD.A   #13,    pval
        SNE.AB  #1,     res     ;check for win
won     SUB.A   #13,    pval
        STP.AB  pval,   #plc
jump    JMP.B   dboot,	<-100

pval    DAT.F   $0,     $0
check   DAT.F   $7904,  $0	; 13 / 8

;;---------------------- Dodger , 11 lines ------------------------

for 15
        DAT.F   $0,     $0
rof

dboot	MOV.I	{dptr,	<dptr
for 10
	MOV.I	{dptr,	<dptr
rof
	SPL.B	@dptr,	<-300
	MOV.I	pval,	dptr
dptr	DAT.F	#dl+1,	#dval

scan	JMZ.F	scan,	>spt	; linear bomb-scan
	SUB.AB	#2,	spt	; Try 2, 3 and 4
cloop	MOV.I	>bptr,	>spt
	DJN.B	cloop,	#5
	SUB.AB	#3,	spt
bptr	JMP.B	@spt,	#gat

gat	DAT.F	#0,	#5
bomb	DAT.F	>2667,	#5	
	SPL.B	#0,	>gat+2667
dloop	MOV.I	bomb,	>gat	; anti-imping dirty core-clear
dl	DJN.F	dloop,	>gat	; Thank you Bjoern.

;;---------- Simple v0.2a with 16 process, point spiral -----------

for 20
	DAT.F	$0,	$0
rof

mimp    SPL.B   1,      <-500	; 16 process 3 point imp
        SPL.B   1,      {-500	; and decoy-maker :-)
        SPL.B   1,      <-500        
        SPL.B   1,      <-500        

        SPL.B   2,      {-500
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

end
