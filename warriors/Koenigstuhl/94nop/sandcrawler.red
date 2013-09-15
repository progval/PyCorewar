;redcode-94
;name Sand-Crawler
;author John Metcalf
;strategy oneshot/bomb-dodger hybrid
;assert CORESIZE==8000

     step equ (1160)
     gate equ (bomb-1)
offs:spl   #step,    <step

loop:add   offs,     go
go:  sne   step+16,  step-4

     add   offs,     go         ; optional extra scan
     sne   *go,      @go        ; for .8c

     jmz.f loop,     }find

     sub.ab find,    go
     mov   {pp+1,    {find
     djn   -1,       #5
find:spl   *1000,    <go
     mov.b go,       {find
bomb:dat   <1,       >7
dclr:spl   #-50,     >9
circ:mov   @pp,      >gate
     mov   @pp,      >gate
pp:  djn   circ,     {dclr
     end   go
