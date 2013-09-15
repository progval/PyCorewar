;redcode-94 verbose
;name  Blue Funk
;author Steven Morrell
;strategy  Stone like Emerald without the in-memory/in-register problem
;strategy  Imp added for fun
;macro
;assert 1

step equ 3044

for 81
dat <imp,<2667
rof

emerald   SPL #-step,<step
stone     MOV >-step,step-1
          ADD emerald,stone
cnt       DJN.f  stone,<emerald-50

boot spl @0,-200
     mov emerald,>boot
     mov emerald+1,>boot
     mov emerald+2,>boot
     mov emerald+3,>boot
     spl i
     spl i31
i12  spl imp2
imp1 jmp >0,imp
i31  spl imp1
imp3 jmp >0,imp+5334
i    spl i12
     spl imp3
imp2 jmp >0,imp+2667

imp  mov.i #3044,2667

end boot
