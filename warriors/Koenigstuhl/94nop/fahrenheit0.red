;redcode-94
;name Fahrenheit 0
;author Planar
;assert CORESIZE == 8000

steps   spl     #2044, <3039
ptr     mov.i   <100, <1000
attack2 mov.i   <-2000, *-1
        add.f   steps, ptr
        djn.f   -3, {attack2
        end
