;redcode-94nop
;name Chimera2
;author Nenad Tomasev
;assert CORESIZE==8000
;strategy blur-style scanner
; entered both 94nop and 94draft hills
; after it pushed off HazyLazyC30
; fell off short after...
; well, that's corewar! :)
; one of my favorite warriors, and possibly my best scanner
; it scores very well against hsaish scanners, because of its code alignment
; it does well against heavy silks, and even scores well against Maelstrom
; ... but it can be defeated by some stones and stone/imps

sini equ 4420
step equ 6587
count equ 850
ini equ (-(count*step))
span equ 8

;6587 850

 org scan
where spl #0, sini
shoot mov.i where, >where
scan seq ini, ini+span
 mov.ab scan, where
subtr sub.f clear, scan
 jmn.b shoot, @shoot
gate jmp clear, 20
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
 dat 0, 0
clear spl #-step, >(-step)
 mov.i bomb, >gate
 djn.f -1, >gate
bomb dat <2667, 16
 end

