 ;redcode-94
 ;name myBlur2
 ;author Paulsson
 ;strategy airBag technologies inc.
 ;strategy Improved by David Moore
 ;assert CORESIZE > 1
 
 org start
 STEP    equ     7710
 N1      equ     4100
 N2      equ     2
 N3      equ     1
 N4      equ     ((STEP*4)-29)
 
 st      equ     STEP
 gap     equ     (5*N3)
 
 check   equ     (ptr-(st*2)-N2)
 
 gate    dat.f   0,N1
         dat.f   0,0
         dat.f   0,0
         dat.f   0,0
         dat.f   0,0
 
 target  mov.b   ptr,}check
 next    add.f   step,ptr
 ptr     seq.i   st*2+gap,st*2
         jmn.b   target,{check
 hit     mov.i   {check,>check
         jmn.b   next,}check
 
 step    spl     #st,st
 cc      mov.i   ccb,>gate
         djn.f   cc,>gate
 ccb     dat.f   0,4-gate
 
 for 75
         dat.f   0,0
 rof
 
 tempptr spl     #1,N4
 
 decoy   equ     6012
 
 start   spl     boot2,}decoy
         spl     3,{decoy
         spl     1,<decoy
         jmp     }bptr,<ptr-(st*2)  ; important!
         spl     1,>decoy-1
         jmp     >bptr,{ptr-(st*2)+gap  ; extra redundancy
 boot2   mov     tempptr,check
         spl     }bptr,}bptr
 bptr    sub.f   #next+1,#next+0
 
 end
 
