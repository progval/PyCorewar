;redcode
;name Tungsten
;author John K W
;strategy (mov/jmp ... spl) incendiary bomber... does ok against
;strategy scanners and some papers...
;assert 1

S equ 7

t       mov     b2,     @m
        mov     b1,     <m
m       mov     b,      @5-8+2376
        add     #3025,  m
        djn     t,      #500
        jmp     3,      0
        dat     #0,     #0
        dat     #0,     #0
c       spl     0,      <-10
        mov     2,      <-4
        jmp     -2,     <c-10
        dat     <-10,    <-11
        dat     #0,     #0
b       spl     -7,      0
b1      mov     S,      <S
b2      jmp     -1,     S

end t
