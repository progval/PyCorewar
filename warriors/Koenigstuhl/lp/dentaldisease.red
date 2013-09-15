;redcode-lp
;name Dental Disease
;author Christian Schmidt
;strategy p^3-warrior
;strategy switch : non-standard switching pattern
;strategy scanner: similar to LP-Scan v0.1
;strategy          but with different constants
;strategy stone  : a triple of self-modifying
;strategy          3-line dwarfs
;strategy anti-cc: based on CLP but optimized
;strategy          for the LP hill
;strategy s/p    : copy of Roskilde
;assert 1

;------stone/paper--------------------

siAwa1   equ   6897 
siAwa2   equ   2842
siAwa3   equ   4582
siStep   equ   1564
siStep2  equ   383

piStep1  equ   2990
piStep2  equ   1719

pa1     mov     #6,             #6
pGo     mov     <pa1,            <j1
        jmn     -1,             @-2
        spl     @pa1,            <piStep2
j1      jmz.b   @0,             piStep1
b1      dat     {1,             <1

xGo     spl     pGo,            0
        spl     2,              0
        spl     1,              0

        mov     <s1,            {s1
        mov     <s2,            {s2
        mov     <s3,            {s3
        jmp     *s1,            }0

s1      dat     p1+siAwa1,       sEnd+1
s2      dat     p1+siAwa2,       sEnd+1
s3      dat     p1+siAwa3,       sEnd+1

        mov     <siStep2 ,       1+siStep
        sub     1,              -1
sEnd    jmp     -2,             <-siStep

;-------triple of self-modifying dwarfs-------

dAwa1   equ     2005
dAwa2   equ     5547
dAwa3   equ     3870
dStep   equ     7739
dOff    equ     3792

dDist   equ 4213

dGo     spl     1,              0
        mov.i   {0,             #0
        mov     <dBoot1,        {dBoot1
        mov     <dBoot2,        {dBoot2
        mov     <dBoot3,        {dBoot3
        jmp     *dBoot1,        }0

dBoot1  dat     dGo+dAwa1+dDist,      dDwarf+3
dBoot2  dat     dGo+dAwa2+dDist,      dDwarf+3
dBoot3  dat     dGo+dAwa3+dDist,      dDwarf+3

dDwarf  mov     {dOff,          1-dStep   
        sub.x   #dStep,         dDwarf
        jmp     dDwarf,         }dDwarf

;-------scanner-------------------------------

sStep   equ     2487
sDecr   equ     4176
sAwa    equ     3405

sBoo    mov    sBmb+1,          think+sAwa
   for  6
        mov    {sBoo,           <sBoo
   rof
        jmp    @sBoo
       
sPtr    add     #sStep,          #sBmb+sStep
sGo     jmz.f   sPtr,           @sPtr
        slt     sPtr,           #5
        mov     *sBmb,          @sPtr
        jmp     sPtr,           <sDecr
sBmb    dat     1,              1
        jmp     #2,             <2667

;-------p-switcher-----------------------------------

w0    equ slDodger    ;stone
w1    equ dGo    ;scanner
w2    equ sBoo    ;o-shot
w3    equ xGo    ;paper 
STORE equ  123

think   ldp.a #0, in
    ldp.a #STORE, table
    mod.ba *in, table
    stp.b *table, #STORE
                  ;St L W T
table jmp }0, 441   ; 1 0 1 891 ;0  1 0 0 ;initial
      dat w0, 792    ;2 0 2 243 ;1  3 0 1   
      dat w1, 893 ;2  3 2 2   
      dat w1, 344 ;3  4 2 3   
      dat w1, 785   ; 5 2 4 246 ;4  6 3 4
      dat w2, 896 ;5  6 5 5
      dat w2, 347 ;6  7 5 6
      dat w2, 689   ; 9 5 7 249;;7  9 6 7
      dat w3, 899 ;8  9 8 8
      dat w3,1241 ;9  1 8 9

      dat w3, 349 ;   9 7 8 ;unreachable
in    dat 0, 10  
pboot spl 2,  9
      spl 2, 11

;-------CLP-----------------------------------

cAwa      equ   135
pstep     equ   2234
pescape   equ    (pb+1)
plen      equ    (pescape-p1)
pdriv     equ   1142 

slDodger  mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -3,#6
btDodger  jmp    pescape+cAwa,pescape+1

p1        mov    pb       ,@pfence 
          mov    pb       ,*pfence
ploop     add    pincr    ,psnare  
          mov    psnare   ,@psnare
pfence    sne    pb-71    ,pb+33    
          djn.f  ploop    ,>p1-pstep
pmove     add    preset   ,psnare   
          mov    pb       ,pescape  
pcopy     mov    >pescape ,}pescape 
          jmn.b  -1       ,pescape  
preset    jmp    p1+pstep ,-p1-pstep
psnare    jmp    ptrap-pdriv,+pdriv
ptrap     mod.x  #10      ,#1       
          stp.ab #0       ,#0      
          djn.b  -1       ,-1
pincr     mov    1        ,-1      
pb        dat    pstep+p1-pescape,-plen

end think

