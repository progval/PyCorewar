;redcode
;name cunning mushroom
;please use this version for tournament
;author bjoern guenzel
;password abc
;assert 1
;released 22.10.96
;strategy '88 style dodger (clear->gate)
;strategy but the clear sucks...
;strategy written for Beppe's Tournament '96
;strategy another loser...

scandist equ (-boodist+300)
boodist equ 3000
empty   equ (start-1)

start   jmz 0,<ptr
        mov <source,<ptr
        djn -1,#7
ptr     jmp @0,#scandist

clptr   jmp clear,-1
bomb    dat <gate-hit,<gate-hit
gate    dat #0,#0
        dat #0,#0
clear   spl 0,<gate
hit     mov bomb,<clptr
        djn -1,<-4000
source  dat #0,#0

boot    mov empty,gate
        mov gate,gate+1

        for 11
        mov <source,<booptr
        rof

booptr  jmp @0,boodist

        for 10
        dat <1,<1
        rof

;perhaps I can fool some scanners :-/
        for (MAXLENGTH-CURLINE)/7

        mov 0,0
        jmp 0,0
        spl 0,0
        dat #0,#0
        djn 0,0
        dat #1,#0
        spl 2,0

        rof
        end boot
