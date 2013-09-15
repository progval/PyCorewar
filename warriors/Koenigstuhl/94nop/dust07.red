;redcode-94b
;name Dust 0.7
;author Justin Kao
;strategy Guenzel-style clear and imp spiral.
;strategy Turn opponents into dust and blow them away! :)
;assert 1

impsize equ     1143

        org     start

ptr     dat     0,      150
clrbomb dat     <2667,  25
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
        dat     0,      0
clear   spl     #0,     >ptr
loop    mov     clrbomb,>ptr
        djn.f   loop,   >ptr

        for     26
        dat     0,      0
        rof

lstep   dat     impsize,-10
start   spl     1
        spl     1
        spl     1
        spl     1
        spl     1
        spl     2
        djn.f   imp,    <-500
        add     lstep,  -1
        djn.f   clear,  <-1300
imp     mov.i   #1,     impsize

