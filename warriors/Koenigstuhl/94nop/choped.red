;redcode
;name Choped
;author Franz
;strategy Chopped it is because a bunch of things are "chopped" off :)
;strategy 60% dat bomber, dat clear
;strategy SPL,SEQ,.AB,.F,>,$ are banned, man this is hard ...
;assert CORESIZE==8000

step equ 2365
stbm equ (adder+step)
gate equ (adder-20)

org bomber

steps    nop.i <step*3,<step*3
bomber   mov.i @bomb,*bomber3
bomber2  mov.i *bomber,@bomber3
bomber3  mov.i }stbm,@stbm+step
adder    add.i @ccj,@bomber2    ;add to bomber 3
jumper   djn.b *bomber2,#530
cc       mov.i *bomber,}gate
ccj      jmp.i *adder-50,<steps
bomb     dat.i <52,}step

end
