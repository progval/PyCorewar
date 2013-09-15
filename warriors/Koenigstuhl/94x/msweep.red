;redcode-94x
;name MSweep
;author P.Kline
;contact pk6811s@acad.drake.edu
;NSFCWT Round 8
;assert CORESIZE == 55440
;strategy pair of core-sweeps

coresz   equ    55440
boot1    equ    clr-300
boot2    equ    clr-310+(coresz/2)
        
         dat    #gate-10     ,clr-gate+7
gate     dat    #coresz/3-10 ,300+(coresz/2)
wipe2    dat    #coresz/3-10 ,clr-gate+7
wipe1    spl    #coresz/3-400,clr-gate+7
clr      spl    #0,>-20
         mov    @2,>gate
         mov    @1,>gate
         djn.b  -2,{wipe1
copyf    dat    0,0
start    spl    1
         spl    1
         spl    1
         spl    3
         mov    <copyf,<jump1
jump1    jmp    boot1,copyf-300
         mov    @copyf,<jump2
jump2    jmp    boot2,copyf-310+(coresz/2)
         end    start

