;redcode-94x
;name The Wasp
;author Lukasz Grabun
;strategy slightly modified Spooky Wench
;startegy constants generated numerically
;strategy optimized for first 10 warriors on Koenigstuhl Tiny Hill
;assert CORESIZE==800

tStep   equ     586
tTime   equ     156

        spl     #0              , #0
tMov    mov     tBmb            , @tLoop
        add     #tStep          , tLoop
tLoop   djn.f   tMov            , {-1-(tTime*tStep)
tBmb    dat     {4              , >1
