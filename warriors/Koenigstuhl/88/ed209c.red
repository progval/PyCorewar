;redcode
;name Ed209c
;author Marco Pontello
;assert 1

        Dat     #-11450
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Mov     -6,@-6
        Sub     #11449,-7
        Jmp     -2
Start   Mov     <Ist,<Dest
        Djn     Start,Lines
        Jmp     3009
Lines   Dat     #9
Ist     Dat     #-4
Dest    Dat     #3009
        End     Start
