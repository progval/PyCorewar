;redcode-tiny
;name Unknown
;author John Metcalf
;strategy puzzle in miniature
;strategy to win a copy of my code,
;strategy can you tell me what I am?
;assert CORESIZE==800

; German Labarga and Christian Schmidt both
; correctly determined Unknown's strategy

        iboot equ imp+69
        iStep equ 267

gate    dat   iboot+80,      0

dbmb    dat   8,             1

        dat   0,             0

clear   spl   #0,            0
cloop   mov   dbmb,          }gate
        djn.f cloop,         }gate

        for   3
        dat   0,             0
        rof

imp     mov.i #iStep,        *0

vect    spl   iboot+iStep*1, iboot
        spl   iboot+iStep*3, iboot+iStep*2
        jmp   iboot+iStep*5, iboot+iStep*4

less    spl   clear,         }iboot+iStep*6
        mov   imp,           iboot
        spl   1,             }-261
        spl   1,             {-283
        spl   2,             {-305
        jmp   @vect,         }0
        jmp   *vect,         }0
        end   less
