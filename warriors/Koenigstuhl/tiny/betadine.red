;redcode-94x verbose
;name Betadine
;author M Joonas Pihlaja
;strategy scan w/ clear
;assert CORESIZE==800 && MAXLENGTH==20

;gate equ (clr-5)
gate dat   40+10-5, 40-5
     dat   #-10, bot+3-gate
clr  spl   #-10, bot+3-gate
     mov   @3, >gate
     mov   @2, >gate
     mov   @1, >gate
bot  djn.f -3, {clr
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   20, 20
     add   -1, gate
scn  sne   @gate, *gate
     djn.f -2, <-205
     jmp   clr, <gate

     end  scn
