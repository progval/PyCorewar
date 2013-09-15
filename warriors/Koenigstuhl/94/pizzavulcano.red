;redcode-94 test
;name Pizza Vulcano
;author Christian Schmidt
;strategy pwarrior with 4 compounds
;strategy no.1 'Curious Little Program'
;strategy      deadly against coreclears and
;strategy      pwarrior which starts with it
;strategy no.2 'Double D'
;strategy      deadly against heavy stone/imps
;strategy      but also good against clear/imps
;strategy no.3 'paris'
;strategy      against paper, sometimes :-(
;strategy no.4 silk/imps
;strategy      tie if I can't kill 'em
;assert 1

;++++++++++++++++++++++++++++++++++++++++++++
;+                 DoubleD                  +
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
        jmp     clear2+bDist+3,{0

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

sPtr    spl     {200,        >4200
sBomb2  dat     {10,         >4010
sBomb1  spl     #20,         <-100
sLoop   mov     sBomb1,      >sPtr
sNext   mov     sBomb1,      }sPtr
sBack   djn.a   sLoop,       <sBomb1

;++++++++++++++++++++++++++++++++++++++++++++
;+               p-switcher                 +
;++++++++++++++++++++++++++++++++++++++++++++
;28 instr

pStr1   equ     p1       ; CLP
pStr2   equ     dBoot    ; d^2-clear
pStr3   equ     sBomb1   ; ssd-clear
pStr4   equ     pboot    ; silk-imp

pLoc    equ     87       ; p-space location

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

        dat.f   #4,          pStr2
        dat.f   #4,          pStr2
        dat.f   #5,          pStr2
        dat.f   #6,          pStr2
        dat.f   #7,          pStr2
        dat.f   #8,          pStr2
        dat.f   #9,          pStr2

        dat.f   #11,         pStr3
        dat.f   #11,         pStr3
        dat.f   #12,         pStr3
        dat.f   #13,         pStr3
        dat.f   #14,         pStr3
        dat.f   #15,         pStr3

        dat.f   #17,         pStr4
        dat.f   #17,         pStr4
        dat.f   #17,         pStr4

;++++++++++++++++++++++++++++++++++++++++++++
;+                     clp                  +
;++++++++++++++++++++++++++++++++++++++++++++

pescape   equ    (pb+1)
plen      equ    (pescape-p1)
pstep     equ    (5093)

p1        mov    pb       ,@pfence  ; build fences
          mov    pb       ,*pfence
ploop     add    pincr    ,psnare   ; snare opponent
          mov    psnare   ,@psnare
pfence    sne    pb-56    ,pb+26    ; monitor fences
          djn.f  ploop    ,>p1-pstep
pmove     add    preset   ,psnare   ; adjust snare for new base
          mov    pb       ,pescape  ; set copy pointers
pcopy     mov    >pescape ,}pescape ; make copy
          jmn.b  -1       ,pescape  ;
preset    jmp    p1+pstep ,-p1-pstep; jump to new location
psnare    jmp    ptrap-2000,+2000
ptrap     mod.x  #10      ,#1       ; allow only one process
          stp.ab #0       ,#0       ; complete brainwash
          djn.b  -1       ,-1
pincr     mov    1        ,-1       ; opponent dies
pb        dat    pstep+p1-pescape,-plen

;++++++++++++++++++++++++++++++++++++++++++++
;+                 silk/imps                +
;++++++++++++++++++++++++++++++++++++++++++++

impy equ 2667

c1 equ 3855
c2 equ 2355
c3 equ  831
c4 equ 4000

pboot spl  1, >7648
      spl  1, >7356
      spl  1, >7212

      mov <1, {1
      spl paper+c4+8, paper+8

paper spl  @0, >c1
      mov }-1, >-1
      spl  @0, >c2+impy
      mov }-1, >-1
      spl  @0, >c2
      mov }-1, >-1
      mov.i #1, {1
      mov.i #c3, impy

      end     pThink

