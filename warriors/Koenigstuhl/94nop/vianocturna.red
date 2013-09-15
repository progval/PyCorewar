;redcode-94nop
;name ViaNocturna
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy scanner
;strategy zoom trick

ds equ 3398 ;-3600
step equ (16*num)
gate equ (clr-3)
span equ 8
num equ 173
ini equ (step-span)

 org scan
where dat 0, 0
 for span-2
 dat 0, 0
 rof
reg nop }0, {loop
shoot mov.i clr, >where
incr sub.f clr, scan
scan sne.f ini, ini+span
loop djn.f incr, <ds
 mov.b scan, where
 jmn.b *reg, @shoot
 jmp *incr, 0
 for 4
 dat 0, 0
 rof
clr spl #-step, >-step
 mov.i b, >gate
 djn.f -1, >gate
b dat <2667, ((b-gate)+2)
 end

