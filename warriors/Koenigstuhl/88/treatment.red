;redcode verbose
;name Miss Treatment
;author Derek Ross
;strategy B-scan once through core.
;strategy DAT bomb, SPL carpet, then SPL/DAT coreclear ...
;strategy Written in '88 code
;strategy Submitted:

;assert 1

gap     equ 36
gap1st  equ 100
multipl equ ((CORESIZE-gap1st)-((CORESIZE-gap1st)%gap))

gate    dat #0, #-gap-gap1st
kill    dat #0, #-gap
        spl 0, -gap
stun    spl 0, -gap
clear   mov @bomb, <target
        djn clear, <gate
bomb    dat #0, #stun
start   
scan    sub #gap, target
        jmz scan, @target
        mov bomb, @target
        add #gap/4, target
target  jmp stun, #bomb+multipl

        end start
