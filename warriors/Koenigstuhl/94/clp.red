;redcode-94
;name CLP
;author P.Kline
;assert CORESIZE == 8000
;strategy curious little program, variation of Cowboy
;strategy dodge spl/dat sweeps and dclear wipes
;strategy brainwash pswitchers

slDodger  mov    <btDodger,{btDodger ; initial boot
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -4,#4
btDodger  jmp    pescape+300,pescape

plen      equ    (pescape-p1)

p1        mov    pb       ,@pfence  ; build fences
          mov    pb       ,*pfence
ploop     add    pincr    ,psnare   ; snare opponent
          mov    psnare   ,@psnare
pfence    sne    pb-46    ,pb+26    ; monitor fences
          jmp    ploop
          add    preset   ,psnare   ; adjust snare for new base
          mov    pb       ,pescape  ; set copy pointers
pcopy     mov    >pescape ,}pescape ; make copy
          jmn.b  -1       ,pescape  ;
preset    jmp    p1+5093  ,-p1-5093 ; jump to new location
psnare    jmp    ptrap-200,+200
ptrap     mod.x  #10      ,#1       ; allow only one process
          stp.ab #0       ,#0       ; complete brainwash
          djn.b  -1       ,-1
pincr     mov    1        ,-1       ; opponent dies
pb        dat    5093+p1-pescape,-plen
pescape   dat    0,0

          end    slDodger
