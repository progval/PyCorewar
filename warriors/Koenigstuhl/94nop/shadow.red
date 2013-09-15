;redcode-94
;name Shadow
;author Christian Schmidt
;strategy q^2 -> stone/paper
;strategy v3 modified stone, now faster
;strategy v3.1 better pocket for the stone
;assert 1

        org     start

QS      equ     (0-200)
QD      equ     100
QB      equ     (start-350)
CR      equ     (fnd-which)
datz    equ     (table-3)
GAP     equ     8
REP     equ     15
cBptr   equ     (1724-66);973
spcsz   equ     2381;2382
impsz   equ     (127*37) ;2794


qinc    dat     >(-1)*GAP*2, >GAP

        dat     9*QS,        1*QS
table:  dat     5*QS,        2*QS
        dat    13*QS,       17*QS

P:      add.f  table,       table
slow:   add.ab *P,          fnd
fast:   add.b  @P,          @-1

which:  sne.i  datz,        @fnd
        add.ab #QD,         fnd

        add.ba fnd,         fnd
qbo     mov.i  qinc,        @fnd
        mov.i  qinc,        *fnd
fnd     mov.i  (-1)*(GAP/2),@QB
        sub.x  qinc,        fnd
        djn.b  qbo,         #REP
        jmp    cBoot,       }-300

start:
        seq.i  QB+QS*0,QB+QS*0+QD
        jmp    which, 0

        seq.i  QB+QS*2,QB+QS*2+QD
        jmp    fast, 0
        seq.i  QB+QS*1,QB+QS*1+QD
        jmp    fast, <P
        seq.i  QB+QS*17,QB+QS*17+QD
        jmp    fast, >P

        seq.i  QB+QS*7,QB+QS*7+QD
        jmp    slow, 0
        seq.i  QB+QS*6,QB+QS*6+QD
        jmp    slow, <P
        seq.i  QB+QS*22,QB+QS*22+QD
        jmp    slow, >P
        seq.i  QB+QS*11,QB+QS*11+QD
        jmp    slow, {P
        seq.i  QB+QS*15,QB+QS*15+QD
        jmp    slow, }P
        seq.i  QB+QS*10,QB+QS*10+QD
        djn.f  slow, P

        seq.i  QB+QS*5,QB+QS*5+QD
        jmp    >fast, 0
        seq.i  QB+QS*9,QB+QS*9+QD
        jmp    >fast, {P
        seq.i  QB+QS*13,QB+QS*13+QD
        jmp    >fast, }P

        seq.i  QB+QS*14,QB+QS*14+QD
        jmp    P, 0
        seq.i  QB+QS*8,QB+QS*8+QD
        jmp    P, <P
        seq.i  QB+QS*12,QB+QS*12+QD
        jmp    P, {P
        seq.i  QB+QS*32,QB+QS*32+QD
        jmp    P, }P
        seq.i  QB+QS*20,QB+QS*20+QD
        djn.f  P, P

        seq.i  QB+QS*4,QB+QS*4+QD
        jmp    }slow, 0
        seq.i  QB+QS*3,QB+QS*3+QD
        jmp    }slow, {P
        seq.i  QB+QS*19,QB+QS*19+QD
        jmp    }slow, }P
        seq.i  QB+QS*18,QB+QS*18+QD
        djn.f  <fast, P

        seq.i  QB+QS*36+CR,QB+QS*36+QD+CR
        jmp    }fast, 0

cBoot   spl     rStart,     <-1000          ;strat the paper
        mov     cBomb,      rCell1+cBptr+198
        mov     cSp-1,      rCell1+cBptr-1
        mov     cSp,        rCell1+cBptr
        mov     cSp+1,      rCell1+cBptr+1
        mov     cSp+2,      rCell1+cBptr+2
        mov     cSp+3,      rCell1+cBptr+3
        jmp     rCell1+cBptr-1,  <-400      ;----> 1 process for the stone

cSp2    spl     #0,         #0
cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0
        djn.f   -2,         <-1151
cBomb   dat     >-1,        >1

rStart  spl     2,          <400
        spl     1,          <400
        spl     1,          <400
cStart  spl     rCell1+cBptr-1,  <402       ;---> 6 processes for the stone

rCell1  spl     @0,         spcsz
        mov     }rCell1,    >rCell1
rCell2  spl     @0,         impsz
        mov     }rCell2,    >rCell2
        spl     rCell2,     {rCell2
        mov.i   #2*spcsz,   }-spcsz*1
        mov.i   #2*spcsz,   }-spcsz*1
        mov.i   #2*impsz,   }-impsz*1

	end
