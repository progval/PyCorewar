;redcode-94nop
;name Cascade
;author Roy van Rijn
;strategy Stone from Joonas, clearing by Lukasz, and rest is from Michal....
;strategy But I put it together, and it is my first good stone/imp :-)
;assert 1

      org    qGo

sStep equ    1653
hDist equ    667

iStep equ    2667
iTime equ    101
iDjn  equ    4774
iOff  equ    5719

iDist equ    3756

qX    equ    2922
qA    equ    5673
qB    equ    1154
qC    equ    787
qD    equ    4268
qE    equ    7749
qF    equ    1825

qStep equ    7
qTime equ    16
qOff  equ    87

qBomb dat    {qOff            , qF

pGo   mov    sBmb             , hBoot+hDist+5
      spl    2                , }qC
qTab2 spl    2                , }qD
      spl    1                , }qE
      mov    {pGo             , {hBoot
      mov    {pGo             , {iBoot
hBoot djn    hDist            , #5
iBoot djn.f  hBoot+iDist      , #qA

qTab1 spl    #iPump+iOff      , }qB
      sub.f  #-(iStep+1)      , iJump
iPump mov    iImp             , }qTab1
iJump djn.f  iOff-2*(iStep+1) , {iDjn
iImp  mov.i  #iStep           , *0

sStart  spl     #3*sStep        , 3*sStep
        mov     sBmb+5          , @sPtr
        add     sStart          , @-1
sPtr    mov     4+(2*sStep)     , *4
        djn.f   -3              , *sPtr
sBmb    dat     sStep           , >1

      for    51
      dat    0                , 0
      rof

qGo   seq    qPtr+qX          , qPtr+qX+qD
      jmp    qSkip            , {qPtr+qX+qStep
      sne    qPtr+qX*qE       , qPtr+qX*qE+qE
      seq    <qTab2+1         , qPtr+qX*(qE-1)+(qE-1)
      jmp    qDec             , }qDec+2
      sne    qPtr+qX*qF       , qPtr+qX*qF+qD
      seq    <qBomb           , qPtr+qX*(qF-1)+qD
      jmp    qDec             , }qDec
      sne    qPtr+qX*qA       , qPtr+qX*qA+qD
      seq    <qTab1-1         , qPtr+qX*(qA-1)+qD
      djn.a  qDec             , {qDec
      sne    qPtr+qX*qB       , qPtr+qX*qB+qD
      seq    <qTab1           , qPtr+qX*(qB-1)+qD
      jmp    qDec             , {qDec
      sne    qPtr+qX*qC       , qPtr+qX*qC+qC
      seq    <qTab2-1         , qPtr+qX*(qC-1)+(qC-1)
      jmp    qDec             , {qDec+2
      seq    qPtr+qX*(qC-2)   , qPtr+qX*(qC-2)+(qC-2)
      djn    qDec             , {qDec+2
      sne    qPtr+qX*qD       , qPtr+qX*qD+qD
      jmz.f  pGo              , <qTab2

qDec  mul.b  *2               , qPtr
qSkip sne    *qTab1           , @qPtr
      add.b  qTab2            , qPtr
qLoop mov    qBomb            , @qPtr
qPtr  mov    qBomb            , }qX
      sub    #qStep           , @qSkip
      djn    qLoop            , #qTime
      djn.f  pGo              , #0

      end

