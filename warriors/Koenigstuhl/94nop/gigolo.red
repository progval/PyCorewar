;redcode-94 verbose
;name Gigolo
;author Core Warrior staff
;strategy q^2 -> stone/imp
;strategy Rosebud stone, Probe qscan, Impfinity imps
;strategy v 0.2 new qscan
;assert CORESIZE == 8000 

istep   equ     2667
bstep01 equ     2214
bstep02 equ     3285

trash equ       (boot01+7-359)
impoff equ      (boot01+5+365)
pmpof01 equ     (impoff+1*istep-571)
pmpof02 equ     (impoff+2*istep-493)

step    equ     -845
djnoff  equ     split+step
away    equ     impoff+2906

QB EQU (start+1800)
QS EQU (QD*2)
QD EQU 100

GAP EQU 12
REP EQU 8
REP2 EQU 2

datz EQU (table-3)

	 dat    10*QS, 2*QS ; can get 21 values from this table
table:   dat     4*QS, 1*QS ; and can also use the initial value
	 dat    23*QS, 3*QS ; of fnd

qinc:    spl    #GAP,-GAP
tab:     add.a  table,table
slow:    add.a  @tab,fnd
fast:    add.ba *tab,@slow
which:   sne.i  datz,*fnd
	 add.a  #QD,fnd
	 mov.i  datone,*fnd
	 add.ab fnd,fnd

fnd:    mov.i  QB,GAP/2
        add.f  qinc,fnd
	mov.i  datone,*fnd
	djn.b  fnd,#REP
	jmp    boot,}QS*13

start:
	    ; WHICH
	seq.i  QB+QS*0,QB+QS*0+QD
	jmp    which,}QB+QS*0+QD/2
	    
	     ; FAST
	 seq.i  QB+QS*1,QB+QS*1+QD
	 jmp    fast,}QB+QS*1+QD/2
	    
	 seq.i  QB+QS*13,QB+QS*13+QD
	 jmp    fast,{fast
	 seq.i  QB+QS*2,QB+QS*2+QD
	 jmp    fast,{tab
	 seq.i  QB+QS*3,QB+QS*3+QD
	 jmp    fast,}tab
	    
	    ; SLOW
	 seq.i  QB+QS*4,QB+QS*4+QD
	 jmp    >fast,}QB+QS*4+QD/2
	 seq.i  QB+QS*5,QB+QS*5+QD
	 jmp    slow,}QB+QS*5+QD/2
	    
	 seq.i  QB+QS*6,QB+QS*6+QD
	 jmp    slow,{tab
	 seq.i  QB+QS*7,QB+QS*7+QD
	 jmp    slow,}tab
	 seq.i  QB+QS*10,QB+QS*10+QD
	 jmp    >fast,<tab
	 seq.i  QB+QS*11,QB+QS*11+QD
	 jmp    slow,<tab
	 seq.i  QB+QS*12,QB+QS*12+QD
	 djn.f  slow,tab
	 seq.i  QB+QS*23,QB+QS*23+QD
	 jmp    >fast,>tab
	 seq.i  QB+QS*24,QB+QS*24+QD
	 jmp    slow,>tab
	 seq.i  QB+QS*17,QB+QS*17+QD
	 jmp    slow,{fast
	    
	    ; TAB
	    
	 seq.i  QB+QS*8,QB+QS*8+QD
	 jmp    <fast,}QB+QS*8+QD/2
	 seq.i  QB+QS*9,QB+QS*9+QD
	 jmp    tab,}QB+QS*9+QD/2

         seq.i  QB+QS*15,QB+QS*15+QD
	 jmp    tab,<tab
	    
	 seq.i  QB+QS*16,QB+QS*16+QD
	 jmp    tab,{tab
	 seq.i  QB+QS*20,QB+QS*20+QD
	 djn.f  <fast,tab

boot    
	spl     impboot,}QB+QS*21
	mov     cc,     @stptr1
for 5
	mov     {stptr, {stptr1
rof
	spl     *stptr1,<4000
stptr1  div.f   #split+away,#split+away+2
datone  dat     }1,>1

impboot
	spl     boot02,}QB+QS*22
i FOR 2

boot&i
j FOR 4
	mov.i   {pdst&i, <pdst&i
ROF
	mov.i   instr&i, impoff+(i-1)*istep
for i==1

;-break
	
	spl     *stptr1,}QB+QS*23
rof
	jmp     @pdst&i, >trash-15-i*2
psrc&i  dat     0,      0
pdst&i  dat     pend&i, pmpof&i+pend&i-pump&i
point&i equ     (pump&i-pmpof&i+impoff+(i-1)*istep)
pump&i  spl     #1, >prime&i
ptr&i   spl     pump&i-pmpof&i+impoff-istep-1, {1335+i  ;335+i
	add.f   #istep+1, ptr&i
prime&i mov.i   point&i, point&i-2
pend&i
instr&i mov.i   #istep, *0
ROF

clr     spl     #0,     0
split   spl     #-step, <step
stone   mov     >-step, step+1
	add     split,  stone
cnt     djn.f   stone,  <djnoff
stptr   
cc      dat     0,      #-9
	
	end start

