;redcode
;name Meg gyokerebb
;author Csaba Biro
;strategy Divide the core 4 parts and boms it
;assert CORESIZE==8000 && MAXPROCESSES>=100
off equ 2000
lep equ 349
mer equ (off-(bomb-relp))
        org masol
masol
i       for 3
j       for 7
        mov start+j-1,start+j-1+off*i
        rof
        rof
        spl start+off
        spl start+2*off
        spl start+3*off
start   spl gate
relp    mov bomb,@bomb
        add #lep,bomb
        mod #mer,bomb
        jmp relp
gate    jmp gate,<start-5
bomb    dat #0,#lep
	end

