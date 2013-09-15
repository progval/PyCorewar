;redcode
;name IMP TRAP
;author  Jon Newman
;date 7/18/89
;strategy has required some modifications
;assert 1
    spl 3,0
    mov 4,-1
    jmp -1,0
    spl -2,0
    jmp 2,0
    dat #0,#5
    djn 0,-1
    mov #2000,-3
    spl 2,0
    jmp -3,0
    mov 0,1
