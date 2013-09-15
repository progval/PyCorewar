;redcode-94
;name Scanitator Pro
;author Christian Schmidt
;strategy q^2 -> p-switching
;strategy - non-suicidal brainwashing paper (Dare)
;strategy - mod-2 superdwarf (Turbo Carbonite)
;assert 1

;The next (and last?) version of my first successful warrior.
;The q^2-scanner is from obviouse... but with a tornado-style 
;bombing run.
;The pswitcher has three states. Two for the paper and one for
;the stone. It works much better than with only two states.
;The paper is from ‘unrequited love’ but with an additional
;brainwash. It confuses all those nasty p^2-warrior, while the
;self-brainwash seems not to be a handycap. I have also in mind 
;that it scores due to the additional brainwash slightly
;better against imp/stones. Believe me or not.
;The stone is launched similar to that one in ‘Alien’. I’m not 
;shure if it really scores better but it looks nice :-)

;++++++++++++++++++++++++++++++++++++++++++++
;+              q^2-scanner                 +
;++++++++++++++++++++++++++++++++++++++++++++

QS      EQU (0-200)
QD      EQU 100
QB      EQU (start-400)
CR      EQU (fnd-which)
datz    EQU (table-3)
GAP     equ     8
REP     equ     15

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
        jmp     pThink,      }-300

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

;++++++++++++++++++++++++++++++++++++++++++++
;+               p-switcher                 +
;++++++++++++++++++++++++++++++++++++++++++++

pRes    equ     #0
pCell   equ     #3987

pThink  ldp.ab  pRes,      #0
str     ldp.a   pCell,     pStr
    	  sne.ab  #0,        pThink     
lost    nop     >-2000,    }pStr    
	  mod.a   #3,        pStr    
win     stp.ab  pStr,      pCell
pStr    jmp     @0,        rStart
        dat     0,         rStart
	  dat     0,         cBoot

;++++++++++++++++++++++++++++++++++++++++++++
;+                Carbonite                 +
;++++++++++++++++++++++++++++++++++++++++++++

cBptr   equ     (-1500)

cBoot   mov     cBomb,      cSp+cBptr+198
        mov     cSp,        cSp+cBptr
        mov     cSp+1,      cSp+cBptr+1
        mov     cSp+2,      cSp+cBptr+2
        mov     cSp+3,      cSp+cBptr+3
        spl     cSp+cBptr,  <-1000
        spl     1,          <-2000
        spl     1,          <-3000
        spl     1,          <-4000
        djn     cSp+cBptr,  <-5000

cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0    
        djn.f   -2,         <-1151
cBomb   dat     >-1,         >1

;++++++++++++++++++++++++++++++++++++++++++++
;+                   Dare                   +
;++++++++++++++++++++++++++++++++++++++++++++

rDest0   equ    7889
rDest1   equ    3602
rDest2   equ    4095
rRange   equ    1253
  
rStart   spl    1,          <-3000
         mov    2,          0
         mov    1,          0
         spl    1,          <-4000
  
rCell    spl    @0,         {rDest0
         mov.i  }-1,        >-1
rCell1   spl    @0,         <rDest1
         mov.i  }-1,        >-1
         mov    rBomb,      }rRange
         mov    {rCell1,    <rCell2
rCell2   jmp    @0,         >rDest2
         stp.ab #0,         #0
         spl    -1,         >-1
rBomb    dat    <2667,      <5334

        end     start

