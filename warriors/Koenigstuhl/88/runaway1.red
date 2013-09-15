;redcode
;name RUNAWAY 1
;author Marco Pontello
;assert 1

Check1  Dat     #64
Check2  Dat     #56
Count   Dat     #8
Start   Cmp     <Check1,<Check2
        Jmp     Copy
        Djn     Start,Count
        Mov     #64,Check1
        Mov     #56,Check2
        Mov     #8,Count
        Jmp     Start
Copy    Mov     5,64
        Mov     5,64
        Mov     5,64
        Mov     5,64
        Jmp     62
        Dat     #16
        Mov     -1,@-1
        Add     #4,-2
        Jmp     -2
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Dat     #0
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        Djn     <4,<16
        End     Start
