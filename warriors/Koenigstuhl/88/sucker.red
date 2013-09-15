;redcode verbose
;name Sucker
;author Stefan Strack
;strategy Robust pattern-bombing vampire
;strategy Submitted: @date@
;assert 1

mark    equ     (start+2+785)

start   spl     0
loop    sub     dist,   scanptr
        mov     scanptr,@scanptr
        jmp     loop

        dat     #0      ;1
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;2
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;3
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;4
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;5
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;6
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;7
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;8
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;9
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;10
        dat     #0
        dat     #0
        dat     #0
        
        dat     #0      ;1
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;2
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;3
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;4
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;5
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;6
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;7
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;8
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;9
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;10
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;1
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;2
        dat     #0
        dat     #0
        dat     #0

        dat     #0      ;3

scanptr jmp     dist-mark,mark
dist    mov     107,  <-107
        spl     0
        jmp     dist

        end     start
