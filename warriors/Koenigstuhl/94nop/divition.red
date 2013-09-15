;redcode-94
;name Divition
;author Hyperwiz
;assert 1
;strategy Bombs at smaller and smaller intervals

STARTDIV EQU 10

ORG Shoot

Start: mov.a  #-1, $Inc
Divide:div.a  #STARTDIV, $Inc
       mov.ab Inc, Bomb
Shoot: mov.i  Bomb, @Bomb
Inc:   add.ab #(CORESIZE/STARTDIV), Bomb
       slt.ab #(Start-Bomb-2), Bomb
       jmn.b  $Shoot, $Bomb
       jmp    $Start, }Divide
Bomb:  dat    #0, #(CORESIZE/STARTDIV)

END

