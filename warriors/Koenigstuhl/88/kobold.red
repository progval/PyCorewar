;redcode
;name Kobold
;author Stefan Strack
;strategy Fast dwarf: bombs with DAT 0 and decrements, finally clears core
;strategy (optimized version of Scanners' Nightmare)
;strategy Submitted: @date@
;assert 1

COUNT   equ 431
FIRST   equ (5+(37*COUNT))

move    mov <FIRST,FIRST+13
        add incr,move
        djn move,#2999+COUNT
incr    mov -37,<-37
        jmp incr

        end move
