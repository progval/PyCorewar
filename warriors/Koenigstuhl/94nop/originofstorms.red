;redcode-94x
;name Origin of Storms
;author John Metcalf
;strategy unusual scanner variation
;strategy .4c scan with .25c variable length spl carpet -> d-clear
;assert CORESIZE==8000 || CORESIZE==800

        for CORESIZE==8000
        step  equ 17
        first equ 240
        dist  equ 3022
        time  equ 285
        rof

        for CORESIZE==800
        step  equ 13
        first equ 40
        dist  equ 204
        time  equ 43
        rof

ptr:    sne   first,    first+dist
        add   db,       ptr
p:      mov   bomb,     }ptr
        mov   bomb,     >ptr
        djn   @p,       #time

bomb:   spl   #1,       1
        mov   db,       >ptr
        djn.f -1,       >ptr
db:     dat   step-1,   step-1
        end
