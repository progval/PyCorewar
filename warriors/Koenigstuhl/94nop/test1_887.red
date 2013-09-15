;redcode-b
;name Test 1 887
;author Steve Bailey
;assert 1

OFFSET  equ     887

start spl     exec
spl     exec
jmp     exec

const   dat     #const, #const+OFFSET
exec    mov.i   }const, >const
jmp.f   exec+OFFSET

end     start

