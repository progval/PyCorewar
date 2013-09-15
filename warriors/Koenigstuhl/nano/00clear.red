;redcode
;name 00 Clear
;author Christian Schmidt
;strategy simple d-clear.
;strategy Works much better than
;strategy my 4-line stone/imp :-)
;strategy Not very optimized....
;assert 1

gate    equ     (clear-2)

clear   spl     #0,    <gate-5
        mov     b,     >gate
        djn.f   -1,    {gate
b       dat     <-26,  <27
