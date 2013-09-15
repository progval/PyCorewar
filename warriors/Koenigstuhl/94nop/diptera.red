;redcode-94nop
;name Diptera
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy bishot
; I really like this one :-)
; it was at 94nop for a while,
; but died young :(
; however, I am still convinced
; that it's one of the best bishots in game...
; I wonder how it'll do on Koenigstuhl

step equ (pok-incr)
ds equ -3422
ini equ 128
dist equ 3590

 org scan
 for 84
 dat 0, 0
 rof
pok dat ini, ini+dist
 dat 18, <2667
stun spl #20, >6230
loop mov stun, >pok
 mov stun, }pok
 djn.a loop, <stun
 for 6
 dat 0, 0
 rof
incr sub.x #step-2, step
scan sne *pok, <pok
 djn incr, <pok
 jmp stun, <pok
 end

