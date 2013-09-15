;redcode-tiny
;name BlackMusic2
;author Nenad Tomasev
;assert CORESIZE==800

step equ 28
span equ 6
ini equ -30

 org scan
gate dat 0, 0
b dat 1, 8
clear spl #step, step
 mov *b, >gate
 mov *b, >gate
 djn.f -2, }clear
 sub.f clear, scan
scan sne }ini+span, }ini
 djn.f -2, >jump
 mov.b scan, gate
jump jmp clear, 29
 dat 0, 0
 dat 0, 0
 dat 0, 0
 spl #1, 1
 spl #1, }1
 spl #1, {1
 spl #1, *1
 spl #1, @1
 spl #1, #1
 end

