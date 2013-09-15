;redcode-94 verbose
;name myVamp v2.2
;author Paulsson
;strategy v2.0 Vamp, total rewrite, vamps for 750 cycles 2/3 c
;strategy then spl/spl/dat core clear, should lose to stone,imp.
;strategy v2.1 new constant -> 1200 cycles of vamping
;strategy v2.2 Tried to set up gate and new step to get scanners
;strategy      a lot faster. 
;assert 1

org st
step    equ 10*23
c2              dat.f   b1,b2+2
                dat.f   0,0                     ;B
st              add.f   s,c
                mov.i   c,@c
                jmz.a   st,*c
                mov.x   c,bmb
                mov.i   @0,@bmb         ;A
exit    jmn.b   st,c
b1              spl             #b2-c2,b2-c2+2
                mov             *c2,>c2
                jmp             -1,>c2-1
c               jmp             trap,0          ;B
bmb             jmp             0,0
b3              dat.f   #b3-c2,b2-c2+2
b2              spl             #b3-c2,b2-c2+2
s               dat.f   -step,step
i               for             10
                dat.f   0,0
rof
trap    mov.i   #1,exit
                mov.i   0,exit
                spl     #0,0
                spl             -1,0

