;redcode-94nop
;name NSos13
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy oneshot
; lived to the age 20 on 94nop
; i'm very satisfied with it's performance...
; uses a quick decoy-maker
; and a slightly less popular coreclear (which i used quite often)
; a good, strong oneshot.

poc equ 219
span equ 14
sbdist equ 1900
dc equ gate-2779

 org decoy
gate dat 0, 0
finish dat <2667, <22
clear spl #2*span, 2*span
 mov clear, >gate
 mov clear, >gate
 djn.a -2, {clear
 for 24
 dat 0, 0
 rof
inc add.f clear, @2
scan sne poc, >poc+span
 add.f clear, scan
 sne *scan, @scan
 djn.f inc, *scan
 mov.a #-500, clear
 mov.b scan, gate
 jmp clear, <gate
 for 57
 dat 0, 0
 rof
decoy nop >dc, }dc+1
 mov <dc+2, {dc+4
 mov {dc+5, <dc+7
 mov <dc+8, {dc+10
 djn.f scan, <dc+12
 end

