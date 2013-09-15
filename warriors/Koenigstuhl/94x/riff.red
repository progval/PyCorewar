;redcode-94x verbose
;name  Riff
;author Steven Morrell
;strategy  Stone like Emerald without the in-memory/in-register problem
;assert CORESIZE==55440
;macro

step equ -12988

emerald   SPL #-step,<step
stone     MOV >-step,step-1
          ADD emerald,stone
cnt       DJN.f  stone,<emerald-50

boot mov emerald+3,-10000
     mov emerald+2,<boot
     mov emerald+1,<boot
     mov emerald,<boot
     jmp emerald

for 191
     dat >-emerald,<34117
rof

end boot
