;redcode-imt2
;name Obvious
;author Leonardo H. Liporati
;strategy An obvious stone
;assert CORESIZE==80
 
value   equ 46
start   spl #-value, {value
        add.f start, 1
        mov.i <0, 0
        djn.f -2, {start
        end start

