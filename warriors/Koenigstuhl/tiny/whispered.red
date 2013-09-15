;redcode-tiny
;name whispered in a dream
;author John Metcalf
;strategy stone/imp
;assert CORESIZE==800

        sstep equ 132
        istep equ 267
        iboot equ imp+31

inc     spl   #-sstep,       >sstep
ptr     mov   >-sstep*2,     1+sstep*2
        add   inc,           ptr
        djn.f ptr,           >inc+sstep

        for   4
        dat   0,             0
        rof

less    spl   inc,           {340

        mov   imp,           *i3
        spl   i4,            {492
        spl   i2,            {539
i6      spl   @i1,           {404
i3      djn.f iboot+0*istep, }0
i4      spl   i6,            {437
        spl   @i5,           {224
i1      djn.f iboot+1*istep, }0
i2      spl   @i3,           {456
i5      djn.f iboot+2*istep, }0

imp     mov.i #133,            istep+1
        end   less

