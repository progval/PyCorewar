;redcode-b test
;name qDeath 2.2
;author Ryan Coleman/Philip Kendall
;strategy QScan -> Scissor
;strategy Testing some ideas for CW 66
;assert CORESIZE==8000

ORG start

CDIST   equ 12
IVAL    equ 42
OFFSET  equ (2*IVAL)
FIRST   equ scan+OFFSET+IVAL
DJNOFF  equ -431
BOMBLEN equ CDIST+2
gate    equ     (scan-3)

scan    sub.f  incr,comp
comp    cmp.i  FIRST,FIRST-CDIST
        slt.a  #bomb-comp+BOMBLEN,comp
        djn.f  scan,<FIRST+DJNOFF
        mov.ab #BOMBLEN,count
split   mov.i  bomb,>comp
count   djn.b  split,#0
        sub.ab #BOMBLEN,comp
        jmn.a  scan,scan
incr    spl.a  #-IVAL,>-IVAL
clear   mov.i  cbomb,>gate
        djn.f  clear,>gate
cbomb   dat.f  >5335,(cbomb-gate+3)
bomb    spl.a  #0,0

QB EQU (start+400)
QS EQU 200
QD EQU 100

GAP EQU 15
REP EQU 6
datz    equ     (-CURLINE-1)

         dat    10*QS, 2*QS ; can get 21 values from this table
table:   dat     4*QS, 1*QS ; and can also use the initial value
         dat    23*QS, 3*QS ; of fnd
qbomb:   jmp    -200,GAP
qinc:    dat    GAP,-GAP

tab:     add.a  table,table
slow:    add.ab @tab,fnd
fast:    add.b  *tab,@slow
which:   sne.i  datz,@fnd
         add.ab #QD,fnd

         mov.i  qbomb,@fnd
fnd:     mov.i  -GAP/2,@QB
         add.ba fnd,fnd
         mov.i  qbomb,*fnd
         add.f  qinc,fnd
         mov.i  qbomb,@fnd
         djn.b  -3,#REP
         jmp    boot,}-300

start:   seq.i  QB+QS*13,QB+QS*13+QD
         jmp    fast,{fast

         seq.i  QB+QS*21,QB+QS*21+QD
         jmp    tab,{fast
         seq.i  QB+QS*22,QB+QS*22+QD
         djn.f  tab,tab
         seq.i  QB+QS*27,QB+QS*27+QD
         jmp    <fast,>tab
         seq.i  QB+QS*28,QB+QS*28+QD
         jmp    tab,>tab


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
         seq.i  QB+QS*0,QB+QS*0+QD
         jmp    which,}QS*13 ; qinc+GAP

         seq.i  QB+QS*1,QB+QS*1+QD
         jmp    fast,}QB+QS*1+QD/2
         seq.i  QB+QS*2,QB+QS*2+QD
         jmp    fast,{tab
         seq.i  QB+QS*3,QB+QS*3+QD
         jmp    fast,}tab

         seq.i  QB+QS*30,QB+QS*30+QD
         jmp    tab,}tab

bdist   equ     3422

boot
i       for     (bomb-scan+1)
        mov.i   (bomb+1-i),{bptr
        rof
bptr    spl.a   (bomb+bdist),#0
        div.f   bptr,bptr

end
