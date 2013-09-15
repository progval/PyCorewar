;redcode
;name Eclipse V2.0
;author P.Kline
;strategy bscan, 2-dwarf, 1-dwarf
;assert 1
bomb2    mov -1,<0
ptr      mov bomb1,<1-131
next     add #121,@2         ; **
         jmz next,@ptr
         mov bomb2,@ptr
         jmn ptr,@-1         ; **
bomb1    spl 0,10            ; **
         mov cnt+1,<bomb1-2  ; **
         mov cnt+3,<bomb1-3  ; **
cnt      djn -1,@0           ; **  stays zero until decremented or executed
         end next
