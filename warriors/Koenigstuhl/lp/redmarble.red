;redcode-lp quiet
;name red marble
;author bjoern guenzel
;strategy standard bomber
;assert CORESIZE==8000

step    equ (4*17)
count   equ (998)

steps   dat #2*step,#2*step
cbomb   dat >2667,#last-steps+2
        dat 0,0
loop    add.f steps,ptr
        mov.i bomb,*ptr
ptr     mov.i x,x+step
x       djn.b loop,#count
clear   mov.i cbomb,>steps
        djn.f clear,>steps
last    jmp -1,>steps+2667

        for 20
        dat 0,0
        rof

bomb    jmp #1,#1
        end loop

