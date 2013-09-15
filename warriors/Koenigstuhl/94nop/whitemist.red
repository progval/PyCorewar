;redcode-94
;name White Mist
;author Ted Vessenes
;strategy Quick spl bombs, morphing into a core clear and imp gate
;strategy Be gentle; this is the first warrior I've submitted.
;assert (CORESIZE % 2 == 0)

org     start

bomb    dat   0,  0
gate    jmp   0, <-1
cc1     mov.i bomb-ccstart, {bomb-ccstart
cc2     djn   ccstart-ccloop, #bomb-ccloop-4
sbomb   spl   3, #-101
start   mov   sbomb, <sbomb
        djn.b start,  sbomb
ccstart mov.i cc1, #0
ccloop  dat   0,  0
        mov.i cc2,  ccloop
        dat   0,  0
        mov.i gate, ccloop+1

