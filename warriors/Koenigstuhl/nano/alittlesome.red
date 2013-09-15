;redcode-imt2
;name A Little Something
;author Planar
;strategy simple stone
;assert 1

stream  equ     (const-4)
ptr     equ     (const-3)
bomb    equ     (const-1)

        org     const

const   spl     #-1, -26
loop    mov.i   const, <ptr
        add.f   ptr, ptr
        djn.f   loop, <stream

        end

