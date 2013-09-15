;redcode-tiny
;name Seek and Destroy
;author Sascha Zapf
;strategy Betadine with .8c and heavy optimized.
;assert CORESIZE==800

step equ 26
djstart equ 112
mostream equ 685
fposa equ 60
gap equ 19
spalt equ 16

gate dat   fposa+gap, fposa
     dat   #mostream, bot+spalt-gate  ; 6 war 3
clr  spl   #mostream, bot+spalt-gate
     mov   @3, >gate
     mov   @2, >gate
     mov   @1, >gate
bot  djn.f -3, {clr
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
     dat   0, 0
inc  dat   step, step
loop add.f inc, gate
scn  sne   @gate, *gate
     add.f inc, gate
     sne   @gate, *gate
     djn.f loop, <-djstart
     jmp   clr, <gate

     end  scn

