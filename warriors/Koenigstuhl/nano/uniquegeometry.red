;redcode-nano
;name unique geometry
;author John Metcalf
;strategy scanner
;assert 1

scan:sne   -7,       39
     add   inc,      scan
ptr: mov   {40,      *scan
     mov   }ptr,     @scan
inc: djn.f scan,     scan
     end

