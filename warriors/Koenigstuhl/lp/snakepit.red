;redcode-lp
;name Snake Pit
;author David Moore
;assert MAXPROCESSES==8 
;MAXLENGTH==200
;strategy My warrior for the 2nd round is a vampire/stone combination.
;strategy I think it can be improved but the major features so far:
;strategy 
;strategy *  A 50%c vampire loop similar to Limb Rending Incisors
;strategy 
;strategy *  Trap is continuously rebuilt for complete protection
;strategy    from a-field indirect bombing (a.k.a "antivamp")
;strategy 
;strategy *  A computer-generated stone which can maintain a decent bombing
;strategy    pattern for over 80000 cycles by undergoing 7 mutations.
;strategy    It makes an effective backup core-clear since it can hit over
;strategy    95% of the locations.

sbd equ 4664

vc equ 4020

vamp   add.f #-2-jb, jb
       mov @0, >jb
       mov ji, }jb
       jmp vamp, 0

for 3
  dat 0,0
rof

ji     jmp #1, 1

for 4
  dat 0,0
rof

jb     jmp trap-vc, vc

for 1
  dat 0,0
rof

wait   mov 1, trap
       jmp {0, }0

for 9
  dat 0,0
rof

       mov @0, <-31
       spl #0, 0
       jmp -2, 0
trap   jmp {0, }0

for 27
  dat 0,0
rof

boot   spl 1, >2000
       spl boot2, {2202
       spl 1, }2404
       jmp >0, vamp
boot2  spl boot3, {2659
       djn wait, #2
       jmp vamp+1, {-1
boot3  mov <stone+3, <2
       mov <stone+3, <1
       djn.f sbd+1, #sbd+3

       dat 0,0

stone  mov  > 7968, 2727
       add.f  1,  -1
       jmp   -2, < 2726

end boot

