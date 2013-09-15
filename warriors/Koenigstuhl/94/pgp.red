;redcode-94 verbose
;name  PGP
;author  Steven Morrell
;strategy  Encrypt P-space for added security.
;assert 1

org boot

offset equ 500
stream equ 250
step equ 12
first equ (20+step)
flag equ 167

; stp equ nop                 ;uncomment to make this run when VERSION<80

x    mov p,p+offset           ;Sloppy!!!  (Just used as pointer)
boot mov }x,>x
     for 16
       mov }x,>x
     rof
     jmp scan+offset

p    dat first,first+step
     dat last-p,p
     stp.i #last-p,}p
     spl #last-p,}p-20
d    spl #step*-2,#step*-2    ;Also sloppy
loop sub d,p
scan sne *p,@p
     sub d,p
     sne *p,@p
     sub d,p
     sne *p,@p
     sub d,p
     sne *p,@p
     djn.f loop,<stream
     mov @1,}p                ;faster than a multi-process clear
     djn.b -1,<d-1            ;but stupid against imp-rings
     jmp -2

last dat {d-2,{d-2 
for 63
     dat {d-2,{d-2
rof

end

