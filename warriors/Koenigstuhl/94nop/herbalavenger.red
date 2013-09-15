;redcode-94nop
;name Herbal Avenger
;author Michal Janeczek
;strategy scanner
;assert CORESIZE == 8000

      org   decoy

cptr  mov   bomb  , }2669
gate  mov   bomb  , >cptr
scan  seq   2454  , 2448
      mov.b scan  , cptr
      add   inc   , scan
      jmn   gate  , @gate
inc   spl   #2446 , 2446
      mov   wipe  , >gate
      djn.f -1    , >gate
wipe  dat   <2667 , 2-gate

      for   5
      dat   0     , 0
      rof

bomb  spl   #1    , 1

      for   MAXLENGTH-CURLINE-6
      dat   0     , 0
      rof

d     equ   (cptr+7315)

decoy nop   >d    , }d+2
      mov   {d+3  , {d+7
      mov   <d+1  , <d+5
      djn.f gate  , {d+9
