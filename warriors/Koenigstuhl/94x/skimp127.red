;redcode-94x
;name Skimp 127
;author Jay Han
;strategy A simple stone+imp
;assert CORESIZE==55440

t       equ             12223
n       equ             127

        org             s

s       spl.b   1
        spl.b   1
        spl.b   1
        spl.b   1
        spl.b   1
        spl.b   1
        mov.i   -1, 0
        spl.b   1
        spl.b   2
        jmp.b   imp
        add.a   #t, -1
d       dat.f   0, 0

imp     mov.i   0, t

        end

