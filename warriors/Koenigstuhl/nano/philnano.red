;redcode-imt2
;name Philosopher's Stone
;author John Metcalf
;strategy stone taken from my LP warrior
;assert CORESIZE==80
     sStep equ 6
off: mov   >sStep,   {-sStep
sto: mov   >sStep*2, 1-sStep*2 ; incremented
     add   off,      sto
     jmp   sto,      off       ; incremented
