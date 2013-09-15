;redcode-94
;name Mirage 2
;author Anton Marsden
;strategy Faster version, boot and decoy, no pspace
;assert CORESIZE==8000

      ORG    scan

step  EQU    3024                 ; mod-16

ptr   dat.f  >0,$step
      dat.f  >0,$btm-ptr+3
cc    spl.a  #1,$btm-ptr+4
top   mov.i  $cc,>ptr
scan  seq.i  $2*step+8,$2*step
      mov.b  $scan,$ptr
a     add.f  $inc,$scan
      jmn.b  $top,$scan
inc   spl.a  #step,>step
      mov.i  @1,>ptr
btm   djn.b  $-1,{cc

      end
