;redcode
;name H-Bomb 9
;author Josh Yeager
;strategy Two multipass cc's running in parallel pspaced with paper.
;assert 1

_STRATEGY	equ	2
_RESULT	equ	0
_SCORE		equ	1
dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   
range   equ     933     

start   ldp.ab _STRATEGY, check
        jmz.b switch, check
check   mod.ab #97, #0000  
        jmn.b paper, check 
        ldp.a _RESULT, keeper
        ldp.ab _SCORE, adjust
keeper  jmp @0, adjust+1   
        jmp 0, adjust     
        jmp 0, adjust+2         
adjust  add.ab #6, #0          
        add.ab #-2, adjust     
        add.ab #-1, adjust     
        ldp.a _STRATEGY, select
        slt.b adjust, #7000    
        jmp switch
return  stp.b adjust, _SCORE
        mod.a #3, select
select  jmp @0, cc
        jmp 0, paper
switch  add.a #97, select
        stp.ab select, _STRATEGY
        mov.ab #10, adjust
        jmp return

cc	spl fwrd,<1337
	jmp bwrd,<2667
ptr1  dat a1, ed+100+200
a4    dat 0,  ed+2+1+200
a3    dat 1,  ed+2+2+200
a2    spl #2, ed+2+3+200
a1    spl #3, ed+2+4+200
bwrd  mov *ptr1, >ptr1  
      mov *ptr1, >ptr1  
      mov *ptr1, >ptr1 
ed   djn.f -3,   <4000 
                       
fwrd  mov *ptr2, <ptr2
      mov *ptr2, <ptr2
      mov *ptr2, <ptr2
ed2  djn.f -3,   <4000 
a42   dat 0,   ed2+2+1-200
a32   dat -4,  ed2+2+2-200
a22   spl #-3, ed2+2+3-200 
a12   spl #-2, ed2+2+4-200 
ptr2  dat -1,  ed2+100-200

for 15
        DAT.F   $0,     $0
rof

paper
	spl     1,      <300   
	spl     1,      <400   
	spl     1,      <500   

silk    spl     @0,     {dest0
	mov.i   }-1,    >-1 
silk1   spl     @0,     <dest1  
	mov.i   }-1,    >-1     
	mov.i   bomba,  }range
	mov     {silk1, <silk2
silk2   jmp     @0,     >dest2
bomba   dat     <2667,  <1

