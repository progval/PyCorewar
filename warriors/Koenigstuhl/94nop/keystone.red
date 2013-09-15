;redcode-94 quiet
;name Keystone
;author P.Kline
;strategy stone with paper-defense + an abundance of redundance
;assert 1

spacing  equ 2517                   ; mod-1, approximates a mod-4 step
boot     equ (-2526)
      for 6
         dat n0+1,0                 ; alternating ptrs to m0 & n0
         dat m0+1,0
      rof
         dat keystone,0
m0       spl mimp+5334 
         spl -1                     ; continuous imp-ring launcher
         spl mimp+2667              ; activated by stone if needed
mimp     mov.i #0,2667              ;
         mov.i nimp,2666            ; backup in case mimp gets decremented
      for 7
         dat    0,0
      rof
      
start    mov #-277,cnt+11+5667-8
         mov <copyst,{copyst        ; copy stone
         mov hide5,<p1              ; store this for later
         mov hide6,<p2              ; store this for later
         spl @0,1                   ; using two processes
         mov #31,<p3                ; core-clear bomb
         mov <hidecl,{hidecl        ; copy core-clear
         mov <hidecl,{hidecl        ; copy core-clear
         mov <copyst,{copyst        ; copy stone
         mov <copyst,{copyst        ; copy stone
copyst   spl inc+1+boot,inc+1
         spl *copyst
hidecl   jmp cnt+3174-boot,hide4+1  ; we're outta here!
      for 3
         dat 0,0
      rof                             
                                       ; 'gbbs' = gets bombed by stone
keystone spl    #spacing,<-spacing
stone    mov    {cnt-spacing-1,cnt+94
         sub    keystone,stone
cnt      djn.a  stone,<2051            ; gbbs with hide6 for clear
inc      jmz.b  *n0-boot-13,}0         ; escape to imp-launchers
      for 5
         dat 0,0
      rof
hide1    spl    #0,<-24                ;
hide2    mov    37,>-27                ; 
hide3    djn.a  -15,<-107              ; gbbs with hide5 for core-clear
hide4    jmz.b  *m0-boot-228,}0        ; escape to imp-launchers
hide5    djn.a  -1,<-107               ; moved by stone onto hide3
hide6    djn.f  #0,<-25                ; moved by stone onto cnt for gate
      for 10
         dat 0,0
      rof
      for 6
         dat m0+1,0
         dat n0+1,0                 ; alternating ptrs to m0 & n0
      rof
         dat keystone,0
n0       spl nimp+5334 
         spl -1                     ; continuous imp-ring launcher
         spl nimp+2667              ; activated by stone if needed
nimp     mov.i #0,2667              ;
         mov.i mimp,2666            ; backup in case nimp gets decremented
         
p1       dat cnt+5352+boot
p2       dat cnt+5576+boot
p3       dat cnt+258+boot+3
      for 2
         dat 1,1
      rof

         end start
