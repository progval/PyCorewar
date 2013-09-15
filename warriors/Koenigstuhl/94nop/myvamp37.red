;redcode-94
;name myVamp v3.7
;author Paulsson
;strategy Throw jmp's around at 2/3c.
;strategy Then a spl/spl/dat and djn coreclear.
;strategy All in the tiny space of 14 bytes!
;strategy Submitted: 30 september 95
;assert CORESIZE > 1

;The vamp bomb is the best bomb, unless it fights a special oponent with
;anti vamp, most programs on the hill cant affod anti vamp.  Normal vamp
;adds +step to a field, -step to b field of jmp then uses as bomb (once, to
;b field) and pointer, myVamp also scans the a-field and bombs if not zero.

step    equ 3024                ;good step, mod 16
boot    equ     8*200           ;offset so that bomb/scan will be mod 8
org     start

trap    jmp             11      ;use a as pointer to the pit.
i       for     10
                dat.f   0, 0
rof
                spl             #0,<trap        ;real trap a bit away from
                 spl             5,0            ;trap line. note that b-field
                spl             #0,0            ;is none zero as the enemy is
                spl             #0,0            ;trapped
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                spl             #0,0
                jmp             -4,0

i       for     39-16
                dat.i   #1, i
rof
start   mov.i   }ptr,>ptr       ;boot away
i for 13
                mov.i   }ptr,>ptr
rof
                jmp             st+boot,1       ;start fighting
ptr             dat.f   c2,boot+c2

c2      spl.f   #b1, b2+2       ;pointer for coreclear, spl incase of djn'ed
st      add.f   s, c
                mov.i   c, @c   ;bomb
                jmz.a   st, *c  ;scan other place
                mov.i   @0,*c   ;bomb
                mov.x   *c,*c   ;make sure bomb points right
exit    jmz.b   st, trap-boot   ;start clear if trap is hit or enemy trapped
b1      spl     #b2-c2, b2-c2+2 ;coreclear, same as myZizzor
                mov.i   *c2, >c2
                djn.f   -1, {c2-b2+c2-2
b3      dat.f   <-2666, <2667   ;a little something for Die Hard
                                ;most imps wont survive anyway.
b2      spl     #b3-c2, b2-c2+2
c       jmp     *trap-boot, 0   ;bomb and counter, standard vamp
s       dat.f   -step, step     ;step
i for 13
                dat.i   #1,1    ;filling it up
                dat.f   1,#1
rof

                end
