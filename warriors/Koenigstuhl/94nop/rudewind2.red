;redcode-94m quiet
;name Rude Wind II
;author P.Kline
;strategy once-thru bomb/scan with anti-imp attack and paper
;strategy II: 80% bomb/scan, changed to Silk-style paper
;assert 1

incr     equ 513
spacing  equ 4375
step     equ 12

pl1      add.ab scan,1
         spl   #0,#scan+5334+step+(step/2)
         mov   p2b,>-1            ; anti-imp attack, part 1
         djn   -1,#3
         spl   1,>200             ;
         spl   1,>400             ; create 7 processes
         mov   -1,0               ;
         mov   <cp2,{cp2          ; make a copy of 2nd paper
cp2      spl   p2s+2667+7,p2s+7   ;   and launch him

         
p1s      spl   @0,>spacing        ; 1st paper
         mov   }p1s,>p1s
         mov   p1b,>p1s
         mov   p1b,>p1s+7-7*incr
         add   #incr,@-1+spacing
         jmn.f @0,{p1s
p1b      dat   <5334,<2667

     for 19
         dat 0,0
     rof
pl2      add.ab scan,1
         spl    #0,#scan+2667+step+(step/2)
         mov    p1b,>-1            ; anti-imp attack, part 2
         djn    -1,#3
         spl    1,<-100            ;
         spl    1,<-300            ; create 7 processes
         mov    -1,0
         mov    <cp1,{cp1          ; make a copy of 1st paper
cp1      spl    p1s+5334+7,p1s+7   ;   and launch him

         
p2s      spl   @0,>spacing         ; 2nd paper
         mov   }p2s,>p2s
         mov   p2b,>p2s
         mov   p2b,>p2s+7-7*incr
         add   #incr,@-1+spacing
         jmn.f @0,{p2s
p2b      dat   <5334,<2667
                  
     for 20
         dat    0,0
     rof
inc      dat    4*step,4*step
bomb     dat    2*step,2*step
         
     for 16
         dat 0,0
     rof
     
next     sub    inc,scan          ; scanner bombs two and scans two locations
         mov    bomb,@scan        ; in a five-instruction loop
         mov    bomb,*scan
scan     sne.x  *pl1-(5*step),@pl1-(4*step)
         djn    next,#7900/(step*4)
         spl    #0,>scan
         mov    p2b,>scan
         djn    -1,#1
         
attack   spl    pl2,<3500         ; start launch code
         jmp    pl1               ;
         end    next+1

