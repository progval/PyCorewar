;redcode-b
;Name Hunter v2.6
;Author Randy W. Graham
;assert CORESIZE>1
;strategy a-scanner based on XTC and rave.  Don't bomb self, lay
;strategy carpet of spl bombs.  After avoiding hitting ourself
;strategy several times (twice through core), sweep and sit.
;strategy As is true of all my programs, I still can't beat imps.
;strategy v2.5 Hey, '94 rules -- .f scan!!!  Now catches imps some.
;strategy v2.6  Was using wrong 3/9 point imp gate.

OPT     equ     98              ;mod 2
BOMBS   equ     12
LEN     equ     (fini-hunt)
TIMES   equ     16      ;how many times to hit ourself

hunt    add     #OPT,   ptr
ptr     jmz.f   -1,     ptr+OPT
        slt     #LEN+1, ptr
zero    djn     hunt,   #TIMES
        jmz     spltrap,        zero
        mov     #BOMBS, traps
        mov     spltrap,        >ptr
traps   djn     -1,     #0
        sub     #BOMBS, ptr
        jmp     hunt,   <2667
spltrap spl     0,      #0
dosweep mov     1,      <-1
        dat     <2667,  <2667*2
fini    end     ptr
