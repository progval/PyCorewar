;redcode-nano
;name strike against the machines
;author John Metcalf
;strategy clear
;assert CORESIZE==80

gate:spl   #37,      <34
loop:mov   db,       <gate
     mov   db,       }gate
     djn.f loop,     }gate
db:  dat   5,        -10
