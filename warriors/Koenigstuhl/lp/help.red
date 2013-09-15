;redcode-lp
;name heLP
;author Simon Wainwright
;strategy bomber 
;strategy works for coresize 55440 or 8000
;assert MAXPROCESSES == 8

time equ (CORESIZE/4)

bomb     jmp       #h,        <h

         for       67
         dat        0,         0
         rof

bomber   add.f #-bomb,      bomb
b        mov.i     @b,     @bomb
         mov.i     @b,     *bomb
h        djn   bomber,     #time
         mov  datbomb, >bomber-5
         jmp       {0,        }0

         for        3
         dat        0,         0
         rof

datbomb  dat    <2667,        15

         end        h

