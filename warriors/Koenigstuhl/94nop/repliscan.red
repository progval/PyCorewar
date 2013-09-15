;redcode-94
;name Repliscan
;author Christian Schmidt
;strategy One of my first ol´ warrior :-)
;strategy This jmz-scanner replicate itself to
;strategy the locations where he found something.
;strategy funny but very bad :-(
;assert 1

        org     scan
step    equ     3024            ;mod-16

dp      dat     1,      9       ;here is the pointer
res     sub     #3,     scan    ;reset the scan-value
                                ;of the copy
incr    add.ab  #step,  scan    ;here are the
scan    jmz.f   -1,     106     ;JMZ-scanner

mp      mov.i   dp,     >scan   ;copying the pointer without changes
cop     mov.i   }dp,    >scan   ;copy-routine
count   djn.b   -1,     dp      ;for the rest of the code

su      sub.b   jm,     scan    ;reset the original
jm      spl     @scan,  9       ;start the copy
ag      jmp     incr            ;and start the original again
