;redcode
;name mutant
;author brad rembielak
;assert 1
; - a cross between and imp and a dwarf
; by brad rembielak

bomb    DAT             #00004
start   SPL  imp
loop    SUB #00005      ,bomb
        MOV #0000       ,@bomb
        JMP  loop
imp     MOV  00000      ,00001
        END  start        
