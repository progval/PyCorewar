;redcode-tiny
;name Diptera
;author Nenad Tomasev
;assert CORESIZE==800
;strategy bishot

step equ (pok-incr)
ds equ -340
ini equ 45
dist equ 350

 org scan
pok dat ini, ini+dist
 dat 18, <267
stun spl #20, >630
loop mov stun, >pok
 mov stun, }pok
 djn.a loop, <stun
 for 8
 dat 0, 0
 rof
incr sub.x #step-1, step
scan sne *pok, <pok
 djn incr, <ds
 jmp stun, <pok
 for 2
 dat 0, 0
 rof
 end

