;redcode-94x
;name Hellish Glare
;author John Metcalf
;strategy incendiary bomber with airbag
;assert CORESIZE==800

     step   equ     205
     hop    equ     (401+step*33)
     gate   equ     (ptr+1)

top: mov.i  {f-218, #0

ptr: mov    step,   >hit+1-hop
     add.ab {0,     }0
     mov    {sBmb,  @ptr
hit: jmz.a  ptr,    }sBmb

sBmb:spl    #1,     hop
cLp: mov    dBmb,   >gate
     djn.f  cLp,    {gate

dBmb:dat    >1,      8

     for    5
     dat    0,0
     rof

boot:mov    mBmb,   ptr+step
     spl    2,      {top-238
     spl    2,      {top-258
     spl    1,      {top-278
     djn.f  >top,   {top-198

mBmb:mov    -hop,   >-hop

     end   boot
