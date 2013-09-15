;redcode-94b
;name StoneyScanner v1.1
;author Daniel Rivas
;strategy Stone/Scissor hybrid.
;strategy Help from Jens Gutzeit much appreciated!
;assert 1

start SPL 0, <-1001
      MOV <21, 1+2234
      SUB 1, -1
      DJN -2, <-2234

step  EQU    70; mod-10
gate  EQU    top

ptr   mov.i  $inc+1,>step ; New DJN protection...
top   mov.i  $inc,>ptr    ;                       Or

scan  seq.i  $2*step+5,$2*step
chg   mov.b  $scan,@top
a     add.f  $inc,$scan
      djn.b  $top,#800
inc   spl.i  #step,#step
      mov.i  $clr,>gate
btm   djn.f  $-1,>gate
clr   dat.f  <1,#clr-gate+2


end start

