;redcode-b test
;name tworm14
;author Philip Thorne
;<waknuk@yahoo.com>
;strategy paper core
;strategy paper engine is from TheShortestWorm. Uncoordinated.
;wilkies  75 [-r10 -f]
;assert 1

LENGTH2 equ 7
GAP     equ 22
LENGTH  equ 5
WHERE   equ 1000

;TheShortestWorm
repclr  mov #LENGTH2,      $0
        mov <-1,            <(WHERE + LENGTH2 -1 -GAP)
        jmn $-1,            $-2
clr     mov.i -4,           <2
        spl   2
        jmp   -2,           -10
        jmp @(WHERE + LENGTH2 - 6 -GAP)
;redirect the replicated split. Also acts as padding.
dim     mov.i 2,            $(WHERE + LENGTH -4 + (start - dim) + LENGTH -3 )
        jmp repclr,         >4100    ;B trash
        spl $-3,            >4100    ;B trash ... split is too slow here?
;TheShortestWorm
start   mov #LENGTH,        $0
        mov <-1,            <(WHERE + LENGTH - 1)
        jmn $-1,            $-2
        spl dim,            >4096   ;B trash
        jmp @(WHERE + LENGTH - 4)
        end start

