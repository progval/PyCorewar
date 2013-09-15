;redcode-lp quiet
;name red eye
;author bjoern guenzel
;strategy scan, nothing special
;assert CORESIZE==8000

step    equ (4*17)
dec     equ (loop-1000)

loop    add.f steps, scan
scan    sne.i hit,hit+step
hit     djn.f loop,<dec
        mov.i bomb,*scan
        mov.i bomb,@scan
        jmp *hit,<dec
        dat 0,0
bomb    jmp #clear-hit,>-1
steps   dat #2*step,2*step
clbomb  dat >2667,#clear+3-steps
        dat 0,0
spl     #0,<0
clear   mov.i clbomb,>steps
        jmp -1,>steps+2667
        end loop

