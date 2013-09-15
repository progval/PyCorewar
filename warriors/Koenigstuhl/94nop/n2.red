;redcode-94
;name N2
;author John K. Lewis
;assert 1
;Planar:scanner,bomber,core clear

        spl poke+1
peek    add #3021,#0
        jmz.f peek,@-1
        slt peek,#11
        mov.b peek, poke
poke    jmp peek,6000
        mov pow,<poke
        djn -1,#3900
pow     spl #0,#0
        mov post,>-1
        jmp -3,2
post    dat 0,0
 
        end 
