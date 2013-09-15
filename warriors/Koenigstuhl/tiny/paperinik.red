;redcode-tiny
;name Tiny Paperinik
;author LAchi
;strategy Tiny Phantom Duck
;strategy Tiny Q^4 -> Lightweight paper
;assert CORESIZE==800
STEP1 equ 488
STEP2 equ 614 

    qa equ 240
    qb equ 421
    qf equ qta 

    sne   qf-2*(qa-1)*(qb),qf+(qa-1)*(qb)
    seq   qf-2*(qa)*(qb),  }qta
    jmp   qta,             {qta
    jmz.f start,           <qta 

qta: mul.x #qa,      #qb
    sne   >-242,    @qta
    mul.f #-2,      qta 

qlo: mov   <-285,    }qta
    mov   }qlo,     <qta
    djn   qlo,      #17 

start
       spl 1, <213
       spl 1, }561
       spl 1, {486 

paperinik
ptr1
       spl @0, }STEP1
       mov }ptr1, >ptr1
       mov.i   bomb1,  >768
;mutation
       mov {ptr1, {ptr2
       mov.i   bomb ,  }636
ptr2
       djn.f STEP2, }697
bomb1
       dat.f   >267,  >534
bomb
end 

