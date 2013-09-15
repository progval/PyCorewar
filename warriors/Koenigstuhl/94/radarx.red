;redcode
;Name Radar-X
;Author Peter Young
;assert CORESIZE==8000

leng    equ     25
fence   equ     975

        org     start

offs    dat     0,0
off0    dat     -fence+1,fence+1

start   mov.ab  #-fence*3,offs
cloop   add.ab  #fence*2+leng,offs
        mov.a   #leng,offs
copy    mov.i   {offs,<offs
        jmn.a   copy,offs
        slt.b   $offs,#fence+1
        jmp     cloop

chloop  mov.f   off0,offs
        mov.ab  #leng-1,check+2
check   cmp.i   }offs,>offs
        jmp     trouble
        djn     check,#0
        jmp     chloop

trouble add.a   #fence,offs
        stp     #-fence*2,#1
        cmp.i   {offs,<offs
        stp     #fence*2,#1
        ldp     #1,offs
        mov.a   #leng,offs
tcopy   mov.i   {offs,<offs
        jmn.a   tcopy,offs
        add.ab  #2,offs
        jmp     @offs
