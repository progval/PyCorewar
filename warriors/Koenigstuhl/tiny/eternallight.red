;redcode-94x
;name Eternal Light
;author John Metcalf
;strategy paper
;strategy for IRC Mini Tour #02
;assert CORESIZE==800

pgo spl 2,<100
x   spl 0,<200
y   spl 0,<300
    spl @0,>120
z   mov }0,>0
    mov bomb,>400
w   mov {-3,<0
    jmz.a @0,480
bomb:dat 0,0
  for 6
  dat 0,0
  rof

gogo:nop }x,}y
nop {z,<z
nop }bomb,>bomb
jmp pgo,>w
end gogo

