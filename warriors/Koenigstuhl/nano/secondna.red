;redcode-nano
;name Second Nature
;author John Metcalf
;strategy ?
;assert CORESIZE==80

ptr: spl   #-4,      {-23
loop:mov   }st,      {ptr
st:  mov   {ptr+10,  <ptr
     mov   {ptr,     {ptr+31
     djn.f loop,     ptr
     end
