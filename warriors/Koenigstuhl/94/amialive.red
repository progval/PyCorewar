;redcode-94
;name Am I alive?
;author Christian Schmidt
;strategy my new p-warrior concept:
;strategy 3 compounds and 4 strategies
;strategy more brainwash-resistant and deadlier
;strategy against other complex p-warriors
;strategy try to tie if nothing helps
;assert 1

gate    equ     (clear-5)
bDist   equ     1850
offset  equ     3

        org     pThink



dBoot   mov     cIns,       cIns+bDist-2
        mov     a,           a+bDist
        mov     b,           b+bDist
        spl     second
i   for 4
        mov     clear+i-1,   clear+i-1+bDist
    rof
        jmp     clear+bDist, {0
second
i   for 4
        mov     clear2+i-1,  clear2+i-1+bDist+offset
    rof
        jmp     clear2+bDist+offset,{0

cIns    spl     #0,          $18
a       dat     <-2666,      <2667
b       dat     <-2666,      <2667
clear   spl     #0,          <gate-2666
        mov     b,           >gate
        mov     b,           >gate
        djn.f   -1,          {gate
clear2  spl     #0,          <gate-2666-offset
        mov     b-3,         >gate-offset
        mov     b-3,         >gate-offset
        djn.f   -1,          {gate-offset

dist    equ     3800;-83
xstep   equ     5379       ; or 5393

scanb   mov    <boot,  <xscan
    for 4
        mov    <boot,  <xscan
    rof
        djn    -4,     #2
boot    jmp    sm+dist, xscan+9

xscan   dat    0,      dist+9
sm      mov    sb,     >xscan
sc      add    #xstep+1, #xstep+1
        jmz.f  sm,     <sc
        slt.b  sc,     #14
        mov.b  sc,     xscan
        jmn    sm,     sc
        jmp    sm,     }sm
sb      spl    #0,     {0

pStr0   equ     sBoot    ; Carbonite++ (m-launched)
pStr1   equ     dBoot    ; Double D
pStr2   equ     scanb    ; RBscanner
pStr3   equ     cBoot    ; The Stormbringer
pLoc    equ     69       ; p-space location

pThink  ldp.a   #0,          pLoss
        ldp.a   #pLoc,       pTable
        add.ba  *pLoss,      pTable
        mod.a   #19,         pTable   
        stp.ab  *pTable,     #pLoc

pTable  jmp.b   @0,          pStr0

        dat.f   #2,          pStr1    
        dat.f   #2,          pStr1
        dat.f   #3,          pStr1
        dat.f   #4,          pStr1
        dat.f   #5,          pStr1
        dat.f   #6,          pStr1
  
        dat.f   #8,          pStr2
        dat.f   #8,          pStr2
        dat.f   #9,          pStr2
        dat.f   #10,         pStr2
        dat.f   #11,         pStr2     
        dat.f   #12,         pStr2      
        dat.f   #13,         pStr2
        dat.f   #14,         pStr2
        dat.f   #15,         pStr2

        dat.f   #17,         pStr3      
        dat.f   #17,         pStr3
        dat.f   #17,         pStr3

cBptr   equ     3002-6
impoff  equ     627
impsize equ     2667

cBoot   spl     pump
sBoot   mov     cBomb,      cSp+cBptr+198
        mov     cSp-1,      cSp+cBptr-1
        mov     cSp,        cSp+cBptr
        mov     cSp+1,      cSp+cBptr+1
        mov     cSp+2,      cSp+cBptr+2
        mov     cSp+3,      cSp+cBptr+3
        spl     pTie+cBptr, {0
        spl     pTie+cBptr, {0
        jmp     pTie+cBptr, {0

pInit   dat.f   #0,         #0
pLoss   dat.f   #0,         #1
pWin    dat.f   #0,         #-1
pTie    spl     #0,         #0

cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0    
        djn.f   -2,         <-1151
cBomb   dat     >-1,        >1

for 11
dat 0, 0
rof

pump    spl     #1,         >prime
prime   mov.i   imp,        impoff-4
        add.f   #impsize+1, ptr
ptr     jmp     pump+impoff-(impsize+1), >-200
imp     mov.i   #impsize,   *0

