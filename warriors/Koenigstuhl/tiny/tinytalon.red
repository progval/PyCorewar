;redcode-94x
;name Tiny Talon
;author Robert Macrae
;strategy scan with transparent decoy [But not tested]
;assert 1

        org loop

head    spl #-4,83              ;not to be executed, except when hit by DJN
loop    mov head,>head          ;place carpet
        add.f step,scan         ;move scan window
scan    cmp.i }4,0              ;found something?
        mov.b scan,@loop        ;       Yes. adjust carpet pointer.
        djn loop,#99            ;fall through to d-clear after 100  scans
step    spl #-24,>-24           ;standard d-clear
        mov clr,>head-5
        djn.f -1,>head-5
clr     dat 1,#18               ;d-clear bomb



