;redcode verbose
;name No Mucking About
;author Campbell Fraser
;assert 1

GAP     equ -98
GAP2    equ -49

CHECK   add INC, POS
POS     cmp -50, -1
        slt #14, POS
JB      jmp -3
        mov JB, @POS
        mov SB, <POS
        mov SB, <POS
        mov SB, <POS
        add AIM, POS
        jmn POS, CHECK
SB      spl 0
AIM     mov @GAP2, <(GAP2+3)
INC     dat #GAP, #GAP
