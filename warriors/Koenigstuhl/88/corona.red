;redcode-x verbose
;name Corona 1.1
;author Alex MacAulay
;strategy Creates a 63-point 2-process ring, waits, then sends out a
;strategy core-clear which kills off the ring and the subverted enemy.
;strategy 1.1 - Uses core-clear instead of jumper - better vs replicators.
;assert 1
 
step      equ 127
 
runup     spl 1
          spl 1
          spl 1
          spl 1
          spl 1
          mov -1,0
          spl 1
          spl inc
spread    jmp @spread,#imp
inc       add #step,spread ; need a dat after this instruction
          dat #0,#0
 
jstep     equ (step+4)
jprocs    equ 48
jbomb     equ jptr
jfirst    equ jptr
jlast     equ jfrom
 
start     spl runup
wait      djn 0,#104
          spl 1
          mov -1,0
          spl 1
          mov <from,<to
          spl 1
from      spl 1,#jlast+1
to        spl 1,#jlast-jstep+1
          mov jbomb,<clear
clear     jmp jkill,#jlast+jprocs+1
 
jptr      dat #jkill+jstep+250+1
jkill     mov jbomb,<jptr-jstep
          mov jbomb,<jptr-jstep
          mov <jfrom-jstep,<jto-jstep
jto       jmp jkill+jstep,#jfirst+jprocs+(2*jstep)
jfrom     dat #jfirst+jprocs+jstep
 
imp       mov 0,step
 
          end start
