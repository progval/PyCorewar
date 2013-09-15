;redcode-nano
;name umbrella
;author John Metcalf
;strategy silk-imps?
;assert 1

     step  equ 28
pap: spl   #0,      }step
     spl   @pap,    >15
     mov   }pap,    >pap
     mov.i #-step*2,}step+1
     end
