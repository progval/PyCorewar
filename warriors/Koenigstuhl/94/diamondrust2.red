;redcode-94
;name Diamonds and Rust v2
;author Christian Schmidt
;strategy switching stone, scanner, d-clear and ssd-clear
;assert 1

;++++++++++++++++++++++++++++++++++++++++++++
;+                d^2-clear                 +
;++++++++++++++++++++++++++++++++++++++++++++
;24 instr

gate    equ     (clear-5)
bDist   equ     1800

dBoot   mov     cIns,       cIns+bDist-2
        mov     a,           a+bDist
        mov     b,           b+bDist
i   for 4
        mov     clear+i-1,   clear+i-1+bDist
        mov     clear2+i-1,  clear2+i-1+bDist+3
    rof
        spl     clear+bDist, {0
        jmp     clear2+bDist,{0

cIns    spl     #0,          $18
a       dat     <-2666,      <2667
b       dat     <-2666,      <2667
clear   spl     #0,          <gate-2666
        mov     b,           >gate
        mov     b,           >gate
        djn.f   -1,          {gate
clear2  spl     #0,          <gate-2667-3
        mov     b-3,         >gate-3
        mov     b-3,         >gate-3
        djn.f   -1,          {gate-3

;++++++++++++++++++++++++++++++++++++++++++++
;+           spl/spl/dat-clear              +
;++++++++++++++++++++++++++++++++++++++++++++
;13 instr

sBptr   equ     1850

sBoot   mov     sPtr,        sPtr+sBptr
        mov     sBomb2,      sBomb2+sBptr
        mov     sBomb1,      sBomb1+sBptr
        mov     sLoop,       sLoop+sBptr
        mov     sNext,       sNext+sBptr
        mov     sBack,       sBack+sBptr
        jmp     sBomb1+sBptr,{0

sPtr    spl     {200,        >4200
sBomb2  dat     {10,         >4010
sBomb1  spl     #20,         <-100        
sLoop   mov     sBomb1,      >sPtr
sNext   mov     sBomb1,      }sPtr
sBack   djn.a   sLoop,       <sBomb1

;++++++++++++++++++++++++++++++++++++++++++++
;+                mini-HSA                  +
;++++++++++++++++++++++++++++++++++++++++++++
;23 instr

hStep   equ     8
hPtr    equ     (hBomb-5)
hBptr   equ     1000
hCnt    equ     15

hBomb   spl     #1,          {1
hKill   mov     hBomb,       <hPtr
hMptr   mov     >hPtr,       >hPtr
        jmn.f   hKill,       >hPtr
hAd     add     #hStep+1,    @hMptr
hScan   jmz.f   hAd,         <hPtr
        slt     @hMptr,      #hBtm-hPtr+3
        djn     hKill,       @hMptr
        djn     hAd,         #hCnt
hBtm    jmp     hAd,         {hKill

hBoot   mov     hBtm,        @hDest
N   for 8
        mov     hBtm-N,      <hDest
    rof
        spl     @hDest,       1
hDest   mov     #250,        @hBptr
        mov     hBomb,       <hDest
        div.f   #0,          hDest

;++++++++++++++++++++++++++++++++++++++++++++
;+               p-switcher                 +
;++++++++++++++++++++++++++++++++++++++++++++
;28 instr

pStr1   equ     cBoot    ; Carbonite
pStr2   equ     dBoot    ; d^2-clear
pStr3   equ     hBoot    ; mini-HSA
pStr4   equ     sBoot    ; ssd-clear
pLoc    equ     3987     ; p-space location

pInit   dat.f   #0,          #0
pLoss   dat.f   #0,          #1
pWin    dat.f   #0,          #-1
pTie    dat.f   #0,          #0

pThink  ldp.a   #0,          pLoss
        ldp.a   #pLoc,       pTable
        add.ba  *pLoss,      pTable
        mod.a   #19,         pTable   
        stp.ab  *pTable,     #pLoc

pTable  jmp.b   @0,          pStr1  

        dat.f   #1,          pStr1    
        dat.f   #2,          pStr1
        dat.f   #3,          pStr1
        dat.f   #4,          pStr1

        dat.f   #6,          pStr2      
        dat.f   #6,          pStr2     
        dat.f   #7,          pStr2
        dat.f   #8,          pStr2
        dat.f   #9,          pStr2
        dat.f   #10,         pStr2

        dat.f   #12,         pStr3      
        dat.f   #12,         pStr3      
        dat.f   #13,         pStr3
        dat.f   #14,         pStr3
        dat.f   #15,         pStr3

        dat.f   #17,         pStr4      
        dat.f   #17,         pStr4
        dat.f   #17,         pStr4      

;++++++++++++++++++++++++++++++++++++++++++++
;+                Carbonite                 +
;++++++++++++++++++++++++++++++++++++++++++++
;11 instr

cBptr   equ     (-1500)

cBomb   dat     >-1,         >1
cBoot   mov     cBomb,      cSp+cBptr+198
        mov     cSp,        cSp+cBptr
        mov     cSp+1,      cSp+cBptr+1
        mov     cSp+2,      cSp+cBptr+2
        mov     cSp+3,      cSp+cBptr+3
        jmp     cSp+cBptr,  {0

cSp     spl     #0,         <-1151+3
        mov     197,        cAd-(197*3500)
cAd     add.ab  {0,         }0    
        djn.f   -2,         <-1151

        end     pThink

