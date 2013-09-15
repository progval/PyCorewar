;redcode
;name Silkysmooth 6P7
;author Aristoteles Pagaltzis (Screamer)
;assert 1

start SPL  1
      SPL  1
      MOV  0,-1

silk  SPL         997, #silk
      MOV.i       >-1, }-1
      SPL          55, #silk
      MOV.i       >-1, }-1
      MOV.i        <1, {1
      DJN.b 55+2-silk, 2
      MOV.i        #0, -1
END start

