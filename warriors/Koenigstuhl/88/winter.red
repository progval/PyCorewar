;redcode
;name Winter Werewolf
;author W. Mintardjo
;strategy SPL/JMP bomber with 2 pass core-clear (SPL/DAT) + self-defense
;strategy against IMPs
;assert 1

step    EQU     153
init    EQU     152
n       EQU     ((12*8)-2)

        DAT     <-4-n, #0
m       MOV     -1, 0-n
        JMP     2
snow    SPL     0, <-3-step-n
main    MOV     hold, @3
        MOV     snow, <2
        ADD     #step, 1
        JMP     main, init      ; Hit here
        MOV     @-4, <n
hold    JMP     -1, 1

        END     m
