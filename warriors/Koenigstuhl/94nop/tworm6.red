;redcode-b verbose
;name tworm6
;author PBT
; <waknuk@yahoo.com>
;strategy paper core
;strategy paper is the/from TheShortestWorm, then self-replicate.
;strategy Now replicating core-clear too but uncoordinated as are
;strategy B-field trashes.
;assert 1

LENGTH  equ 5
WHERE   equ 1000

;Core clear
clr     mov 2,              <1
        jmp -1,             -1
repclr  mov.i clr,          -50
        mov.i clr+1,        -50
        spl   -52
        jmp   repclr
;TheShortestWorm
start   mov #LENGTH,        $0
        mov <-1,            <(WHERE + LENGTH - 1)
        jmn $-1,            $-2
        spl dim,            >-20    ;B trash
        jmp @(WHERE + LENGTH - 4)
;redirect the replicated split
dim     mov.i 2,            $(WHERE + LENGTH - 1 - 6)
        jmp repclr,         >4100    ;B trash
        spl $-3,            >-20    ;B trash
        end start

