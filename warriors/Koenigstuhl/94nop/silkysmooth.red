;redcode
;name Silkysmooth
;author Aristoteles Pagaltzis
;assert 1

start SPL 2
      JMP 2
      SPL 1
  ptr SPL    666,  #0
      MOV.i >ptr,  }-1
      JMP     -2,  <ptr
END start



