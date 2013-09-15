;redcode-94 
;name Geist v0.1
;author Ben Ford
;assert CORESIZE==8000 

odec equ ( -25) 
odif equ (4020) 
ogap equ (  10) 
ohop equ (ogap-odif) 
orgA equ (orgB+odif) 
orgB equ ( 100) 

gate  dat     $   0,   oscn-7 

for 5 
     dat     $   0,  $   0 
rof 

sw    dat     $   1,  $  14 
g2    spl     #gate+100, 14 
     dat     $   0,  $   0 
clear spl     #odec,  >odec 
     mov     *  sw,  >gate 
     mov     *  sw,  >gate 
     djn.f      -2,  }  g2 

for 12 
     dat     $   0,  $   0 
rof 

loop  sub.f   clear,   oscn 
     mov        db,  *oscn     ;bomb at 0.25c 
oscn  sne.i   *orgA,   orgB     ;scan at 0.50c 
     djn.f    loop,  <-2667-22 ;trail   0.25c 
     add.b    oscn,   gate     ;bomb 7 before the hit 
     jmp     clear,  >3000 

for 50-CURLINE-9 
     dat     $   0,  $   0 
rof 

DA  equ    (start+3696+52) 

db    mov      ohop,  $   1 

start 
i for 4 
     mov     {DA-3*start,<2+DA-3*start 
rof 
     djn.f  loop+1, { DA-1 
     jmp    loop+1, { DA-5 

for MAXLENGTH-CURLINE 
     dat     $   0,  $   0 
rof 

end start 
