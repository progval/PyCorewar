;redcode-tiny
;name Soft as Silk
;author Sascha Zapf
;assert CORESIZE==800
;strategy qbomb -> paper

bootdis equ 239

start
    mov.i <428, 542
  mov.i <701, 40
  mov.i <688, 481
  mov.i <125, 327
  mov.i <683, 556
  mov.i <231, 378
  mov.i <367, 261
  mov.i <439, 84
  mov.i <642, 69

launch spl 2, <-200
  spl 1, <-300
  spl 1, <-400
  mov.i <boot,{boot
boot jmp  launch+bootdis,ssilk+6

ssilk spl @0,<104
  mov.i }-1, >-1
  spl #626, >164
  mov {193, {674
  add -2, -1
  djn.f @0, {-2

