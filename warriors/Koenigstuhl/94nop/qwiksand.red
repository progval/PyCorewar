;redcode-94
;name Qwiksand
;author Wayne Sheppard
;strategy SPL/JMP/JMP/JMP bomber
;strategy SPL/JMP trap and two jmps to the trap every 6 cycles
;strategy SPL/SPL/DAT.... coreclear
;assert 1

dist equ 76

;Tornato style SPL/JMP -1 bomber
mov s,>x ;spl 0
mov j,@x ;jmp -1
x mov dist*5,@dist*3 ;jmp dist
add s,-1
mov i,*x ;jmp dist
jmp -5

for dist - 8
   mov 0,0
rof

;SPL/SPL/DAT Coreclear
i jmp dist,c1
c1 spl #10,#c2-i
c2 spl #10,#c3-i
c3 dat <2667,<-2666
s spl #dist*3,#dist*3-1
mov @i,}i
j jmp -1,dist-1
