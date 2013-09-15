;redcode-imt2
;name Red Carpet
;author Robert Macrae
;assert 1
;CORESIZE==80
;strategy Carpet-bomber variant of Red Rain.
;strategy Beat DClear, lose to dwarves... be pretty.

; Should kill any L4 opponent before I suicide?

db              equ    (ptr-1)

ptr             add.ab #3,    #7
scan            jmz.f  ptr,   >ptr
                mov.i  db,    <ptr
                jmp    scan,  <ptr

                end    scan

