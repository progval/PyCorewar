;redcode-94x
;name tiny CLP
;author Christian Schmidt
;assert CORESIZE == 800
;strategy curious little program for the tiny hill
;strategy without vamp/brainwash

plen      equ    (pescape-p1)
pescape   equ    (pb+1)

slDodger  mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          mov    <btDodger,{btDodger
          djn    -5       ,#2
btDodger  jmp    pescape+40,pescape


p1        mov    pb       ,@pfence
          mov    pb       ,*pfence
          mov    pb       ,{psnare
pfence    sne    pb-26    ,pb+26
          jmp    p1+2     ,>psnare

          mov    pb       ,pescape
pcopy     mov    >pescape ,}pescape
          jmn.b  -1       ,pescape
preset    jmp    p1+609   ,{320
psnare    dat    {100     ,<200
pb        dat    {609+p1-pescape,-plen

          end    slDodger
