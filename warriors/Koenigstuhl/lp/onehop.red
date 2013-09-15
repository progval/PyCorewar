;redcode-lp
;name One Hop
;author David Moore
;assert MAXPROCESSES==8
;strategy two phase scanner:  first  JMP #1,{1  then  DAT 0,0

incr equ 2891

       add #incr, #switch+incr
start  jmz.f -1, @-1
       slt -2, #7
       mov *switch, @-3
       jmp -4, 0
       dat 0,0
jump   jmp #1, {1
switch dat #jump, <0

end start
