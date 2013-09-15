;redcode-94 verbose
;name  Blue Funk 6
;author Steven Morrell
;strategy  Toss something together really fast for the
;strategy  Limeted Process round.
;strategy  BF3-ish stone, with no imp-ring or decoy this time.
;strategy  Another stirling example of how the even numbers don't
;strategy  succeed.  (Much the reverse of Star Trek movies)
;assert CORESIZE == 8000

step equ 3044

          DAT 0,7
          DAT 0,0
          DAT 0,0
          DAT 0,0
          DAT 0,0
          DAT 0,1
          DAT 0,0
emerald   SPL #-step,<step
stone     MOV >-step,step-9
          ADD emerald,stone
cnt       DJN.f  stone,<emerald-450
          JMP stone

end stone
