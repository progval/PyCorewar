;redcode-94
;name Da Ziz
;author John K W
;assert CORESIZE > 100
;strategy Gets about 185/100 vs blue candle, impfinity, rosebud
;strategy and blue funk 3... does ok against evolcap 6.6, and
;strategy juliet storm as well.

        org start

step    EQU 8

for step-1
        dat     1,      1
rof
check   dat     1,      25

for 5
        dat 0, 0
rof

gate    dat     0,      100

for 10
        dat 0, 0
rof

start
p       add.ab  #step,  gate
rep     jmz.f   p,      @gate
        mov.i   b1,     >gate
        djn.b   rep,    check
b2      spl     #-1,    {gate
        mov.i   3,      >gate
        mov.i   2,      >gate
        djn.f   -1,     >gate
b3      dat.f   -1,     -1+b1-check+10
b1      spl     -1,     1

        end
