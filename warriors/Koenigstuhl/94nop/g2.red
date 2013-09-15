;redcode-94
;name G2
;author David Moore
;assert CORESIZE==8000
;strategy two-shot scanner

ival equ 10
step equ 191
x equ (4+step)

      dat 0,0
ptr   dat 0,0
      dat 0,0
sw    dat 1, 14
g2    spl #ptr+100, 14
      dat 0,0
      dat 0,0
clr   spl  #step, step
      mov   *sw, >ptr
      mov   *sw, >ptr
      djn.f  -2, }g2
      dat 0,0
      dat 0,0
      dat 0,0
      dat 0,0
      dat 0,0
      dat 0,0
      dat 0,0
      mov   clr, >ptr+2
      add   *-1,  1
main  sne     x, x+ival
      djn.f  *2, *-1
      mov.b main, <-4
      djn.f *-4, #0

for MAXLENGTH-CURLINE
dat 0,0
rof

end main 