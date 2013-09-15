;redcode-94nop
;name pre75-z47a
;author John Metcalf
;strategy .75c prescan -> .33 scan/.33 clear -> d-clear
;assert CORESIZE==8000

     step  equ (7052)
     time  equ (220)
     gate  equ (ccpo-2)

ccpo:mov.b loop,     #ptr-3
loop:sub   #-step,   #step
     mov   *sp,      >ccpo
scan:jmz.f loop,     @loop
     jmn   @0,       *ccpo
sp:  spl   #0,       0
looz:mov   bomb,     >gate
     djn.f looz,     {gate
bomb:dat   <1,       13

     for 40
     dat 0,0
     rof

     s equ 47
     o equ -4

ptr: dat   o+s*4,  o+s*3

     for 44
     dat 0,0
     rof

loot:sub   a,      @a
sc:  sne.x *ptr,   @ptr
a:   sub.x #-2*s,  ptr     ; s = a-ptr
     jmz.f loot,   @ptr
     add.b ptr,    ccpo
     jmp   loop+1, <1000

     end   sc
