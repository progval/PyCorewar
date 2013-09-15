;redcode-tiny
;name Spooky Wench
;author John Metcalf
;strategy tiny stone/imp
;assert CORESIZE==800

        istep equ 267
        iboot equ (imp+127)

        sstep equ  59  ; 53  ; 149 ; 61  ; 587 ; 351 ; 417
        stime equ  338 ; 316 ; 348 ; 340 ; 322 ; 350 ; 352

stone   spl   #0,            0
loop    mov   bomb,          @ptr
hit     add   #sstep,        ptr
ptr     djn.f loop,          *hit-sstep*stime
bomb    dat   1,             >1

        for   3
        dat   0,             0
        rof

less    spl   stone,         {-301

        mov   imp,           *i3
        spl   i4,            {-237
        spl   i2,            {279
i6      spl   @i1,           {-352
i3      djn.f iboot+0*istep, }0
i4      spl   i6,            {-194
        spl   @i5,           {-216
i1      djn.f iboot+1*istep, }0
i2      spl   @i3,           {75
i5      djn.f iboot+2*istep, }0

imp     mov.i #istep+1,      *1
        end   less

