;redcode
;name Blur '88
;author Anton Marsden
;strategy Carpet goes backwards
;assert CORESIZE==8000

step EQU 70

top:  mov bomb,<ptr
a:    add inc,scan
scan: cmp -3*step+5,-3*step
      mov scan,@-3
      jmn top,@-3
bomb: spl 0,<1-step
      mov inc,<bomb-2
      djn -1,@-1-step
inc:  dat <-step,<-step
ptr:  dat #0,#-2*step

END scan
