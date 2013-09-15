;redcode-94
;name Zooom...
;author John Metcalf
;strategy .5 scan -> .33 scan/.33 clear -> dclear
;strategy  v0.1 self modifying scan loop
;strategy   v0.2 irregular scan pattern
;strategy    v0.3 boot and tailored decoy

;assert CORESIZE==8000

     org   boot

;    [ Decoy ]
q    for   22
     for   2+(q%5==0||q%5==2||q%6==2||q%16==3)
     spl   #m*3039,  {m*3359
     rof
     spl   #0,       0       ; scanned
     rof

;    [ Boot ]
boot:
q    for   10
     mov   sGat+q-1,  >sGat
     rof
     jmp   @0,        bDis+m-sGat

bDis equ   (boot+3+923*step) ; optimal distance
step equ   1671              ; non-optimal
numb equ   2230              ; number of scans
cGat equ   (sGat-2)

;    [ Scan ]
sGat:mov   }m,       *bDis   ; multi-function
     mov   sBmb,     >sGat
sLoo:sub   #step,    #step*numb
m:   jmz.f sLoo,     @sLoo   ; a-field mutates
     mov.b sLoo,     sGat
     jmn.a {m,       *sGat

;    [ Clear ]
sBmb:spl   0,        0
cLoo:mov   cBmb,     >cGat
     djn.f cLoo,     >cGat
cBmb:dat   <2667,    2-cGat
     end
