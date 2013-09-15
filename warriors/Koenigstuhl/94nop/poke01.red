;redcode-94 quiet
;name Poke v0.1
;author Ian Oversby
;strategy Testing components
;assert 1

stone   SPL.B   #76,    >-76    ; mod-4
loop    MOV.I   {0+76,  2-76
        ADD.F   stone,  loop
        DJN.F   loop,   <-1900  ; SPL is placed here
        MOV.I   1,      <-10    ; for the core-clear

for 95
        DAT.F   $0,     $0
rof

end
