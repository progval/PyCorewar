;redcode-nano
;name flesh eating owls
;author John Metcalf
;strategy clear
;assert 1

ptr: spl   #10,      <-5
loop:mov.i #7,       }ptr
     mov   last,     }ptr
     mov   last,     <ptr
     djn.f loop,     <ptr
last:end

