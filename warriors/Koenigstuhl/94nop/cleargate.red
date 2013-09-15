;redcode
;name cleargate
;author d.m.
;assert 1
clear    mov bomb, <ptr    ; bomb hits ptr for repeating core-clear
         jmp   -1,    0
         jmp wimp,    0
         
         dat 0,0
gate     dat 0,0
         dat 0,0
         dat 0,0

wimp     jmp 0, <gate

bomb     dat 0, -20

ptr      dat 0, -1234
