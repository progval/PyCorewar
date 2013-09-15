;redcode-94
;name Rolling Pattern Bomber
;author Compudemon
;assert CORESIZE==8000

;4000
;2000 6000
;3000 7000 1000 5000
;2500 6500  500 4500 3500 7500 1500 5500
;2750 6750  750 4750 3750 7750 1750 5750
; 2250 6250  250 4250 3250 7250 1250 5250

bootofst equ 1022 ;1016
bombofst equ 15

boot:  dat first, bootofst
patt: mov.i #4001,    17;mark 4

 dat 5265, 1265
 dat 7264, 3264
 dat 4263,  263
 dat 6262, 2262
 dat 5761, 1761
 dat 7760, 3558 ;mark 3
 dat 4757,  759 ;mark 5
 dat 6756, 2761 ;mark 2

 dat 5507, 1507
 dat 7506, 3506
 dat 4505,  505
 dat 6504, 2504

 dat 5003, 1003
 dat 3002, 7002

 dat 6002, 1997 ;mark 1
patt_strt:

begin: mov }boot, >boot
 mov }boot, >boot
 mov }boot, >boot
 mov }boot, >boot
 add.ab # bombofst, boot
 mov }boot, >boot
 jmp boot + bootofst + (roll-first)

first:
hit1: mov.i bomb+bombofst, @ (first-bootofst) + (patt-boot)
hit2: mov.i bomb+bombofst, * (first-bootofst) + (patt_strt-boot)
roll: mov.i < hit2, < hit1
 jmp first, < bomb+bombofst
 bomb jmp #0,0;dat {0, (first-bootofst) + (patt_strt-boot) - bombofst

end begin

