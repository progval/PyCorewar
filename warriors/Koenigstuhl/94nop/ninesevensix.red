;redcode-94 test
;name Nine Seven Six
;author M R bremer
;strategy q^2 scan --> bomber & imp
;strategy stole most of the q^2 from probe
;strategy submitted: @date@
;assert CORESIZE == 8000

STEP EQU -445           ; must be negative
QB EQU (start+1800)
QS EQU (QD*2)
QD EQU 100

GAP EQU 12
REP EQU 8
REP2 EQU 2

org start

gate    dat 0, wipe+6
for 2
        dat 0, 0
rof
first   spl #STEP, >gate-loop
        mov.i }-2200, *loop+STEP*2
        mov.i first, @-1
        add.f 1, -2
loop    djn.f -3, <STEP*2
        mov wipe, >gate
last    djn.f -1, >gate
for 3
        dat 0, 0
rof
wipe    dat <2667, -gate+3;25
for 16
        dat 0, 0
rof

        dat    10*QS, 2*QS ; can get 21 values from this table
table   dat     4*QS, 1*QS ; and can also use the initial value
        dat    23*QS, 3*QS ; of fnd

qinc    spl    #GAP, -GAP
tab     add.a  table, table
slow    add.a  @tab, fnd
fast    add.ba *tab, @slow
which   sne.i  datz, *fnd
        add.a  #QD, fnd
        mov.i  datone, *fnd
        add.ab fnd, fnd

fnd     mov.i  QB, GAP/2
        add.f  qinc, fnd
        mov.i  datone, *fnd
        djn.b  fnd, #REP
        spl    impboot, }QS*13
        jmp first
start 
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
        spl impboot, 0
        jmp first, 0

FOR 0
        seq.i  QB+QS*21,QB+QS*21+QD
        jmp    tab,{fast
        seq.i  QB+QS*22,QB+QS*22+QD
        djn.f  tab,tab
        seq.i  QB+QS*27,QB+QS*27+QD
        jmp    <fast,>tab
        seq.i  QB+QS*28,QB+QS*28+QD
        jmp    tab,>tab
        seq.i  QB+QS*30,QB+QS*30+QD
        jmp    tab,}tab
ROF
datone  dat 1, 1
datz    dat 0, 0

imp_sz  equ     2667

impboot spl     1      ,#0
        spl     1      ,#0
        spl     <0     ,#vector+1
        djn.a   @vector,#0

imp     mov.i   #imp_sz, *0

        jmp     imp+imp_sz*7,imp+imp_sz*6   
        jmp     imp+imp_sz*5,imp+imp_sz*4   
        jmp     imp+imp_sz*3,imp+imp_sz*2   
vector  jmp     imp+imp_sz  ,imp
        

