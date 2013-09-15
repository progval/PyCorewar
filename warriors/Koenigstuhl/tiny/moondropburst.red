;redcode-tiny
;name moondrops burst
;author John Metcalf
;strategy .5c bomber
;assert CORESIZE==800

; intelligence bomber with spl/dat clear
; just like Anders Ivner's C I A

     step  equ 215

     check equ (mid+400+step)
     bomb  equ (mid+400-step)
     gate  equ loop+2

loop:sub   inc,      bomb
     mov   bomb,     *bomb
     mov   bomb,     @bomb
mid: jmz.f loop,     check
inc: spl   #step,    <-step
     mov   @bptr,    >gate
     mov   @bptr,    >gate
bptr:djn.f -2,       {clr

     dat   0,0

     dat   -11,      10
clr: spl   #-160,    11

     for   6
     dat   0,0
     rof

dbmb:dat   <400,     <400+step*2
less:mov   dbmb,     bomb
     djn.f loop+1,   {227

     end   less
