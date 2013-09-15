;redcode-94nop
;name CPScanner
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy scanner
; just an attempt to make something better than Agony :)
; its attack is a little faster, and that makes it better
; against opponents with stones
; step is also nice :)
; it almost entered 94nop... but it did enter at multiwarrior

safe equ 25
count equ 2500
span equ 9
carpet equ 14
step equ 3731
ini equ step
ds equ incr-2058

 org decoy
incr sub.f more, scan
scan seq ini, ini+span
 slt.ab #safe, scan
loop djn.b incr, #count
att mov.ab scan, @shoot
many mov.ab #(carpet/2), #0
 mov.i stun, >scan-3
shoot mov.i stun, >scan-3
 djn.b -2, many
 jmn.b incr, loop
more spl #-step, >-step
 mov.i b, >shoot
 djn.f -1, <-23
b dat <2667, 10
stun spl -1, #-1
 for 70
 dat 0, 0
 rof
decoy nop >ds, <ds+1
 mov {ds+2, {ds+4
 mov <ds+5, <ds+7
 mov {ds+8, <ds+10
 djn.f scan, <ds+12
 end

