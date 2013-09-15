;redcode-94x
;name Denial
;author David Moore
;assert CORESIZE==55440
;strategy ineffective imp/stone
;strategy (13pt A-imps, 19pt B-imps)

;stone stolen from QuickSilver and modified

hStep equ      859
hTime equ    23300
hDjn  equ    45001
hOff  equ        5
hDist equ    30133

hMain spl    #5               , <hMain+hDjn
hLoop mov    hBomb+hOff       , @hPtr
hHit  add    #hStep*2         , hPtr
hPtr  mov    hBomb+hOff       , }hHit-hStep*hTime
      djn.f  hMain            , <hMain+hDjn
hBomb dat    hStep            , >1

for 85
dat 0,0
rof

i13 equ 34117
i19 equ 29179
iD1 equ 203
iD2 equ 804

iDist equ 30361

imp1  mov.i #5, i19
imp2  mov.i #i13, *0

impy  spl #i19, <i13
      add.f -1, 1
      spl impy+iD1-20*i19, impy+iD2-40*i13
iSrc  jmp @-1, 2

      dat 0,0

for 85
dat 0,0
rof

boot  mov hBomb, away+hDist+(hBomb-hMain)+hOff
      mov imp1, away+iDist+iD1
      mov imp2, away+iDist+iD2
      spl 2
      spl 2
      spl 1
      mov {hMain, {away
      mov <iSrc, <away
      spl 1
      spl 1
away  spl hDist+5, iDist+5
      spl @away
      jmp *away

end boot
