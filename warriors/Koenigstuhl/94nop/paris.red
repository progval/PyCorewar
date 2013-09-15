;redcode-94
;assert CORESIZE == 8000
;author Kafka
;name paris
;strategy boot-> spl/spl/dat clear

bdist   equ   3300

boot
i for 6
  mov  ptr-1+i,ptr-1+i+bdist
rof
 jmp   sbomb+bdist,<-50

ptr    spl    {200, >4200
bomb   dat    {10,>4010
sbomb  spl    #20, < -100            ;excecution starts here after boot
go     mov    sbomb, >   ptr
       mov    sbomb, }   ptr
       djn.a  $go, <sbomb

i for 43
  dat #here+i,#go+2*i														;these lines are just
rof																																;to confuse scanners
here  dat #24,#-33

i for 43
  dat #go+2*i+1,#here-i
 rof


