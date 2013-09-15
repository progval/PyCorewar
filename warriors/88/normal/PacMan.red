;redcode
;name PacMan
;author David Moore
;assert CORESIZE==8000
;strategy Stone bombs with spl and dat;
;strategy separate core clear.
;strategy v5: denser bombing; spl's are close together
;strategy v6: absolutely the final version
 
step  equ  3359
delay equ  1505
time2 equ  2478
time3 equ   961
time4 equ  1359
dist  equ  -612
dc    equ   181
dw    equ    10
dp    equ    13
db    equ     5
gate  equ    -5
time  equ    59
 
decoy dat #decoy, #1

for 56
      dat #decoy, #1
rof
      dat #decoy, #2
      dat #decoy, #1
      dat #decoy, #1
      dat #decoy, #2
      dat #decoy, #1
      dat #decoy, #1
      dat #decoy, #2
      dat #decoy, #1
      dat #decoy, #1
      dat #decoy, #1
      dat #decoy, #1

stone spl 0, step+1
      sub 3, 1
      dat #decoy, #1
      mov < time2*(-3), < 1+(delay*step*2)
      mov -3, @-1
      jmp -3, < step*2

clear mov      db, < dp
      dat  #decoy, # 1
      jmp      -1, < -12
      jmp   -2+dw,   0

cb    dat  < 2667, # -dp
wimp  jmp       0, < gate
back  mov       1, < -9
bust  dat  < 2663, < 2663
bust2 dat  < 2663, # 1

start mov stone+5,   boot+dist+4
      mov stone+4, < -1
      mov stone+3, < -2
      mov stone+1, < -3
      mov      cb,   boot+dist+dc+db
      mov stone+0, < -5
hide  mov clear+3,   boot+dist+dc+2
      mov clear+2, < -1
      mov clear+0, < -2
      mov    wimp,   boot+dist+dc+dw
      mov    back,   boot+dist+1+((time2-delay-time3)*(-3))
      mov    bust, < -2 ;boot+dist+dc+dw+gate+4
      mov #time-dp-dc, boot+dist+dc+dp
      mov   bust2,   boot+dist+2+((time2-time4)*(-3))
      mov #time-dp-dc, < -2
boot  spl    dist, < start
cboot jmp boot+dist+dc, < hide

end start
