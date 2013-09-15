;redcode-b verbose
;name Beescan
;author M. J. Pihlaja
;strategy oneshot/stone -> clear
;strategy fixed a feature
;assert 1
 
STEP    equ     (step-3-ptr)
FIRST   equ     (-14+2+STEP*125)

        dat     0       ,       4000
        dat     <step-1-ptr,<step-1-ptr-2668
step    spl     #STEP   ,       <STEP+1
        mov.i   @clptr  ,       {ptr
        mov.i   @clptr  ,       {ptr
        djn.b   -2      ,       <step-2
        dat     0       ,       0
        dat     0       ,       0
        dat     0       ,       0
clptr   dat     0       ,       <step
        dat     0       ,       0
        dat     0       ,       0
stone   add     step    ,       @pptr
ptr     mov     <FIRST+4000,    <FIRST
        jmz.f   stone   ,       <ptr
pptr    sne.x   {ptr    ,       }ptr
        mov.x   @pptr   ,       @pptr
        jmp     step    ,       }ptr
        end     stone
