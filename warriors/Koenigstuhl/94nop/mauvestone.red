;redcode-94
;name Mauvestone
;author Travis Bemann
;strategy spl 0 scan-bomber, 2-pass coreclear, imp-gate
;assert 1

        org boot
step0   equ #4
step1   equ #6
step2   equ #2
boot    mov impgate,last+20
scan0   add step0,aim
scan1   jmz.f scan0,@aim
        slt aim,#CORESIZE-50
        jmp clear0
        mov ammo0,>aim
        mov ammo1,>aim
        add step1,aim
        jmp scan1
clear0  mov aimold,aim
clear1  add step2,aim
        slt aim,#CORESIZE-50
        jmp clear2
        mov ammo2,@aim
        jmp clear1
clear2  mov aimold,aim
        add #1,aim
clear3  add step2,aim
        slt aim,#CORESIZE-50
        jmp last+20
        mov ammo2,@aim
        jmp clear3
impgate jmp.b 0,<-10
ammo0   spl 0
ammo1   jmp -1
ammo2   dat #0,#0
aim     dat #0,#last+21
aimold  dat #0,#last+21
last    dat #0,#0
        end

