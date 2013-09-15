;redcode
;author Miz
;name Throo
;assert 1

const equ 134
spl #const ,#const
mov.i 3, @-2
add.f -2, -3
mov.i -3, >2
djn.f -3, <-5
dat 0,15

