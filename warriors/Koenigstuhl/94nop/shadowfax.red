;redcode-94nop
;name Shadowfax
;author Roy van Rijn
;strategy Just a save paper, can't enter a tournament without them!
;strategy And Shadowfax is the name of Gandalf's Horse :-)
;assert 1

org pGo

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

