;redcode-b
;name Papery
;author Ian Oversby
;strategy Just testing basic paper / stone
;strategy hopefully for part of P-Warrior
;assert 1
 
 
        MOV stone+3, <boot
        MOV stone+2, <boot
        MOV stone+1, <boot
        MOV stone, <boot
        SPL @boot
        MOV bomb, boot
        JMP pstart
boot    DAT #0, #2157
 
stone   SPL   #2172, <-1087
loop    ADD   stone, mix
mix     MOV   <-100, <5
        DJN.F loop, <-100
 
pstart  SPL 1, <-300
        SPL 1, <-400
        SPL 1, <-500
paper   SPL 4173, #0
        MOV >-1, }-1
        MOV bomb, }2421    ; anti-vamp
        MOV bomb, {3517    ; more anti-vamp
        MOV <paper, {last  ; another copy
last    JMP 5127, <-30     ; escape?
bomb    DAT >1, >1
        DAT >1, >1

        END

