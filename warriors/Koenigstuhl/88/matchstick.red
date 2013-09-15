;redcode quiet
;name Match Stick
;author c w blue
;assert 1
rep       spl 1
          spl 1
          spl 1
top       spl 1
startup   mov #16, 16
Paper     mov <startup, <spawn
spawn     spl @0, 1067
          mov jump,<spawn
          jmz startup,startup
kill      mov vamp1,<0
vamp1     dat <2667,<5334
jump      jmp 12,<2667
clear     mov vamp1,<-37
          spl clear,<-37
          jmp clear,<-37
          jmp clear,<2667
          jmp clear,<2667
          jmp clear,<2667
          jmp clear,<2667
          jmp clear,<2667
          jmp clear
