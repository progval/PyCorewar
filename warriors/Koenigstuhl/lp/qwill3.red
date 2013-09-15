;redcode-lp
;name Qwill v3
;author Ryan Coleman
;strategy q scan --> mutating bomber
;assert 1
;strategy v2 booted bomber
;strategy v3 changed to duo bombers
;strategy my entry into the lp round of Redcode Maniacs '98

org start

QB EQU (start+400)
QS EQU 200
QD EQU 100
COUNT EQU 6
        _RES    equ 0           
        _STR    equ 1           
dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   
range   equ     933     
CDIST   equ 12
IVAL    equ 42
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ (2*IVAL)
DJNOFF  equ -431
BOMBLEN equ CDIST+2


GAP EQU 15
REP EQU 6

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

start:
         seq.i  QB+QS*0,QB+QS*0+QD
         jmp    which,}QS*13 ; qinc+GAP

         seq.i  QB+QS*1,QB+QS*1+QD
         jmp    fast,}QB+QS*1+QD/2
         seq.i  QB+QS*2,QB+QS*2+QD
         jmp    fast,{tab
         seq.i  QB+QS*3,QB+QS*3+QD
         jmp    fast,}tab

         seq.i  QB+QS*13,QB+QS*13+QD
         jmp    fast,{fast

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


; insert stuff here

jmp boot,boot



;twill bomber

offset  dat #-5138,#5138
tart    jmp 0, 0
        add offset,1
        mov <0,0
        jmp -2,0
        
;boot

bootcst EQU 1000

boot mov offset+0,offset+bootcst+0
     mov offset+1,offset+bootcst+1     
     mov offset+2,offset+bootcst+2     
     mov offset+3,offset+bootcst+3     
     mov offset+4,offset+bootcst+4     
     spl offset+2+bootcst,offset+2+bootcst
     mov offset+0,offset+bootcst+0+4010
     mov offset+1,offset+bootcst+1+4010     
     mov offset+2,offset+bootcst+2+4010     
     mov offset+3,offset+bootcst+3+4010     
     mov offset+4,offset+bootcst+4+4010     
     jmp offset+2+bootcst+4010,offset+2+bootcst+4010
   


dat 0,0
dat 0,0
dat 0,0

for (MAXLENGTH-CURLINE)-3
dat -1,-1
rof

datz   dat 0,0
       dat 0,0
       dat 0,0

end
