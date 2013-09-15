;redcode
;name Hard-rock v.7
;author Mark Ratzburg
;strategy Decoy, stone w/ imp gate and core-clear
;strategy v.1-just stone w/ core clear,v.2-optima constant added
;strategy v.3-imp gate added,v.4 boot-strapping added,v.5 trimmed code
;startegy v.6-redo core clear,trim again,v.7 try w/o imp gate
;assert 1

optima  equ 2365
gate    equ (stone-20)

bomb    jmp 1,8+optima
stone   mov bomb,@bomb
        add #optima,bomb
        jmp stone,<gate
core    mov 3,@-13
        jmp core,<-14
boot    mov stone+4,-500+4
        mov stone+3,<boot
        mov stone+2,<boot
        mov stone+1,<boot
        mov stone,<boot
        mov stone-1,<boot
        jmp boot-500

        end boot

