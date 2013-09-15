;redcode-tiny
;name Reanimator
;author John Metcalf
;strategy clear/imp
;assert CORESIZE==800

        iboot equ imp+70
        iStep equ 267

gate    dat   iboot+80,      0

dbmb    dat   8,             1

        dat   0,             0

clear   spl   #0,            0
cloop   mov   dbmb,          }gate
        djn.f cloop,         }gate

        for   2
        dat   0,             0
        rof
             
imp     mov.i #iStep,        *0

less    spl   clear,         {583
        mov   imp,           iboot
        spl   i4,            {560
        spl   i2,            {313
i6      spl   i1,            {291
i3      jmp   iboot+0*iStep, }0
i4      spl   i6,            {123
        spl   i5,            {41
i1      jmp   iboot+1*iStep, }0
i2      spl   i3,            {530
i5      jmp   iboot+2*iStep, }0

        end   less

