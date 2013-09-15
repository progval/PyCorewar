;redcode
;name Dwarf
;author Deathy
;assert 1
      JMP START
bomb  DAT -1
START MOV -1,-1
      SUB #1,-1
      JMP START
      END
