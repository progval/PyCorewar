;redcode-94
;name Woozily Higgle
;author Christian Schmidt
;strategy Claw & Paperazor
;assert 1

sStep	  equ    2987
sDist     equ    12
sStart    equ    (sScan+(sStep*10))
tDecoy    equ    (sScan-1195)

          sub    sAdd,     sScan
sScan	  seq    sStart,   sStart+sDist
	  slt.ab #40,      sScan
sBack	  djn    -3,       #1700
sLen	  mov    #8,       #0
	  mov    sScan,    sScan-3
	  mov    sBomb,    }sScan-3
	  mov    sBomb,    >sScan-3
	  djn    -2,       sLen
	  jmn.b  sBack,    sBack
	  add.a  #(8001/21)+1,cBomb
	  mov    @-1,      {cBomb
	  jmp     -2,      0
cBomb	  spl    #1,       #4
sAdd	  dat    -sStep,   -sStep
sBomb	  spl    -1,       0

      for 50
          dat    0,        0
      rof

tstep1  equ    2509
cstep1  equ    260
nstep1  equ    4679
bstep1  equ    3219

paper   spl    1,       <d
        spl    1,       }d+3
        spl    1,       <d+1

        mov    {pEnd,   {pBo2
pBo2    spl    pEnd+4000,{2345

cp      spl    @0,      <tstep1
        mov.i  }cp,     >cp
nothA   spl    @nothA,  <cstep1
        mov.i  }nothA,  >nothA
nothB   spl    @nothB,  <nstep1
        mov.i  }nothB,  >nothB
bomb    mov.i  #1,      <1
cc      djn    -2,      <bstep1
pEnd    dat    0,       0

switch  ldp.ba what,    what
        mod.a  #3,      what
        ldp.ab #0,      switch
        add.a  @switch, what
        stp.ab *what,   what
what    jmp    @0,      scan
        dat    1,       scan
        dat    0,       scan
        dat    1,       scan
        dat    1,       scan
        dat    2,       paper
        dat    0,       scan
        dat    1,       scan

d       equ   (sScan-1+7315)

scan    nop    >d,      }d+2
        mov    {d+3,    {d+7
        mov    <d+1,    <d+5
        djn.f  sScan,   {d+9

        end    switch

