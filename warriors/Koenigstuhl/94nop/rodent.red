;redcode-94
;name Rodent
;author Marc Brooker
;assert CORESIZE==8000
bomb  dat #0
start SPL 0
dwarf ADD #8, bomb
      MOV bomb, @bomb
      ADD #8, bomb
      MOV bomb, @bomb
      SPL >troll
      jmp dwarf
troll dat #0
      end start
