;redcode-94x quiet
;name Poke v0.1
;author Ian Oversby
;strategy Stone
;assert CORESIZE==800

stone   SPL.B   #28,    >-28    ; mod-4
loop    MOV.I   {0+28,  2-28
        ADD.F   stone,  loop
        DJN.F   loop,   <462    ; SPL is placed here
        MOV.I   5,      <-10    ; for the core-clear
end

