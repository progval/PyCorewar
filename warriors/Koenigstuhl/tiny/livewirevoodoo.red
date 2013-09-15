;redcode-tiny
;name livewire voodoo
;author M^2
;strategy qscan, paper with mirrored silk-imps
;strategy M^2 are Mizcu and Metcalf
;assert CORESIZE==800

        qx equ 688
        qy equ 301

        seq.x qf+(qx*qy+1)*((qx*qy)%800),         }qf
        jmp   @qlo+1,                             {qf
        sne.x qf+((qx+1)*qy+1)*(((qx+1)*qy)%800), qf+(qx+1)*qy
        jmz.f pgo,                                <qf

qf      mul.x #qx,          #qy    ; decode
        jmz.f @qlo+1,       >qf

qlo     mov   {234,         >qf
        mov   }qlo,         {qf
        seq   {qf,          >qf
        djn.f qlo,          >qf

        pstepa equ 125 ;  75 ;  85
        pstepb equ 325 ; 305 ; 145

pgo     spl   2,            }165
        spl   2,            }565
        spl   1,            {185
        mov   {silka,       {pboot
pboot   spl   silka+400+5,  {585

silka   spl   @0+5,         }pstepa
        mov   }silka,       >silka
silkb   spl   @0,           <pstepb
        mov   }silkb,       >silkb

        mov.i #pstepa-pstepb-1,   }401
        end
