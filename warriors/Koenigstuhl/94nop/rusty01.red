;redcode-94
;author John Lewis
;name Rusty v0.1
;strategy Find first paper and stun it where it stands with booted CC
;damien-scan,core clear,boot
;assert 1

sight   add #-25,#0
        jmz.a -1,@sight
        add #30,sight


        mov tic,>sight
        mov toc,>sight
        mov tac,>sight
        mov tuc,@sight
        add #-3,sight
        spl @sight
        add #120,sight
        jmp sight

tic     mov tac,<2
toc     djn -1,#100
tac     dat 0,-4
tuc     spl #0,-1
