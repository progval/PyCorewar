;redcode-tiny
;name mediocre
;author John Metcalf
;strategy switch between the scanner from Hired Sword
;strategy and Digital Swarm's paper, using the switcher
;strategy from Joonas's Tiny Tim
;assert CORESIZE==800

     step equ 181
     time equ 220
     gate equ scan

ccpo:mov.b loop,     #537
loop:sub   #step,    #step*time
     mov   *sp,      >ccpo
scan:jmz.f loop,     @loop
     jmn   @0,       *ccpo
sp:  spl   #0,       0
looz:mov   bomb,     >gate
     djn.f looz,     {gate
bomb:dat   1,        8

     dat   0,        0

     mode equ (less-246)

less:ldp   }mode,    mode
     ldp.ab mode,    @mode
     stp.a @mode,    <mode+1
     jmn   scan,     @mode+1

     s1 equ 104
     s2 equ 60

pgo: spl   1,        {0
     spl   *2,       {0
pap1:spl   @0,       <s1
     mov   }pap1,    >pap1
     mov   {pap1,    <pap2
pap2:djn.f *s2-3,    >s2

     end   less

