;redcode
;name Old School Flavor
;author m r bremer
;strategy one shoot bomb/scan
;startegy will be interesting to see how this does.
;strategy i don't expect good things.
;assert 1

STEP EQU (32)            
START EQU (700)
        dat <2667, #-18
clear   spl 0, <-(STEP/2)
        mov @ptr, <scan
        jmp -1, 0
for (STEP/2)-7
        dat #0, #0
rof
first   add #STEP, 2
        mov clear, @1
scan    jmz first, @START
ptr     jmp clear, clear

end first
