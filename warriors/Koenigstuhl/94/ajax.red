;redcode-94
;assert CORESIZE == 8000
;author Kafka and Kurt
;name ajax

bdist   equ   3300

boot  mov  ptr,ptr+bdist-4

i for 5
  mov  ptr+i,ptr+i+bdist
rof
 jmp   sbomb+bdist,<-50

ptr    spl    {200, >4200
bomb   dat    {10,>4010
sbomb  spl    #20, < -100
go     mov    sbomb, }   ptr-4
       mov    sbomb, >   ptr-4
       djn.a  $go, <sbomb


WARRIOR equ     boot

start       ;'94 scan (from FAQ)

s1      for 4
          sne   start+400*s1, start+400*s1+100
          seq   start+400*s1+200, start+400*s1+300
          mov   #start+400*s1-attack, attack
        rof
        jmn     which,   attack

s3      for 4
          sne   start+400*(s3+8), start+400*(s3+8)+100
          seq   start+400*(s3+8)+200, start+400*(s3+8)+300
          mov   #start+400*(s3+8)-attack, attack
        rof
        jmn     which,   attack

s2      for 4
          sne   start+400*(s2+4), start+400*(s2+4)+100
          seq   start+400*(s2+4)+200, start+400*(s2+4)+300
          mov   #start+400*(s2+4)-attack-100, attack
        rof

        jmz     WARRIOR,  $attack        ;skip attack if qscan found 
nothing
        add     #100,    $attack        ;increment pointer till we get 
which   jmz.f   -1,      @attack        ;the right place
        sub.ba  $attack, $trap
        mov     $trap, @attack

        mov.ba  $attack, $attack

loop    sub.f   $inc, $attack           ;; 60%c bombing
        mov     $inc, *attack
        mov     $inc2, @attack
attack  mov     $0, @0
        djn     loop, #4
        jmp     WARRIOR

inc     jmp     5, -10
inc2    jmp     -10, -5
trap    jmp     pit-attack

pit     spl     0
        spl     -1
        spl     -1, >1
        stp     #7, #0
        jmp     -2

i for   28
        dat     -i,-2*i
rof

end     start

