;redcode-94x
;name Evol Cap 4 X
;author John Wilkinson
;strategy minimal kill++, maximal survival
;strategy using the older 6.6 engine, plus made some
;strategy dramatic improvements to the stone
;assert CORESIZE==55440

d       equ 34117
i       equ 40
BOOT_DIST equ 12600
DELTA equ 173
STEP equ 16134

org start

imp:       mov.i  #d, *0
jclr:      dat    >1, DELTA+20

bootptr:   nop    evol+4, evol+BOOT_DIST+4

evol:      spl    #0,   <2
           add.a  #d,   1
           jmp    evol+i-d*14, >55440/2
           dat    0,    0

for 90
dat 0, 0
rof

start:     mov.i  imp,  evol+BOOT_DIST+i
           mov.i  jclr, evol+BOOT_DIST+DELTA+33+5

        spl.i   1,      >-1250
        spl.i   1,      >-1400
        mov.i   {bootptr, <bootptr
        mov     -2,     0
        mov.i  {jptr, <jptr

        spl    @jptr
        spl.i   1,      >1250
        jmp    @bootptr, >1400

for 80
dat 0, 0
rof

juliet: spl     #STEP,  >-STEP
        spl     #0,     >-STEP-1
        mov     }STEP-1, -STEP+2
        add     -3,     -1
        djn.f   -2,     <-2667-DELTA
        mov     33,     >-DELTA-10
        jmp     -1,     }-DELTA-11

jptr:   nop    0, evol+BOOT_DIST+7+DELTA


