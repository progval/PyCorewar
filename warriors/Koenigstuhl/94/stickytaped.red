;redcode
;name Sticky taped together 1.2
;author Steve Gunnell
;strategy My own paper and some bits scavenged from Alladins Cave.
;strategy This has gone about as far as it can without major surgery.
;strategy I'm still fiddling with the paper at home.
;assert 1

       org    pgo

pgo    ldp.ab #0,         #0
       ldp.a  #32,        ptab
       jmn.b  pgood,      pgo
       nop.f  }ptab,      }-1000
       stp.ab ptab,       #32
pgood  mod.a  #3,         ptab
ptab   jmp.a  @0,         sboot
       dat.f  0,          split
       dat.f  0,          wboot

sboot  mov.i  (stone+2),  {bptr
       mov.i  (stone+1),  {bptr
       mov.i  stone,      {bptr
bptr   spl.a  4954,       #0
       div.f  bptr,       bptr

sstep  equ    4954
stone  mov    {1601,      1-sstep
       sub.x  #sstep,     -1
       jmp    -2,         }-2

GAP    equ    3563

split  spl    1,          >split-400
       spl    1,          >split-400
       spl    GAP,        0
       mov.i  >-1,        }-1
       mov.i  >-2,        }-2
       spl    0,          }split
       mov    bomb,       <bomb
       jmp    -1,         }split
bomb   dat.f  <1,         bomb-GAP-GAP-GAP-GAP-GAP

wboot  mov.i  (Sweep+9),  {wptr
       mov.i  (Sweep+8),  {wptr
       mov.i  (Sweep+7),  {wptr
       mov.i  (Sweep+6),  {wptr
       mov.i  (Sweep+5),  {wptr
       mov.i  (Sweep+4),  {wptr
       mov.i  (Sweep+3),  {wptr
       mov.i  (Sweep+2),  {wptr
       mov.i  (Sweep+1),  {wptr
       mov.i  Sweep,      {wptr
wptr   spl.a  Sweep+5610, #0
       div.f  wptr,       wptr

Sweep  add    #2671,      #2681           ;one-shot scan
       jmz.f  Sweep,      @Sweep          ;with spl-dat wipe
       jmp    @6,         <Sweep
       dat    #-100,      {Wipe+7-Sweep
       dat    #-100,      {Wipe+7-Sweep
Wipe   spl    #5900,      {Wipe+7-Sweep
       mov    @2,         >Sweep
       mov    @1,         >Sweep
       djn.b  -2,         {Wipe
       jmp    Wipe,       Wipe

       end

