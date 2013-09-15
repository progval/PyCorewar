;redcode
;name Silver Talon 1.3
;author Edgar
;strategy spl carpeting scanner with d-clear.
;strategy Depressingly ineffective.
;assert 1

        org loop


head    spl #1,5000
loop    mov @loop,>head
        sub.f step,scan
scan    cmp.i 4,0
        mov.ab scan,@loop
        djn loop,#1002
step    spl #152,#152
        mov clr,>head-5
        djn.f -1,>head-5
clr     dat >2667,#15

