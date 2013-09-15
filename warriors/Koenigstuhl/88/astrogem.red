;redcode
;name Astro Geminion 3p
;author W. Mintardjo
;assert CORESIZE==8000

step EQU 2667

a   MOV #c, 0
b   MOV <a, <c
e   ADD #5, 1
f   MOV 2, 2   ;Experimental bomber
c   MOV 0, step

s   SPL 1      ;Create 8 x 3 on-going processes. There is an interesting way
    MOV -1, 0  ;of creating any n on-going processes. The formula is to subtract
    SPL 1      ;n by 1 and encode this value to binary number. Now, start
    SPL 1      ;moving from left to right. Each '1' is replaced by 'SPL 1' and
    SPL 1      ;each '0' is replaced by 'MOV -1, 0' (from Note Paper's trick)

    JMP <0, 25

    JMP b+step*2
    JMP b+step*2
    JMP b+step*2
    JMP b+step*2
    JMP c+step*2
    JMP a+step*2
    JMP f+step*2
    JMP e+step*2

    JMP b+step*1
    JMP b+step*1
    JMP b+step*1
    JMP b+step*1
    JMP c+step*1
    JMP a+step*1
    JMP f+step*1
    JMP e+step*1

    JMP b+step*0
    JMP b+step*0
    JMP b+step*0
    JMP b+step*0
    JMP c+step*0
    JMP a+step*0
    JMP f+step*0
    JMP e+step*0

    END s
