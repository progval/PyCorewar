;redcode-94x
;name Table Scan
;author John Metcalf
;strategy Table Scan -> Clear
;strategy just for fun ;-)
;assert CORESIZE==800

ptr: sne   *tab-1,   @tab-1
     djn.f {0,       }0
     add.x @ptr,     }0

     spl   #0,       0
clr: mov   @bp,      >ptr
     mov   @bp,      >ptr
bp:  djn.f clr,      {sb

     dat   -20,      9
sb:  spl   #tab+630, 11

   a for   11
     spl   #tab+a*40,<tab+a*40+20
     rof
tab: end

