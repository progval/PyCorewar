;redcode-94
;name Rave 3
;author Stefan Strack
;strategy Carpet-bombing scanner based on Agony and Medusa's
;assert 1

CDIST   equ 12
IVAL    equ 42
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ (2*IVAL)
DJNOFF  equ -431
BOMBLEN equ CDIST+2

        org    comp

scan    sub.f  incr,comp
comp    cmp.i  FIRST,FIRST-CDIST        ;larger number is A
        slt.a  #incr+1-comp+BOMBLEN,comp  ;compare to A-number
        djn.f  scan,<FIRST+DJNOFF       ;decrement A- and B-number
        mov.ab #BOMBLEN,count
split   mov.i  incr,>comp               ;post-increment
count   djn.b  split,#0
        sub.ab #BOMBLEN,comp
        jmz.a  scan,scan-1
incr    spl.b  #-IVAL,<-IVAL
        mov.i  1,<count
