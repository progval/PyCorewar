;redcode-94 quiet
;name Rude Wind
;author P.Kline
;assert CORESIZE==8000

step     equ 12
tstdjn   dat    0,-1

pl1      spl   #0                 ; create multiple processes
         mov   p2b,}scan          ; anti-imp attack, part 1
         mov   >0,}5000
         djn   -2,#6              ; let one process through for paper launch
         spl   1,>200             ;
         mov.i -1,#0              ; create 6 processes
         spl   1,>300             ;
         mov   <cp2,{cp2          ; make a copy of 2nd paper
cp2      spl   p2s+1850+6,p2s+6   ;   and launch him

p1s      mov   p1b,>6             ; 1st paper
p1c      mov   <p1s,<p1n
p1n      spl   @p1n,>-1356
         mov   p1b,<p1n
         jmp   @0,>p1s
p1b      dat   <2667,<5334

     for 20
         dat 0,0
     rof
pl2      add   #(2*step)+2691,scan
         spl   #0                 ; create multiple processes
         mov   p2b,>scan          ; anti-imp attack, part 2
         mov   >0,}1000
         djn   -2,#6              ; let one process through for paper launch
         spl   1,<-100            ;
         mov.i -1,#0              ; create 6 processes
         spl   1,<-200
         mov   <cp1,{cp1          ; make a copy of 1st paper
cp1      spl   p1s+1850+6,p1s+6   ;   and launch him

p2s      mov   p2b,>6             ; 2nd paper
p2c      mov   <p2s,<p2n
p2n      spl   @p2n,>-1556
         mov   p2b,<p2n
         jmp   @0,>p2s
p2b      dat   <2667,<5334
                  
     for 20
         dat    0,0
     rof
inc      dat    3*step,3*step
bomb     dat    0,step+step
         
     for 16
         dat 0,0
     rof
     
next     sub    inc,scan          ; scanner bombs one and scans two locations
         mov    bomb,@scan        ; in a four-instruction loop
scan     seq.x  7700+(10*step),@7700+(9*step)
         sne    *scan,tstdjn      ; ignore old-style djn-streams
         djn    next,#7700/(step*3)
         mov    p1b,<scan         ; attack found code
         mov    p2b,}scan
         djn    -2,#step+5
         
attack   spl    pl2,<3500         ; start launch code
         jmp    pl1,>-3500        ;
         end    next+1
