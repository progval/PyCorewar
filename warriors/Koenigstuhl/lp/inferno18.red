;redcode-lp
;name Inferno 1.8
;author Philip Kendall
;strategy Tornado-based dat bomber -> d-clear
;strategy 1.8: now with stun power
;assert CORESIZE == 8000

step    equ     3205
bomb1   equ     (hit+step)
trigger equ     (hit-step)

ptr     equ     (cbomb-1)
cstart  equ     (safety+3-ptr)

cbomb   dat.f   >5335,cstart
mbomb   mov.i   step,1
dbomb   jmp.a   #1,1
loop    mov.i   dbomb,*stone
x       mov.i   mbomb,@stone
stone   mov.i   bomb1,*bomb1+step
        add.f   inc,@x
hit     jmz.f   loop,trigger
inc     spl.a   #(step*3),>(step*3)
clear   mov.i   cbomb,>ptr
        djn.f   clear,>ptr
safety  jmp.a   inc,>ptr

        end     loop
