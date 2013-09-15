;redcode-94m quiet
;name Withershins Thrice
;author P.Kline
;strategy once-thru 80% bomb/scan with multi-pass core-clear
;macro
;assert 1

step1    equ 11
step2    equ 12
step     equ (step1+step2)

         dat    #gate-10,clr-gate+5    ; just in case clr is decremented
gate     dat    #gate-10,scan-(3*step2)-5
wipe4    dat    #gate-10,<2667
wipe3    dat    #gate-10,clr-gate+5
wipe2    spl    #4000   ,clr-gate+5    ; redundant wipers
wipe1    spl    #5000   ,clr-gate+5
     for 4
         dat    0,0
     rof
bomb     dat    -step,-step
         dat    0,0
next     add    inc,@2            ; scanner bombs two and scans two locations
         mov    bomb,@scan        ; in a five-instruction loop
         mov    bomb,*scan
scan     sne.x  *150-step1-step2,*150-step1
         djn    next,#7900/(2*step)
         add.f  scan,gate         ; position for wiping
inc      spl    #2*step,#2*step
clr      mov    @1,>gate
         djn.b  clr,{wipe1        ; self-decrementing pointer
     for 52
         dat    0,0
     rof
     for 11
         dat    1,1               ; small decoy
     rof
         
         end    next+1
