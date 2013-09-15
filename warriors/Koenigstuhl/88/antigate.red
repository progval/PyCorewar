;redcode
;name Anti Gate Spiral
;author P.E.M & E.C
;assert CORESIZE==8000

inc1    equ     2667
inc2    equ     2667+2667

imp1    equ     imp
imp2    equ     imp+2667
imp3    equ     imp+2667+2667

start   mov imp,imp2
        mov imp,imp2+1
        mov imp,imp2+2
        mov imp,imp3
        mov imp,imp3+1
        mov imp,imp3+2

; spirale 1
debut
        spl 16
        spl 8
        spl 4
        spl 2
        jmp imp1
        jmp imp2+1
        spl 2
        jmp imp3+1
        
        jmp imp1+inc1
        spl 4
        spl 2
        jmp imp2+1+inc1
        jmp imp3+1+inc1
        spl 2
        jmp imp1+inc2
        jmp imp2+1+inc2
                
        spl 8
        spl 4
        spl 2
        jmp imp3+1+inc2
        dat #0
        spl 2
        dat #0
        dat #0
        spl 4
        spl 2
        dat #0
        dat #0
        spl 2
        dat #0
        dat #0

imp     mov 0,2668
        mov 0,2668
        mov 0,2668
        end start
