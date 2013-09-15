;redcode-94
;name myZizzor
;author Paulsson
;strategy Cissors (or whatever way you spell it)
;startegy One pass -> coreclear. Tiny I'd say.
;strategy Let's se how hard Die Hard is this time :-)
;assert CORESIZE > 1

org start
step            equ             8
i for step
                dat             1,1
rof
check           dat             1,0
i for 40
                dat             0,0
rof

start
p               add.ab  #step,#check+100
rep             jmz.f   p,@p                    ;scan
                mov.i   b2,>p                   ;carpet
                jmz.b   rep,check
b2      spl     #b3-p,b1-p+2                    ;coreclear
                mov.i   *p,>p
                djn.f   -1, <p-b1+p-2
b3      dat.f   <-2666, <2667                   ;Imp bomb! Kills theMystery, Die Hard, cic-test (sometimes)
b1      spl     #b2-p,b1-p+2                    ;but not Cotton-DH (don't know why)
