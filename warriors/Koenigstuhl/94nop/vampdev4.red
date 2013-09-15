;redcode-94
;name Vamp.Dev4
;author Roy van Rijn
; <roy_van_rijn@hotmail.com>
;assert 1
;strategy Carpet bomb Vampire/Coreclear?

start              mov     5,<-1 ;Carpet bomb the core with JMP's to the pit
                    add.a   #1,4
                    seq     3,4 ;Compare
                    jmp     -3
                    jmp     coreclear ;Go to the coreclear!
                    jmp     47 ;Let them jump in the pit
                    jmp     -4 ;If its equal to this, coreclear!

                    FOR     38
                    dat           0,      0
                    ROF

pit                spl           0
                    jmp        -1
coreclear      mov        2,    <-1
                    jmp        -1

