;redcode-94
;name Digitalis 4
;author Christian Schmidt
;strategy q^2 -> clear/imp
;assert 1

        org     start

QS      EQU (0-200)
QD      EQU 100
QB      EQU (start-350)
CR      EQU (fnd-which)
datz    EQU (table-3)
GAP     equ     8
REP     equ     15
ist     equ     1143
bptr1   equ     1800

qinc    dat     >(-1)*GAP*2, >GAP

        dat     9*QS,  1*QS     
table:  dat     5*QS,  2*QS    
        dat    13*QS, 17*QS      

P:      add.f  table,table  
slow:   add.ab *P,fnd           
fast:   add.b  @P,@-1           

which:  sne.i  datz,@fnd 
        add.ab #QD,fnd

        add.ba  fnd,         fnd
qbo     mov.i   qinc,        @fnd
        mov.i   qinc,        *fnd
fnd     mov.i   (-1)*(GAP/2),@QB
        sub.x   qinc,        fnd
        djn.b   qbo,         #REP
        jmp     boot,        }-300

start:
        seq.i  QB+QS*0,QB+QS*0+QD
        jmp    which, 0                

        seq.i  QB+QS*2,QB+QS*2+QD
        jmp    fast, 0                 
        seq.i  QB+QS*1,QB+QS*1+QD
        jmp    fast, <P                
        seq.i  QB+QS*17,QB+QS*17+QD
        jmp    fast, >P                

        seq.i  QB+QS*7,QB+QS*7+QD
        jmp    slow, 0                 
        seq.i  QB+QS*6,QB+QS*6+QD
        jmp    slow, <P                
        seq.i  QB+QS*22,QB+QS*22+QD
        jmp    slow, >P                
        seq.i  QB+QS*11,QB+QS*11+QD
        jmp    slow, {P                
        seq.i  QB+QS*15,QB+QS*15+QD
        jmp    slow, }P                
        seq.i  QB+QS*10,QB+QS*10+QD
        djn.f  slow, P                 

        seq.i  QB+QS*5,QB+QS*5+QD
        jmp    >fast, 0                 
        seq.i  QB+QS*9,QB+QS*9+QD
        jmp    >fast, {P                
        seq.i  QB+QS*13,QB+QS*13+QD
        jmp    >fast, }P                

        seq.i  QB+QS*14,QB+QS*14+QD
        jmp    P, 0                     
        seq.i  QB+QS*8,QB+QS*8+QD
        jmp    P, <P                    
        seq.i  QB+QS*12,QB+QS*12+QD
        jmp    P, {P                    
        seq.i  QB+QS*32,QB+QS*32+QD
        jmp    P, }P                    
        seq.i  QB+QS*20,QB+QS*20+QD
        djn.f  P, P                     

        seq.i  QB+QS*4,QB+QS*4+QD
        jmp    }slow, 0                 
        seq.i  QB+QS*3,QB+QS*3+QD                  
        jmp    }slow, {P                
        seq.i  QB+QS*19,QB+QS*19+QD
        jmp    }slow, }P                
        seq.i  QB+QS*18,QB+QS*18+QD
        djn.f  <fast, P                
         
        seq.i  QB+QS*36+CR,QB+QS*36+QD+CR   
        jmp    }fast, 0                 

boot     spl    istart

         mov    ptr,         bptr1
         mov    clrb,        bptr1
boot2    mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3
         mov    {bptr3,      <bptr3
         jmp    @bptr3,      <-1000

istart   spl    1
         spl    1
         spl    1
         spl    1
         spl    1
         spl    2
         djn.f  imp,         <-250
         add    bst,         -1
         djn.f  @bptr3,      <-400

bst      dat    ist,         -100

imp      mov.i  #ist,        *0

ptr      dat    0,           2150
clrb     dat    >2667,       25
clear    spl    #0,          >ptr-16
loop     mov    clrb-16,     >ptr-16
cc       djn.f  loop,        >ptr-16
bptr3    dat    cc+1,        boot2+bptr1+19
