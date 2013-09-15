;redcode-94
;name Recovery
;author Ian Oversby
;strategy Q^2 -> Paper/Stone
;strategy v0.2 An alternative stone
;assert 1

QB EQU (start-350)
QS EQU (QD*2)
QD EQU -100

GAP EQU 12
REP EQU 8
REP2 EQU 2

pdist   equ     2450

datz EQU        (table-3)
first   equ     (table-5)
datone  equ     bomba

half    equ     2692
full    equ     (2*half)
gate    equ     (inc-3200)

init    spl.b   #0,     #0
inc     spl.b   #0,     <gate
loop    mov.i   bmb,    @ptr
        add.ab  #full,  ptr
ptr     mov.i   bmb,    @full-1
        djn.f   loop,   <gate
bmb     dat.f   >1,     #half
; bmb   dat.f   #half,  >1

for 15
        dat.f   $0,     $0
rof

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
for 0
         seq.i  QB+QS*9,QB+QS*9+QD
         jmp    tab,}QB+QS*9+QD/2

         seq.i  QB+QS*15,QB+QS*15+QD
         jmp    tab,<tab

         seq.i  QB+QS*16,QB+QS*16+QD
         jmp    tab,{tab
         seq.i  QB+QS*20,QB+QS*20+QD
         djn.f  <fast,tab
rof
boot    spl.b   init,   <-1100
        spl.b   init,   <-1208
        spl.b   init,   <-1316
        jmp.b   paper,  <-1425

for 15
        dat.f   $0,     $0
rof

paper   spl.b   1,      <-1500
        spl.b   1,      <-1608
        spl.b   1,      <-1716
silk    spl.b   @0,     <117
        mov.i   }-1,    >-1
silk1   spl.b   @0,     <771
        mov.i   }-1,    >-1
        mov.i   bomba,  }3307
        mov.i   {silk1, <silk2
silk2   jmp.b   @0,     <748
bomba   dat.f   <2667,  <5334

end start

