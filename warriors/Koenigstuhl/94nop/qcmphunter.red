;redcode-b
;Name Qcmp-Hunter v0.5
;Author Randy W. Graham
;assert 1
;strategy OK, here's an attempt at a qscan Cmp-Hunter.

OPT     equ     44              ;mod 4
LEN     equ     (fini-adder)
DIFF    equ     13
BOMBS   equ     DIFF+setup-adder
MOVETO  equ     B03-BACK-LEN-1          ;where we move to

QDIFF   equ     88
QSTEP   equ     13
A01     equ     200
A02     equ     A01+(QDIFF*4)
A03     equ     A01+(QDIFF*8)
A04     equ     A01+(QDIFF*12)
A05     equ     A01+(QDIFF*16)
A06     equ     A01+(QDIFF*20)
A07     equ     A01+(QDIFF*24)
B01     equ     A01+(QDIFF*28)
B02     equ     A01+(QDIFF*32)
B03     equ     A01+(QDIFF*36)
B04     equ     A01+(QDIFF*40)
B05     equ     A01+(QDIFF*44)
B06     equ     A01+(QDIFF*48)
B07     equ     A01+(QDIFF*52)
C01     equ     A01+(QDIFF*56)
C02     equ     A01+(QDIFF*60)
C03     equ     A01+(QDIFF*64)
C04     equ     A01+(QDIFF*68)
C05     equ     A01+(QDIFF*72)
C06     equ     A01+(QDIFF*76)
C07     equ     A01+(QDIFF*80)
BACK    equ     15
QBOMB   equ     BACK+BACK

;qscan
scanner
qscan for 7
        sne.i   A&qscan,        A&qscan+(QSTEP)
        seq.i   A&qscan+(QDIFF*2),      A&qscan+(QDIFF*2+QSTEP)
        mov.a   #A&qscan-target,        target
rof
;mov.a makes sure to move so we still point at same location
        jmn.a   gobomb, target

qscan for 7
        sne.i   B&qscan,        B&qscan+(QSTEP)
        seq.i   B&qscan+(QDIFF*2),      B&qscan+(QDIFF*2+QSTEP)
        mov.a   #C&qscan-target,        target
rof
        jmn.a   gobomb, target

qscan for 7
        sne.i   C&qscan,        C&qscan+(QSTEP)
        seq.i   C&qscan+(QDIFF*2),      C&qscan+(QDIFF*2+QSTEP)
        mov.a   #C&qscan-target,        target
rof

        jmz.a   moveme, target          ;if we haven't found anything
gobomb  add.ab  target, target          ;get two pointers set up
        sne.i   *target,        @target ;if these differ, use them
        add.i   nope,   target          ;else, add our offsets
qbomb   mov.i   spltrap,        }target ;lay carpet on a-field
        djn.b   qbomb,  #QBOMB

moveme  spl     1,      <2667   ;2 instructions leave
        mov.i   -1,     #0      ;3 instructions leave
        spl     1,      <2667   ;6 instructions leave
        spl     1,      <2667   ;12 instructions leave
        mov.i   }datsite,       >datsite
        djn.b   nope,   #LEN
        spl.a   cmper+MOVETO-1, >fini+1
clear   mov.i   traps,  datsite         ;hide pointers to self
        mov.i   traps,  -2

nope    dat.f   >(QDIFF*2),     >(QDIFF*2)
target  dat.f   #0,     #QSTEP

datsite dat.f   adder,  MOVETO

;the real cmp-hunter
adder   add.f   spltrap,        cmper           ;increment pointers
cmper   cmp.i   adder-DIFF-OPT, adder-OPT       ;small scan distance
        slt.ab  #LEN+BOMBS,     cmper   ;don't bomb ourself unless @adder
        djn.i   adder,  <-381   ;need to check -381 for better value
setup   mov.ab  #BOMBS, traps   ;set up djn line
        mov.i   spltrap,        }cmper  ;bomb a-field
traps   djn.b   -1,     #0
        sub.a   #BOMBS, cmper   ;reset scan line a-field
        jmz.i   adder,  adder-1 ;fall out when we bomb ourself
spltrap spl.a   #0-OPT, <0-OPT  ;here and datadd after sweep make gate
dosweep mov.i   1,      <traps
datadd  dat.f   <-1-OPT,        <-1-OPT+2667
fini    end     scanner
