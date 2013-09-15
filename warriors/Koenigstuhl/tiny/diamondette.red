;redcode-94x
;name Diamondette
;author David Houston
;assert CORESIZE==800

org     bomber

dstep   equ     628
dstream equ     500

bomber  spl     #dstep, -dstep
        mov     -199 * dstep, 2 + 198 * dstep
        mov     dbomb, *-1
        add.f   -3, @-1
        djn.f   -3, <dstream

        for     14
        dat     0, 0
        rof

dbomb   dat     >-1, >1
