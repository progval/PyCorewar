;redcode-lp
;name Beanbag
;author P.Kline
;assert CORESIZE == 8000
;strategy p-warrior for 8-process limit competition

pflag     equ    1743
pGold     ldp.ab #0,#0
          ldp.a  #pflag   ,pGold
          mod.ab #2       ,pGold
          add.a  #1       ,@pGold 
          mod.a  #8       ,pGold 
          stp.ab pGold    ,#pflag
          
p1        djn.a  p2       ,pGold
; CLP-type dodger

slDodger  mov    <btDodger,{btDodger ; initial boot
          mov    <btDodger,{btDodger
          djn    -2,#5
          jmp    pmove+300
btDodger  jmp    pescape+300,pescape

plen      equ    (pescape-c0)
pstep     equ    (5093)
c0        mov    pb        ,@pfence  ; build fences
          mov    pb        ,*pfence
ploop     mov    pescape   ,<pescape-pstep
pfence    sne    pb-56     ,pb+26    ; monitor fences
          djn.f  ploop     ,<4000
pmove     mov    pb        ,pescape+pstep  ; set copy pointers
pcopy     mov    >pescape+pstep  ,}pescape+pstep ; make copy
          jmn.b  -1        ,pescape+pstep  ;
preset    jmp    p1+pstep  ,-p1-pstep ; jump to new location
pb        dat    p1-pescape,-pstep-plen
pescape   dat    0,0
      for 25
          dat    0,0
      rof
p2        djn.a  p3       ,pGold  
; 3-line stone and a one-process imp
; stone is loaded with 7 processes such that
; lines are always executed in order 1-2-3-1-2-3...
; may have some imp immunity

boot      equ    3002
imp       mov.i  #1       ,1
          dat    0        ,imp
          dat    0        ,Stone+boot
slStone   mov    Stone+2  ,Stone+boot+2
          mov    Stone+1  ,Stone+boot+1
          mov    Stone    ,Stone+boot
          spl    1        ,Stone+boot+2
          spl    1        ,Stone+boot+1
          spl    1        ,Stone+boot
          jmp    @-1      ,{0

sStep     equ    5266
Stone     mov    }1629    ,1-sStep
          sub.x  #sStep   ,-1
          jmp    -2       ,}-2
      for 25
          dat 0,0
      rof
; mouse
p3
mouse     add.x  #20     ,#mouse
loop      mov    <mouse  ,<birth
          mov    <mouse  ,<birth
          jmn    loop    ,mouse
birth     spl    mouse   ,-890
          jmz    @birth  ,mouse
          mov.i  #0      ,<0

          end    pGold
