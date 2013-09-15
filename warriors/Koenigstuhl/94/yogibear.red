;redcode-94
;name Yogi Bear
;author P.Kline
;assert CORESIZE == 8000
;strategy table-based switcher (smarter than the average bear :-)
;strategy improved Emerald, one-shot, qscan alert
;strategy more bug fixes

ptable      ;      AfterTie  ,  AfterWin

p1ST1     dat    p1ST1-ptable,p1ST1-ptable
p1WT1     dat    p1WT1-ptable,p1WT1-ptable
p1ST2     dat    p1ST1-ptable,p1ST1-ptable
p1WT2     dat    p1WT1-ptable,p1WT1-ptable
ptable2
p2ST1     dat    p2ST1-ptable,p2WT1-ptable
p2WT1     dat    p2WT1-ptable,p2ST1-ptable
p2ST2     dat    p2ST1-ptable,p2WT1-ptable
p2WT2     dat    p2WT1-ptable,p2ST1-ptable
ptable3
p3QK1     dat    p3QK1-ptable,p3QK1-ptable
          dat    p3QK1-ptable,p3QK1-ptable

pstuff    ldp.ab #0,#0                   ; result of the last round
pflag     ldp.ab #1    ,ptable           ; last strategy
          jmn    pwintie,pstuff          ; did we lose?
          add    #1  ,ptable             ;   yes - bump the pointer
          jmp    pcommit
pwintie   sne    #2  ,pstuff             ;   no  - use the table
          mov.ab @ptable,@ptable
          mov.b  @ptable,ptable
pcommit   mod    #pstuff-ptable ,ptable  ; brainwash protection
          stp.ba ptable,pflag            ; save the current strategy
          slt    ptable,#p3QK1-ptable    ; are we selecting stone?
          jmp    slQuick                 ;   yes
          mov.ba ptable,ptable           ;   no
          mod.a  #2,ptable               ; select stone-imp or one-shot
          jmz.a  slStone,ptable

wBoot     equ    250
wStep     equ    11
slWither  stp.a  #p3QK1-ptable-1,pflag   ; set pointer to stone
          mov    wGate,wGate+wBoot       ; boot the one-shot
          mov    <btWither,{btWither
          mov    <btWither,{btWither
          mov    <btWither,{btWither
          mov    <btWither,{btWither
          djn    -4,#4
          stp.ba ptable,pflag            ; reset pointer to one-shot
          jmp    wNext+1+wBoot
btWither  dat    wEnd+wBoot,wEnd
wGate     dat    wWipe+wStep*3,wWipe+wStep*2
slQuick   mov    <quBoot,{quBoot         ; stone launch
          mov    <quBoot,{quBoot         ; imbedded in one-shot code
          mov    <quBoot,{quBoot         ; to save space
          mov    <quBoot,{quBoot
          mov    <quBoot,{quBoot
quBoot    jmp    Stone+5+2810,Stone+5
      for 3
          dat    0,0
      rof
          dat    0,5+wEnd-wGate
          dat    0,5+wEnd-wGate
wWipe     spl    #5500,#5+wEnd-wGate     ; one-shot forward spl-dat wiper
          mov    @2,>wGate
          mov    @1,>wGate
          djn.b  -2,{wWipe
          dat    0,0
          dat    0,0
wNext     sub    wScan  ,wGate           ; one-shot 80% scanner
          sne    *wGate ,@wGate
          sub    wScan  ,wGate
          seq    }wGate ,>wGate
wScan     sne.x  *wGate ,@wGate          ; ignore single bombs
          djn.f  wNext ,<-2001
          spl    wWipe ,<wGate
          djn.f  #0    ,<wGate-2667      ; backup damaged wiper :-)
wEnd      dat    0,0
       for 9
           dat    0,0
       rof
boot      equ    4602
impnum    equ    2667
hSpace    equ    (0-334)
imp2      mov.i  #impnum,*0
          dat    0,}imp2-imp2*impnum
          dat    0,}imp2-imp2*impnum
          dat    0,}imp2-imp2*impnum
          dat    0,}imp2-imp2*impnum
slStone   spl    1,}imp2-imp2*impnum      ; stone-imp launch
          spl    1,}imp2-imp2*impnum
          spl    1,}imp2-imp2*impnum
          mov    <btStone,{btStone
          mov    <btHide,{btHide
          spl    @imp2,}0
          djn    *btStone,#1
btHide    jmp    Stone+boot+hSpace+8,hide1+8
btStone   dat    Stone+8+boot,Stone+8
Stone     spl    #28,>-28                 ; stone
          mov    -2,<-111
          add    Stone,1
          mov    >0,-2
          djn.f  -2,<6500
          dat    0,0
          dat    0,0
          dat    0,0
gate      equ    (hide1-19)
hide1     spl    #0   ,<gate-5334         ; fast forward clear backs up stone
          mov    hbomb,>gate
          djn.f  -1   ,>gate
          dat    0,0
hbomb     dat    <2667,2-gate
          end    pstuff

