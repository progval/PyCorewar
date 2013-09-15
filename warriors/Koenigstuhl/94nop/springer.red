;redcode-94
;name Springer 1.1
;author Alex MacAulay
;strategy A ring "replicator".
;strategy 1.1 - smaller
;assert 1
 
step      equ 247
offset    equ -126
 
start     spl 0,>spread
helpimp   mov imp,imp+offset+3
          spl 1,>helpimp
          spl 1
          spl 1
          spl 1
          spl inc
spread    jmp @spread,#imp+offset
inc       add #step,spread
          dat 0,0
imp       mov 0,step
 
          end start
