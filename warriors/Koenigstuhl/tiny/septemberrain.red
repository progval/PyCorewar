;redcode-94
;name September in the rain...
;author Sheep
;strategy scan and coreclear
;assert 1

; #### 2 TINY ####

STEP equ 136
INIT equ 78

what dat #9, #0
trig dat #35, #0
inc add.ab #STEP, #INIT
cc mov.i *what, }trig
 mov.i *what, }trig
scn jmz inc, @inc
 mov.ba inc, trig
 jmp inc, #0
bomb dat #8, #0
stun spl #8, #0

 end cc

