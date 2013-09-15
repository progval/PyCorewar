;redcode-94
;name Digitalis 2
;author Christian Schmidt
;strategy q^2 -> clear/imp
;assert 1

        org     start

QB      equ     (start-350)
QS      equ     (0-200)
QD      equ     100
GAP     equ     8
REP     equ     15
datz:   equ     (start+200)
ist     equ     1143
bptr1   equ     2000

qinc    dat     >(-1)*GAP*2, >GAP

        dat     10*QS,       2*QS 
table:  dat     4*QS,        1*QS 
        dat     23*QS,       3*QS 

tab:    add.a   table,       table
slow:   add.ab  @tab,        fnd
fast:   add.b   *tab,        @slow
which:  sne.i   datz,        @fnd
        add.ab  #QD,         fnd

        add.ba  fnd,         fnd
qbo     mov.i   qinc,        @fnd
        mov.i   qinc,        *fnd
fnd     mov.i   (-1)*(GAP/2),@QB
        sub.x   qinc,        fnd
        djn.b   qbo,         #REP
        jmp     boot,        }-300

start:
                seq.i  QB+QS*0,QB+QS*0+QD
                jmp    which,}QS*13

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

boot     mov    ptr,         bptr1
         mov    clrb,        bptr1
boot2    mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3

istart   spl    1
         spl    1
         spl    1
         spl    1
         spl    1
         spl    2
         djn.f  imp,         <-250
         add    bst,         -1
         djn.f  @bptr3,      <-400

bst      dat    ist,         -100

imp      mov.i  #ist,        *0

ptr      dat    0,           2150
clrb     dat    >2667,       25
clear    spl    #0,          >ptr-16
loop     mov    clrb-16,     >ptr-16
cc       djn.f  loop,        >ptr-16

bptr3    dat    cc+1,        boot2+bptr1+19
