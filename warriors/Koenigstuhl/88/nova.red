;redcode-x verbose
;name Nova
;author Ray Cromwell
;strategy Start up an imp, then imp stomp
;assert 1
  
fence dat #0
     dat #0
     dat #0
     dat #0
     dat #0
     dat #0 
     dat #0

main spl part2
loop jmp loop, <fence
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
       dat #0,#0
ptr    dat #-100,#-100
       dat #0,#0
       dat #0,#0
       dat #0,#0
part2  spl impit
dwarf  mov ptr,<ptr
       jmp dwarf,<ptr
impit  spl imp
imp    mov 0,1
       end main
