;redcode-94
;assert CORESIZE==8000
;name Forgotten Scanner
;author David Moore
;strategy make decoy, then one-shot scanner -> clear

;This is the scanner from Forgotten Lore,
;but without the convoluted bootstrap.

gate    dat 0, 0
jumper  jmp 4009, 18
        dat 0, 0
        dat 0, 0
        jmp   -400,    <2667
clear   spl  #4600,     18
        mov  @switch,  >gate
        mov   jumper,  }gate
switch  djn   clear,   {clear  ;this becomes djn -2 after scan phase

        dat 0, 0
        dat 0, 0
        dat 0, 0
        dat 0, 0

        sub.x  step,  scan
scan    sne 4009 + 80, 18 + 80
        jmz.f  -2,   <scan
        mov.f  scan,  gate
step    jmp   }switch,  switch+1

for 73
    dat 0, 0
rof

place equ (scan + 3000)

decoy   mov.i {place+0, #0  ;create decoy and hide decoy maker
        mov.i {place+1, #0
        mov.i >place+2, #0  ;this decoy will stop the scanning
        mov.i >place+3, #0  ;before it goes too far
        mov.i >place+4, #0
        mov.i }place+5, #0
        mov.i }place+6, #0
        mov.i <place+7, #0
        jmp scan, <place+8

end decoy

