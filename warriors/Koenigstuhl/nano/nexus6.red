;redcode-nano
;name Nexus-6
;author John Metcalf
;strategy scanner
;assert 1

scan:add   #6,       #14
ptr: mov   {66,      @scan
     jmz.f scan,     <scan
     djn.f ptr,      }ptr
     mov.i #26,      1
     end   scan+2

