;redcode-x2
;name Spray 'n Wipe
;author Steve Gunnell
;strategy This is the ancestor of Hyperclear.
;strategy The original 3 point spiral clear has been replaced with
;strategy a 13 point big spiral clear.
;assert 1

ptr       dat    #0         ,#200

spray     mov    wipe       ,>ptr
          jmn.f  spray      ,@ptr
scan      sne.i  >ptr       ,>ptr
          jmz.f  scan       ,>ptr
          slt.b  ptr        ,#tail-ptr+1
          jmp    spray      ,<ptr
wipe      spl    #5         ,#tail-ptr
          add.ab #34117     ,-1
          mov.i  *-2        ,@-2
          jmp    -2         ,<-20
          dat    #4         ,#5
tail      spl    #4         ,#6


end scan 