;redcode-lp
;name Triad
;author Robert Macrae
;assert CORESIZE==8000
;strategy Q^2 scan and a trio of D-clear clones.

; Limited processes mean you can't be stunned, so its worth
; splitting into several parts to resist DAT bombers.
; This makes for slow boots, hence good Q^2 targets; if you
; can't beat them...
; I split into 3 copies, 2667 apart. This means that I retain a
; reasonable gate against 3-point imps though 1-points tend to
; roll through.

ORG start

QB      EQU (start+400)
QS      EQU 404
QD      EQU 202
COUNT   EQU 6

GAP     EQU 15
REP     EQU 4
datz    EQU (table-3)

; Still ripping off Probe. Neat bomb pattern :)

         dat    10*QS,  2*QS ; can get 21 values from this table
table:   dat     4*QS,  1*QS ; and can also use the initial value
         dat    23*QS,  3*QS ; of fnd
qbomb:   dat    -300,   GAP
qinc:    dat    GAP,    -GAP

tab:     add.a  table,  table
slow:    add.ab @tab,   fnd
fast:    add.b  *tab,   @slow
which:   sne.i  datz,   @fnd
         add.ab #QD,    fnd

         mov.i  qbomb,  @fnd
fnd:     mov.i  -GAP/2, @QB
         add.ba fnd,    fnd
         mov.i  qbomb,  *fnd
         add.f  qinc,   fnd
         mov.i  qbomb,  @fnd
         djn.b  -3,     #REP
         jmp    boot,   }-300

start:
         seq.i  QB+QS*11,QB+QS*11+QD
         jmp    slow,<tab
         seq.i  QB+QS*12,QB+QS*12+QD
         djn.f  slow,tab
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
         jmp    boot


for MAXLENGTH-CURLINE-22
        DAT     0,     0
rof

gap     equ     5
gate    equ     (loop-gap)

boot    MOV     init,  loop+1200-gap
        MOV     init,  loop+1200-gap+2667
        MOV     init,  loop+1200-gap+2*2667
        SPL     1,     >-990
        MOV     {ptr1, <ptr1
        MOV     {ptr1, <ptr1
        MOV     {ptr2, <ptr2
        MOV     {ptr2, <ptr2
        MOV     {ptr3, <ptr3
        MOV     {ptr3, <ptr3
        SPL     @ptr1, >-390
        SPL     @ptr2, >-590
        SPL     @ptr3, >-790
        JMP     @ptr1, }0

ptr1    DAT     db+1,  db+1200+1
ptr3    DAT     db+1,  db+1200+1+2*2667
ptr2    DAT     db+1,  db+1200+1+2667

init    DAT     0,     -2667+120
loop    MOV     db,    >gate
        DJN.f   loop,  >gate
        JMP     loop,  >gate
db      DAT     1,     gap+5

end

