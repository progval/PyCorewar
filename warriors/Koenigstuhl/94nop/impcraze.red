;redcode-b
;name Imp Craze 91.43
;author Planar
;strategy imp spiral: vector-launched, 43-point, 91-process
;assert 1

threads equ     91
step    equ     3907

        org     start

start   spl     1, <-1000
        mov.i   -1, #1
        spl     1, <-2000
        spl     1, <-1500
        mov.i   -1, #1
        spl     1, <-2500
        spl     1, <-3000

        djn.a   @vector, #1
imp     mov.i   #1, step
i       for     threads
        dat     #0, #imp+(threads-i)*step
        rof
vector  equ     imp+threads

        end
