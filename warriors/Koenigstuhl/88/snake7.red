;redcode
;name Snake7
;author Wayne Sheppard
;strategy Pitbomber-impspiral with Anti Trace
;assert 1

;Paul has been playing some mind games.  I'm not sure what
;he is going to use.  So I will put my best warrior in the
;battle.  Changed a few constants and relocated the trap
;statement so he can't live off of the previous version.
;Also went to a 7-point Spiral in case he was looking for
;a three point.

dist equ 121             ;Bomb spread
imp  equ (icopy-1000)    ;Imp start
hide equ (0-1500)        ;Vamp location 

trap jmp pit-x-121+2,x+121-300   ;Trap moved far away from code
x    spl 0,trap+300
     mov @0,@trap+300 
     sub 4,@-1
     jmp -2
pit  mov @dist,<0-dist
     spl 0     ;This should change more losses into ties
     spl -1    ;than wins into ties

dat <trap,<1   ;decoys
dat <trap,<1   ;slow down enemy djn
dat <trap,<1   ;but don't cmp equal
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1
dat <trap,<1

start mov trap+4,hide
      mov trap+3,<start       ;Copy vamp 
      mov trap+2,<start       ;to a safe place
      mov trap+1,<start
      mov trap,@hide-6        ;Copy trap away from everything
p     mov pit+2,hide
      mov pit+1,<-1
      mov pit,<-2
      mov <1000,-4
      spl start+hide-3,<start     ;1st split to vamp
      spl start+hide-3,<p         ;2nd split to vamp

ring  spl 8,<4050             ;7 point binary ring startup
      spl 4,<4100
      spl 2,<4150
      jmp imp,<3333
      jmp imp+1143,<3344
      spl 2,<3355
      jmp imp+2286,<3366
      jmp imp+3429,<3377
      spl 4,<3388
      spl 2,<3444
      jmp imp+4572,<3455
      jmp imp+5715,<3466
      spl 2,<3488
      jmp imp+6858,<3499
      mov icopy,imp         ;Get ring going here  
     spl 4,<3533            ;Added extra processes for extra durability
     spl 2,<3543
     jmp imp+4,<3564
     jmp imp+1147,<4534
     spl 2,<3666
     jmp imp+2290,<3688
     jmp imp+3433,<3777
icopy mov 0,1143
end   start
