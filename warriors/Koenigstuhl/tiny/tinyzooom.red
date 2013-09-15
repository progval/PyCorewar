;redcode-tiny
;name Tiny Zooom...
;author John Metcalf
;strategy .5 scan -> .33 scan/.33 clear -> clear

;assert CORESIZE==800

     org   deco

step equ   214               ; computer optimized
numb equ   156               ; number of scans

;    [ Scan ]
sGat:mov   }cGat,    *0
     mov   *sBmb,    >sGat
sLoo:sub   #step,    #step*numb
cGat:jmz.f sLoo,     @sLoo   ; a-field mutates
     mov.b sLoo,     sGat
     jmn.a {cGat,    *sGat

;    [ Clear ]
sBmb:spl   #0,       0
cLoo:mov   cBmb,     >cGat
     djn.f cLoo,     {cGat
cBmb:dat   1,        2-cGat

     for   7
     dat   0,0
     rof

;    [ Decoy Maker ]
deco:mov   >cGat+260,{cGat+352
     mov   >cGat+454,{cGat+556
     djn.f cGat,     {cGat+649

     end
