;redcode-94
;name Lethal Frog
;author Christian Schmidt
;assert 1
;strategy

pStep  EQU   4499
pBomb  EQU   1536

front  dat   #0,       #pStep
       mov.i }-1,      >-1
       jmp   pStep-1,  <pBomb

for 5
       dat   0,        0
rof

start  spl   2
       spl   1
       jmp   front+1

end start

