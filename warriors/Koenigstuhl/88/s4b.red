;redcode
;name   s4b
;author D. Darling
;strategy       Simple 4-line Bomber
;strategy       Apologies if this = Herem, etc...
;strategy       Now 5-line: self-SPL+core clear
;assert 1

step    EQU     2365

start   SPL     0,      <-10
stone   MOV     <-6,    <-12
        ADD     inc,    stone
        DJN     stone,  <-3
inc     DAT     <step,  <step

        END     start
