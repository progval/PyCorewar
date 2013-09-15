;redcode-94
;name Scanitator 4
;author Christian Schmidt
;strategy Q^2=>p-switcher=>paper, stone
;strategy  v4   new mod 2 stone (carbonite)
;assert 1

QB              equ     (start+400)
QS              equ     200
QD              equ     100
GAP             equ     15
REP             equ     6
_RES            equ             #0
_STR            equ             #111
STEP1           equ             1800
STEP2           equ             3740
STEP3           equ             STEP1-STEP2+2*8-OFF
OFF             equ             -50
bootdist        equ     3000

                org     start


;----------Q^2 Scan----------

qbomb:          jmp     -200, GAP
qinc:           dat     GAP,-GAP

                nop     10*QS, 2*QS 
table:          nop             4*QS, 1*QS 
                nop     23*QS, 3*QS 

tab:            add.a   table,table
slow:           add.ab  @tab,fnd
fast:           add.b   *tab,@slow
which:          sne.i   datz,@fnd
                add.ab  #QD,fnd

                mov.i   qbomb,@fnd
fnd:            mov.i   -GAP/2,@QB
                add.ba  fnd,fnd
                mov.i   qbomb,*fnd
                add.f   qinc,fnd
                mov.i   qbomb,@fnd
                djn.b   -3,#REP
                jmp     think,}-300

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

;----------p-logic----------

think
res             ldp.ab          _RES,   #0
str             ldp.a           _STR,   str1
                sne.ab          #0,     res     
lost            add.a           #1,     str1    
                mod.a           #2,     str1    
win             stp.ab          str1,   _STR
str1            jmp             @0,     boot
                dat             0,      paper

;----------paper--------

paper           spl             1,      <1000
                spl             1,      <1500
                spl             1,      <2000
p2              spl             @0,     }STEP1
                mov.i           }-1,    >-1
                spl             @0,     }STEP2
                mov.i           }-1,    >-1
                mov.i           3,      >OFF-5334
                mov.i           {-3,    <1
                jmp             @0,     >STEP3
b               dat.f           >2667,  >5335

;----------stone (carbonite:-)--------

dbomb           dat             >-1,    >1
scopy           spl             #0,     <-100
                mov             dbomb,  tar-197*3500
tar             add             #197,   -1      
                djn.f           -2,     <-1151

boot            mov             }sptr,  }dptr
                djn             -1,     #4
                mov             >sptr,  >dptr
                spl             dptr+bootdist, <-400
                mov             dbomb,  dptr
dptr            dat             bootdist, bootdist+dbomb-scopy
sptr            dat             scopy,  dbomb


datz:           dat             0,      0
