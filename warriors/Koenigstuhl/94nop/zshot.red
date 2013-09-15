;redcode-94
;name Z-Shot
;author John Metcalf
;strategy oneshot
;assert CORESIZE==8000

gate equ bye-3
step equ 4961 ; 2365
time equ 2076 ; 1599

loop:add.a  #step,     bye
star:jmz.f  loop,      *bye  ; .5c scan
     mov.ab @star,     gate  ; { protected
     jmp    @star,     <gate ; { protected

     for    89
     dat    0,         0
     rof

     dat    <gate,     {7
     spl    #gate,     {8
bye: spl    #-1-time*step,{8
clr: mov    @bmbp,     >gate
     mov    @bmbp,     >gate ; .67c clear
bmbp:djn    clr,       {bye  ; .33c djn

     end    star

