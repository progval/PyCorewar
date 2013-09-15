;redcode
;name Mirrored Imps 1
;author JKW
;assert CORESIZE==8000
;89 Wilkies

imp_sz  equ     4001
imp2    equ     imp+4000

start mov     imp,    imp2
      spl     1
      spl     1
      spl     1
      spl     1
      spl     2
      jmp     @vector,{0
      jmp     *vector,{0

for 15
      jmp     imp2+imp_sz*vector,  imp+imp_sz*vector
rof
vector  jmp     imp2,           imp
imp     mov.i   #11, imp_sz
