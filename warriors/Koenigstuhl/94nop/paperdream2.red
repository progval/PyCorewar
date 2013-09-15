;redcode-94 quiet
;name Paper Dreaming 2
;author P.Kline
;strategy "one small paper" & one large decoy
;assert 1

incr     equ 513
spacing  equ 4375

         
      for 40
         dat   -launch,1
         dat   -launch,1
      rof
launch   spl   1,1
         spl   1,1
         spl   1,1
         mov   <1,{1
         jmp   p1s+1100+8,p1s+8
         
p1s      spl   @0,>spacing
         mov   }p1s,>p1s
p1k      mov   p1b,>p1s+8-8*incr
         add   #incr,@-1+spacing
         mov   p1b,>p1s+80-7-8*incr
         sub   #incr+1,@-1+spacing
         jmn.f @0,{p1s
p1b      dat   <2667,<5334
         dat   1,1
         dat   1,1
         end launch
