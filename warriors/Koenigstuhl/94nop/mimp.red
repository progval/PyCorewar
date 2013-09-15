;redcode
;name Mirrored Imps
;author Paul Kline
;assert CORESIZE==8000
;108 Wilkies

       spl     1
       mov     -1,0
       spl     1
       mov     <boot1,{boot1
       mov     <boot2,{boot2
       mov     <boot3,{boot3
boot1  spl     Mirr+500+0*2667,Mirr+6
boot2  spl     Mirr+500+1*2667,Mirr+6
boot3  jmp     Mirr+500+2*2667,Mirr+6
Mirr   spl     #0
       spl     @1
       mov.i   #0,6667
