;redcode-94
;name theMystery1.5
;author Paulsson
;strategy How does Die Hard work? (this way maybee?)
;strategy Looking gooood, could it be somthing that begins
;strategy with an i and ends with p?
;assert CORESIZE > 1

org start

step1   equ             1800
step2   equ             -1922

start   spl 1           ;\.
        mov.i -1,0      ;- make 7 processes 
        mov.i -1,0      ;/.
        mov {ptr2,<ptr2 ; move out second paper
        mov {ptr1,<ptr1 ; move out first paper
        spl 3
        spl 4
        jmp @ptr1       ; jump to 1 
        mov {ptr3,<ptr3 ; move out third paper
        jmp     @ptr3   ; jump to 3
        jmp @ptr2       ; jump to 2

pap     spl step1,0             ;\.
        mov.i >-1,}-1           ;\\ Normal paper, with bad constants
        mov.i <-2,<1            ;// (I think I riped it from timescape :-) )
        spl     @0,}step2       ;/.
        mov.i #0,2667           ;Impy!

ptr1 dat 5+pap,pap+5+500
ptr2 dat pap+5,pap+5+2667+500
ptr3 dat pap+5,pap+5+2667*2+500
