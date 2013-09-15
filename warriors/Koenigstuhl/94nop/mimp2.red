;redcode
;name Mirrored Imps 2
;author JKW
;assert CORESIZE==8000
;65 Wilkies

imp_sz  equ     (2667+4000)
imp     equ     (impin+2000)
imp2    equ     (imp+4000)

start   mov     impin,  imp
      mov     imp,    imp2
      spl     1
      spl     1
      spl     1
      spl     adder-1
      spl     2
      jmp     *vector, 0
      jmp     @vector, 0
      jmp     1
adder   add.f   inc,    vector
inc     dat     imp_sz, imp_sz
vector  jmp     imp2,   imp
impin   mov.i   #11, imp_sz
