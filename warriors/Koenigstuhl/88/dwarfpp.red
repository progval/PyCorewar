;redcode
;name Dwarf++
;author A.K. Dewdney & J. Kao
;strategy? what strategy?
;assert 1

bomb   DAT #0
dwarf  ADD #3044, bomb
       MOV bomb, @bomb
       JMP dwarf, <-30
end dwarf
