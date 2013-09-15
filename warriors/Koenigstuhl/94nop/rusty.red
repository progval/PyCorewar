;redcode
;author John Lewis
;name Rusty
;strategy Quickly scan and find nothing
;strategy then jump to a new location and
;strategy try to catch the other program
;strategy un-awares.  When this doesn't
;strategy work, twiddle your thumbs until
;strategy your opponets finds and kills you.
;assert 1

sight   add #5937,#0
        jmz.a -1,@sight
        add #-14,sight

mov     <burger,<sight
djn     -1,#6
add     #2,sight
        spl @sight
mov     burger+1,sight

ptr     dat.f   0,0
        dat.f   0,10
start   spl     #0,10
        mov.i   @2,>ptr
        mov.i   @1,>ptr
        djn.b   -2,{start
burger  dat 2301,0


