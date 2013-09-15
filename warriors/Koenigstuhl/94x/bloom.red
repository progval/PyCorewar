;redcode-94x
;name Bloom
;author Jay Han
;strategy Distributed core-clear
;assert CORESIZE==55440

        org s

s       mov.i >i1, >o1
        mov.i >i1, >o1
        mov.i >i1, >o1
        mov.i >i1, >o1
        mov.i >i1, >o1
        mov.i front, front+9240+27720
        mov.i back, back+9240+27720
        spl.b front+9240

        mov.i >i2, >o2
        mov.i >i2, >o2
        mov.i >i2, >o2
        mov.i >i2, >o2
        mov.i >i2, >o2
        mov.i front, front-9240+27720
        mov.i back, back-9240+27720
        spl.b front-9240

        mov.i >i3, >o3
        mov.i >i3, >o3
        mov.i >i3, >o3
        mov.i >i3, >o3
        mov.i >sp, >o3
        mov.i >sp, >o3
        mov.i >sp, >o3
sp      jmp.b front+27720, e

front   dat 0,0
back    dat 0,1

i1      dat 0, d
i2      dat 0, d
i3      dat 0, d
o1      dat 0, front+9240
o2      dat 0, front-9240
o3      dat 0, front+27720

d       mov.i 3, <27720
        mov.i 2, >27720
        djn.b -2, #9200
        spl.b 0, <-5
        dat <-6, <-7

e       mov.i 2, <-2
        jmp.b -1, <-7
        dat <-1, <-1

        end

