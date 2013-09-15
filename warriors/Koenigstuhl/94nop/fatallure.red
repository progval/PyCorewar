;redcode-94nop
;name fatal lure of pMars
;author Simon Wainwright
;strategy scanner
;assert 1

scanstep equ 9
selfscans equ 7
cleargate dat             0,                  0
scangate  dat             0,  stun-438*scanstep
          dat             0,                  0
          dat             0,                  0

squash    mov          stun,          <scangate
          mov     >scangate,          >scangate
          jmn.f      squash,          >scangate
scanloop  add   #scanstep+1,           scangate
          jmz.f    scanloop,          <scangate

          slt     @scanloop,  #clear+2-scangate
          jmp        squash,          <scangate
          djn   *scanloop+2,         #selfscans

stun      spl             0,                  0
clearloop mov         clear,         >cleargate
          djn.f   clearloop,         >cleargate
clear     dat         <2667, <clear+2-cleargate

          end    scanloop+1

