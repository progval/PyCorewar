;redcode-94  verbose        
;name Five-Finger ... v.069
;     Five-Finger Discount From the Local Hardware Store v .069
;author Ryan Coleman
;strategy p-warrior using paper and scissors
;assert 1

org res

        _RES    equ 0           
        _STR    equ 1           
dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   
range   equ     933     
CDIST   equ 12
IVAL    equ 42
FIRST   equ scan+OFFSET+IVAL
OFFSET  equ (2*IVAL)
DJNOFF  equ -431
BOMBLEN equ CDIST+2

res     ldp.ab  _RES,   #0      
str     ldp.a   _STR,   str1    
        sne.ab  #0,     res     
lost    add.a   #1,     str1    
        mod.a   #2,     str1       
win     stp.ab  str1,   _STR    
str1    jmp     @0,     paper
        dat     0,      comp

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

scan    sub.f  incr,comp
comp    cmp.i  FIRST,FIRST-CDIST        ;larger number is A
        slt.a  #incr-comp+BOMBLEN,comp  ;compare to A-number
        djn.f  scan,<FIRST+DJNOFF       ;decrement A- and B-number
        mov.ab #BOMBLEN,count
split   mov.i  bomb,>comp               ;post-increment
count   djn.b  split,#0
        sub.ab #BOMBLEN,comp
        jmn.b  scan,scan
bomb    spl.a  0,0
        mov.i  incr,<count
incr    dat.f  <0-IVAL,<0-IVAL

