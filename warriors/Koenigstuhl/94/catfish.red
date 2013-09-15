;redcode
;name Catfish
;author Steve Gunnell
;strategy A mix of components: a Oneshot/spl/dat clear from Alladins
;strategy Cave, a sdd coreclear from Recycled Bits, a D-Clear, and
;strategy the paper from Benj's Revenge. And my own p-switcher.
;strategy I'm not sure why the oneshot works. It just does OK?
;assert CORESIZE == 8000

Sweep     add    #2671   ,#2681           ;one-shot scan
          jmz.f  Sweep   ,@Sweep          ;with spl-dat wipe
          jmp    @6      ,<Sweep
          dat    #-100   ,{swWipe+7-Sweep
          dat    #-100   ,{swWipe+7-Sweep
swWipe    spl    #5900   ,{swWipe+7-Sweep
          mov    @2      ,>Sweep
          mov    @1      ,>Sweep
          djn.b  -2      ,{swWipe
          jmp    swWipe  ,swWipe


; fighting 3 point imps and stones which bomb with core (i.e. MOV <a, b)

wtop  dat   #1,   #200
      dat   #1,   #1
      dat   #1,   #1

wipe  spl   #-1,  wend-wtop
      mov *wend, >wtop
      mov *wend, >wtop
      djn.f  -1, {wtop
      jmp    -2, <wtop-2667

      dat    #0,  wend-wtop-1
      dat <5334, <2667         ; 2nd pass
      spl   #-2,  wend-wtop    ; 1st pass bomb
wend  spl #wipe,  wend-wtop


len     equ    9
fcp     equ    3039
scp     equ    2365
tcp     equ    777

boot    spl    1,     >-3000
        spl    1,     >-3200
        mov    -1,    0
frog    spl    @0,    <fcp-len
        mov    }-1,   >-1
        mov    }-2,   >-2
        spl    @0,    <scp
        mov    }-1,   >-1
        spl    @0,    <tcp
        mov    }-1,   >-1
        mov    2,     <-fcp+len+1
        jmp    -1,    <-10
        dat    <2667, <2667*2

shift           equ -3000

ptr             dat 0,#400
                dat 1,1
                dat 1,1
dcl2            spl #0,>ptr
loop            mov.i bomb,>ptr
                djn.f loop,>ptr
                dat 1,1
                dat 1,1
bomb            dat >1,>bomb-ptr+2


pkey    equ  129
length  equ    9
states  equ    5

think  ldp.a  #0,         think
load   ldp.a  #pkey,      load
       mod.a  #states,    load
       add.a  think,      load
       add.a  load,       state
store  stp.ab *state,     #pkey
state  jmp.a  @table-state, 0
       dat    4,          w0
table  dat    3,          w2
       dat    0,          w3
       dat    4,          w0
       dat    0,          w3
       dat    3,          w2
       dat    4,          w0
       dat    7,          w1
       dat    3,          w2
       dat    7,          w1
       dat    4,          w0

w0     equ    Sweep
w1     equ    wipe
w2     equ    boot
w3     equ    dcl2

end think

