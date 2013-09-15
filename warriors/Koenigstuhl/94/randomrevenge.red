;redcode-94
;name RandomRevenge
;author Roy van Rijn
;strategy Pswicher with oneshot+solo+revenge
;strategy Paper good in large and small coresizes
;strategy Oneshot is good against the papers I expect
;strategy Solo is an all killer in coresizes between 2000<>6000
;assert 1

;constants for the coreclear paper
nstep1 equ 1319
cstep1 equ 1871
tstep1 equ 1471

pAw1   equ 6000
pAw2   equ 2000

pGo   spl    1,    <pGo+1169
      spl    1,    <pGo+1217
      spl    1,    <pGo+1482

      mov    {cp,    {pBo1
pBo1  spl    pEnd+pAw1,{2093

      mov    {pEnd,    {pBo2
pBo2  jmp    pEnd+pAw2,{2093

cp    spl    @pEnd,  <tstep1
      mov.i  }cp,    >cp
nothA spl    @nothA, <cstep1
      mov.i  }nothA, >nothA
nothB spl    @nothB, <nstep1
      mov.i  }nothB, >nothB
bomb  mov.i  #1,     <1
cc    djn    -2,     <2335
pEnd  dat    0,      0

tPtr      dat    100 ,4100-4
tGate     dat    0,0
          dat    0,0
          dat    0,0
          dat    0,0
          dat    0,0

tWipe     mov    tSpl     ,<tPtr
          mov    >tPtr    ,>tPtr
          jmn.f  tWipe    ,>tPtr

tScan     sub.x  #-12     ,tPtr
          sne.x  *tPtr    ,@tPtr
          sub.x  *pScan   ,@tScan
          jmn.f  tSelf    ,@tPtr
          jmz.f  tScan    ,*tPtr
pScan     mov.x  @tScan   ,@tScan
tSelf     slt.b  @tScan   ,#tEnd+4-tPtr
          djn    tWipe    ,@tScan
          djn    *pScan   ,#12
tSpl      spl    #0       ,{0
tClr      mov    tEnd     ,>tGate
          djn.f  tClr     ,{tGate
tEnd      dat    >1       ,2-tGate

      for 12
          dat 0,0
      rof

tDecoy    equ    (tWipe+1-219)
tStart    mov    <tDecoy+0,{tDecoy+2
          mov    <tDecoy+3,{tDecoy+5
          mov    <tDecoy+6,{tDecoy+8
          djn.f  tScan+1  ,<tDecoy+10
for 10
dat 0,0
rof

        RESULT  equ 0
        STATE   equ #7
think
str     ldp.a   STATE,  jump
res     ldp.a   RESULT, calc

calc    sne     #0,     #1
        jmp     jump
j_mp    add.a   #1,     jump
        mod.a   #3,     2
        stp.ab  1,     STATE
jump    jmp     @0,     tStart
        dat     0,      pGo
        dat     0,      sOne

      for 10
          dat 0,0
      rof
sOff    equ     (21*sStep-1)
sStep   equ     10
sDelet  equ     205

sOne    add.f   sAdd,        sPtr
        sne.i   *sPtr,       @sPtr
        djn.f   sOne,        @sPtr
        djn.f   sBomb,       *sPtr
        dat     0,           0
sAdd    dat.f   sStep,       sStep
sPtr    spl     {sOff,       >3910+sOff-sDelet
        dat     0,           0
        dat     0,           0
        dat     0,           0
        dat     0,           0
        dat     >3920-sDelet,{10
sBomb   spl     #20,         <-100
sLoop   mov     sBomb,       >sPtr
        mov     sBomb,       }sPtr
sBack   djn.a   sLoop,       <sBomb

end think


