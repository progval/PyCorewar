;redcode-94
;author JKW
;name PleGiMACS II
;strategy scan, gate
;assert 1

step equ 3094

org boot

for 9
dat.i  @1, }boot*3777
dat.ab *1, >1
dat.f  boot*3777, <1
dat.i  @1, }boot*3777
dat.b  {1, *1
dat.f  boot*3777, <1
rof

boot: mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr
      mov {ptr, <ptr

      jmp @ptr

add #step, 1
jmz -1,    0
mov -3,    @-1
jmp -3,    0
jmp 4,     0
dat 0, 0
dat 0, 0
dat 0, 0
jmp #0, <-3

ptr: dat 0,  boot+4000

for 4
dat.i  @1, }boot*3777
dat.ab *1, >1
dat.f  boot*3777, <1
dat.i  @1, }boot*3777
dat.b  {1, *1
dat.f  boot*3777, <1
rof

end

