;redcode-nano
;name naosv2
;author Nenad Tomasev
;assert CORESIZE==80
;strategy nano oneshot v2.0

step equ 5
ini equ 12

org scan
scan add.ab stun, #ini
jmz.f scan, @scan
stun spl #step, 10
clr mov.i *scan, >scan
djn.f clr, {-10
end

