;redcode-tiny
;name Smart Cabrio
;author LAchi
;strategy Mini Q4 -> Stone
;assert CORESIZE==800
   qa equ 240
   qb equ 421
   qf equ qta 

pgo
Stone     spl    #-76,#76     ; self-splitting, unbooted stone
        mov    -2,<-13      ; with sequential core clear
        add    Stone,1
        mov    >0,-3
        djn.f  -2,{-150 

    for MAXLENGTH - 11 - CURLINE
        dat    0,0
    rof 

qgo
   sne   qf-2*(qa-1)*(qb),qf+(qa-1)*(qb)
   seq   qf-2*(qa)*(qb),  }qta
   jmp   qta,             {qta
   jmz.f pgo,             <qta 

qta: mul.x #qa,      #qb
   sne   >-242,    @qta
   mul.f #-2,      qta 

qlo: mov   <-285,    }qta
   mov   }qlo,     <qta
   djn   qlo,      #17
	jmp pgo, < -200 


end qgo 

