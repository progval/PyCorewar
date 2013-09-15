;redcode-94
;author John K. Lewis
;name faerie circle
;strategy run the faeries in circles, then drop dew on the sleepy peasants.
;strategy Planar: imps, stone, core clear, boot
;assert 1

zero    mov  {mouth,<mouth
        mov  {mouth,<mouth
        mov  {mouth,<mouth
        mov  {mouth,<mouth
        mov  {mouth,<mouth
        mov  {mouth,<mouth
        mov  {mouth,<mouth
        spl @mouth
        spl wings
        jmp top

dust    dat 0,0
top     spl #0,{tea
bud     mov dirs,@100
        mov dust,<shrum+4000
rose    mov dirs,<bud
tea     add #2771,bud      ;tea add #3921,bud
shrum   jmp top+1,top
dirs    dat #0,#25    
mouth   dat 0,4000

for 63
dat 0,0
rof

step    equ     1143
wings   spl     1
        spl     1
        mov.i   -1,     0
        spl     2
        jmp     imp
        add.a   #step,  -1
        dat     #0,     #0      ; This must be a DAT
imp     mov.i   #0,      step
