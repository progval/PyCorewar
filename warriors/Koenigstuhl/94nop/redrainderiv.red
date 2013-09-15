;redcode-94
;name RedRain Derivative
;author Robert Macrae
;strategy Small, Dat-Bomer/Scanner after Red Rain.
;assert 1
step    equ     212             ; Mod 4

scan    add.ab  #step, #0
        jmz.b   scan,  @scan
        mov     -3,    @scan
        jmp     scan,  0

        end
