;redcode-94
;name Q^2 ala Franz
;author Franz
;strategy qscan+jmp 0
;strategy testing the qscan
;assert CORESIZE==8000

;q^2 constants

;change this too
QB EQU (start+400)

;change these two sligtly .. or more then slightly ....
QS EQU 200
QD EQU 100

;forgot what this one is for .. is it for anything
COUNT EQU 6

;these are for the bombing ... 
GAP EQU 15
REP EQU 4

         org start

;the bomb and inceremt .. quite a funny way how this works ...
qinc     dat    }(-1)*GAP*2,}GAP

;the table is nops .. in case of decrements (rare occasion)
;the code would not die ...
         nop    10*QS,2*QS ; can get 21 values from this table
table    nop    4*QS,1*QS  ; and can also use the initial value
         nop    23*QS,3*QS ; of fnd

tab      add.a  table,table
slow     add.ab @tab,fnd
fast     add.b  *tab,@slow
which    sne.i  datz,@fnd
         add.ab #QD,fnd

;this is the .6c bombing
         add.ba fnd,fnd
qbomber  mov.i  qinc,@fnd
         mov.i  qinc,*fnd
fnd      mov.i  -GAP,@QB
         sub.x  qinc,fnd
         djn.b  qbomber,#REP
         jmp    boot,}-300

;standard qscan from probe

start
         seq.i  QB+QS*0,QB+QS*0+QD
         jmp    which,}QS*13

         seq.i  QB+QS*1,QB+QS*1+QD
         jmp    fast,}QB+QS*1+QD/2
         seq.i  QB+QS*2,QB+QS*2+QD
         jmp    fast,{tab
         seq.i  QB+QS*3,QB+QS*3+QD
         jmp    fast,}tab

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

         seq.i  QB+QS*22,QB+QS*22+QD
         djn.f  tab,tab
         seq.i  QB+QS*27,QB+QS*27+QD
         jmp    <fast,>tab
         seq.i  QB+QS*28,QB+QS*28+QD
         jmp    tab,>tab

         seq.i  QB+QS*30,QB+QS*30+QD
         jmp    tab,}tab

boot     jmp    #0

datz     end
