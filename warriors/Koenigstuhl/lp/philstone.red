;redcode-94lp
;name Philosopher's Stone
;author John Metcalf
;strategy Stone/Imp for Pizza's limited process hill
;strategy 4 processes in stone, 4 in imp
;assert CORESIZE==8000 && MAXPROCESSES==8

for 0
Entered the LP hill on Thursday 18th February 1999, taking 14th place:
14  33.5/ 32.7/ 33.9       Philosopher's Stone         John Metcalf 134.2
rof

iStep equ 2667
sStep equ -2618

     spl   1,        {4200   ; make 8
     spl   1,        {3100   ; processes
     spl   1,        {2000
     jmp   *vect,    }0      ; launch

vect:jmp   #off+1,   1       ; 4 processes
     jmp   #off+2,   1       ; in stone
     jmp   #off+3,   1
     jmp   #off+1,   1

     jmp   #imp,        1    ; and 4 in
     jmp   #imp+iStep,  1    ; the imp
     jmp   #imp+iStep*2,1
     jmp   #imp+iStep*3,1

     for   70
     dat   0,0
     rof

off: spl   #sStep,   <-sStep
sto: mov   >sStep,   1-sStep ; incremented
     add   off,      sto
     jmp   sto,      off     ; incremented

     for   13
     dat   0,0
     rof

imp  mov.i #iStep,   *0
     end

