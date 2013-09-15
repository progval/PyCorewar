;redcode
;name Four Eyes
;author Alex MacAulay
;assert 1
 
dist equ 79
 
spl a02
spl a03
spl a04

i for 4
;   a&i jmp 0 ; hit here        ; old
    jmp 0 ; hit here            ; new: changed by CCB
;   mov 20,<2                   ; old
a&i mov 20,<2                   ; new: changed by CCB
    jmz -1,dist
    jmp 2,-2
    dat #5 ; hit here
    mov 9,(dist-3)+0
    mov 9,(dist-4)+1
    jmp 2
    dat #0 ; hit here
    mov 4,(dist-7)+2
    jmp (dist-8)+0
    mov 4,1
    dat #0 ; hit here
    jmp -1,-2
    spl 0
    mov -2,<1
    dat #0 ; hit here
rof
