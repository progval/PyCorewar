;redcode-94X
;name Rave B4.1
;author Stefan Strack
;strategy Carpet-bombing scanner based on Agony and Medusa's
;strategy (written in ICWS'94)
;strategy 3: shorter
;strategy 4: better gate
;strategy 4.1: new constants
;strategy constants for 55440 core
;strategy Submitted: @date@
;assert CORESIZE==55440 && MAXPROCESSES==10000 && MAXCYCLES==500000
;assert MAXLENGTH==200 && MINDISTANCE==200

CDIST   equ 12
IVAL    equ 142
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ (1*IVAL)
DJNOFF  equ 55018 ;7485 ;-431
BOMBLEN equ CDIST+2

        org    comp

scan    sub.f  incr,comp
comp    cmp.i  FIRST,FIRST-CDIST        ;larger number is A
        slt.a  #incr+2-comp+BOMBLEN,comp  ;compare to A-number
        djn.f  scan,<FIRST+DJNOFF       ;decrement A- and B-number
        mov.ab #BOMBLEN,count
split   mov.i  incr,>comp               ;post-increment
count   djn.b  split,#0
        sub.ab #BOMBLEN,comp
        jmz.a  scan,scan-1
incr    spl.b  #-IVAL,<-IVAL
        mov.i  1,<count
        dat.f  <-IVAL-1-34118,<-IVAL-1 ; against 59 by 2819 imp spirals

