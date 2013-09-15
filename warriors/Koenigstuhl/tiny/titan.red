;redcode-94x
;name  Titan
;author Christian Schmidt
;strategy  emerald stone
;assert 1

step equ -156

emerald   SPL #-step,<step
stone     MOV >-step,step+1
          ADD emerald,stone
cnt       DJN.f  stone,<emerald-50

