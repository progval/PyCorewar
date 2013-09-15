;redcode-b quiet
;name ImpClear
;author bjoern guenzel
;strategy Clearing Imp
;assert CORESIZE==8000
;release 3.4.96
;Planar-class: Imp,Clear?

step    equ 2667

        mov imp,imp-step
        mov imp,bomber+step
        mov bomber-1,bomber-100

        spl 1                   ;create 6-processes
        mov -1,0
        spl 1

        jmp @1,}0

z for 3
        dat #1,imp+(z-1)*step
rof

z for 3
        dat #1,bomber+(z-1)*step
rof

bomber   mov -1330,2*step-1330
imp      mov -step,step
