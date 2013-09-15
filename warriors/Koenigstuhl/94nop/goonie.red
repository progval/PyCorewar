;redcode-94
;name goonie
;author David Moore
;strategy scanner
;assert 1

step   equ 7790 ; 7620 ; 7860
blur   equ 5240 ; 6080 ; 5990
times  equ    3
ival   equ   10

      dat 0,0  ; scanned

gate  dat     0,     0
      dat <5334, <2667
      dat    -1,    12
wipe  spl #3891,    20
      mov  wipe, >gate
      mov   *-1, >gate
      djn.a  -2,  gate
      djn.a  -3,   *-1

      dat 0,0
first dat 0,0  ; scanned
      dat 0,0

      add.f  adder,  scan
scan  sne first+step*3+ival, first+step*3
      jmz       -2, #0
      spl       <0,  wipe+times
      mov.ab  scan,  gate
      djn   scan-1, #times

adder dat step, step

    for 74
      dat 0,0
    rof

start nop }first+blur+0, >first+blur+0
      mov {first+blur+1, <first+blur+6
      mov {first+blur+2, {first+blur+4
      mov <first+blur+7, <first+blur+9
      mov <first+blur+10, <first+blur+12
      jmp scan-0, }first+blur+13

end start

