;redcode-tiny
;name Rumblebuffin
;author John Metcalf
;strategy stone/paper
;assert CORESIZE==800

        sstep equ 52

inc     spl   #-sstep,       >sstep
ptr     mov   >-sstep,       1+sstep
sgo     add   inc+4,         ptr
        djn.f @sgo,          >inc+sstep

        for   5
        dat   0,             0
        rof

less    mov   {-191,         {-222
        mov   {-191,         {77
        spl   1,             {94
        spl   1,             {134
        spl   {sgo,          {-331
        mov   {papa,         {boot
boot    djn.f *pboot,        {-136

        pstepa equ 105
        pstepb equ -41
        pboot equ inc+258

papa    spl   @0+4,          <pstepa
        mov   }papa,         >papa
        mov   {papa,         <papb
papb    djn.f *pstepb-3,     >pstepb

        end   less

