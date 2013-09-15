;redcode
;name Lobot
;author Stefan Strack
;strategy Small JMP bomber/core clearer
;strategy Submitted: @date@
;assert 1

        mov  -2,<0
loop    add  #3039,bombptr
bombptr mov  bomb,3038     ;bomb will land here, turning into a core clearer
bomb    jmp  loop

        end  bombptr
