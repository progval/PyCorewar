;redcode-nano
;name muddy puddle
;author John Metcalf
;strategy nano Q^4 qscan
;assert CORESIZE==80

     x equ 49
     y equ 14

     sne   ptr+x*y+y+8, ptr+x*y+y+3
     seq   {ptr,        ptr+x+5
ptr  mul.x #x+1,        #y

loop mov   <45,         >ptr
     djn.f loop,        {loop

     end

