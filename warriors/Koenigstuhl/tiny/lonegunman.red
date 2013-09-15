;redcode-94x
;name Lone Gunman
;author John Metcalf
;strategy decoy maker ->  6-line oneshot
;assert CORESIZE==800

        step equ 12
        d equ (loop-179)
        s equ 36

loop    sub.b sbmb,        #36+clear
        jmz.f loop,        @loop
sbmb    spl   #dbmb-loop,  <-step
clear   mov   *loop,       >loop
        djn.f clear,       <-11
dbmb    dat   dbmb-loop,   dbmb+1-loop

        for   6
        dat   0,0
        rof

make  z for   6
        mov   <(d+1)-(z*s),{d-((z+1)*s)
        rof
        djn.f loop+1,      <d

        end   make

