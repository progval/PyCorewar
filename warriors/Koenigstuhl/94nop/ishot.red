;redcode-94nop
;name iShot
;author Christian Schmidt
;assert CORESIZE == 8000
;strategy oneshot with imps

ist       equ    1143
decoy     equ    (start+1-1201)

          org    dstart

gate      dat    0,       2155
          dat    0,       0
          dat    0,       0
start     spl    clear+1,  <-200
          add    #10,      gate
          jmz.f  -1,      @gate
          spl    pump,    <-200
clear     spl    #4000,   {gate
          mov    bomb,    >gate
          djn.f  -1,      >gate
          jmp    -3
          dat    {5335,   32
bomb      dat    {5335,   32
    for   10
          dat    0,       0
    rof
pump      spl    1,       <1
          jmn    -1,      #1+2+4+8
          spl    2
          djn.f  imp,     <-250
          add    bst,     -1
          djn.f  clear,   <-400
bst       dat    ist,     -100
imp       mov.i  #ist,    *0
    for   63
          dat    0,       0
    rof
dstart    mov    <decoy+0,{decoy+2
          mov    <decoy+3,{decoy+5
          mov    <decoy+6,{decoy+8
          mov    <decoy+10,{decoy+22
          mov    <decoy+23,{decoy+25
          djn.f  start  ,<decoy+28


