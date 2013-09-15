;redcode
;name H.o.T. Replicator
;author CHS
; <cschmidt@mail.uni-mainz.de>
;assert 1

          org start

start: spl        1,>-3000
          spl     1,>-2000
          spl     1,>-1000

          spl     @0,          <(2200*5)
          mov     }-1,         >-1
          spl     @0,          <(3740*5)
          mov     }-1,          >-1
          spl     @0,           <(3044*5)
          mov     }-1,          >-1
          mov     >9000,    <(6335*5)
          mov     >3000,    <(5522*4)
