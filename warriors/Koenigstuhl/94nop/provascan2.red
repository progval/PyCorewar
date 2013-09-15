;redcode-94
;name Provascan 2.0
;author Beppe Bezzi
;strategy B-scanner
;strategy a six months ago beginner's warrior :-)
;assert CORESIZE == 8000 
  
step    equ #3364
loop    add.ab step,    ptr ;scanner modulo 4
ptr     jmz loop,       trap
        mov ptr,        dest
cnt     mov #17,        cnt     ;0
kill    mov @trap,      <dest
        djn kill,       cnt
        jmn loop,       trap    
        jmp cocl                ;0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0                  ;0
        dat 0,0
dest    dat 0,0
        dat 0,0                  
        dat 0,0                  ;0
        dat 0,0
        dat 0,0
        dat 0,0
trap    dat #1                  ;0
bomb    spl 0
        dat 0,0
        dat 0,0
        dat 0,0                  ;0
        dat 0,0
        dat 0,0
gate    dat 0,0
        dat 0,0                  ;0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0                  ;0
cocl    sub #15,       cont    
        mov cocl-4,    <cocl-4
        djn -1,        cont
cont    spl 1 ,<0               ;0
        spl 0,<gate    
        mov mark,<cocl-1
        jmp -1,<gate
        dat 0,0                 ;0
mark    dat <-11, <-11
void    for 35                  
        dat 0,0
        rof
esca    for 4
        dat 0,2
        dat 0,2
        dat 0,2
        dat 0,0
        rof
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
        dat 0,0
end loop
