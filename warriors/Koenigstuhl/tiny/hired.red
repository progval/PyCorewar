;redcode-94x
;name Hired Sword
;author John Metcalf
;strategy decoy maker -> .33 scan / .33 clear -> d-clear
;assert CORESIZE==800

     step  equ (181)
     time  equ (220)
     gate  equ (ccpo-2)

ccpo:mov.b loop,     #537
loop:sub   #step,    #step*time
     mov   *sp,      >ccpo
scan:jmz.f loop,     @loop
     jmn   @0,       *ccpo
sp:  spl   0,        0
looz:mov   bomb,     >gate
     djn.f looz,     >gate      ; {gate  also works well and would
bomb:dat   <1,       13         ; allow the spl bomb to be changed
                                ; to  spl #0, 0
     for   4
     dat   0,0
     rof

     decoy equ (ccpo+319)
make:mov   bomb,     <decoy+3
     mov   <decoy+4, <decoy+28
     mov   <decoy+29,<decoy+50
     mov   <decoy+51,<decoy+75
     mov   <decoy+76,<decoy+97
     mov   <decoy+98,<decoy+119
     djn.f scan,     <decoy+144

     end   make
