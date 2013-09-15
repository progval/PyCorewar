;redcode-b
;name   Jezebel v2.0
;author A. Nevermind
;assert 1

i1    equ     20      ;       bombing interval
i2    equ     10
i3    equ     1
b1c     dat     690
b2c     dat     1400

l1      dat    100
l2      dat    100
l3      dat    100

org     start

b1   spl     0,      <4      ;       slow down
b2   jmp     0               ;       paralyze
b3   dat     0               ;       and kill

start   spl     b2run,  <1000
        spl     b3run,  <2000
        


b1run   add     i1,     l1
        mov     b1,     @l1
        jmn     -2,  <b1c
        spl     0,      <-40
        spl     -1,     <-41
        dat     0
b2run   add     i2,     l2
        mov     b2,     @l2
        jmn     -2,  <b2c
        spl     0,      <-40
        spl     -1,     <-41
        dat     0
        dat     0
        dat     0
        dat     0
        dat     0
b3run   mov.i   l3,     @l3
        jmp     b3run,  >l3
imp     mov     0,1
