;redcode-94
;name Floody River
;author P.Kline
;assert CORESIZE == 8000
;strategy Tscan/Scimitar/Dclear

qd       equ   (7800/(tab1-tab0))
bs       equ   9

tab0     spl    0        ,#-1           ; scan pointers
         dat    0400     ,-0400
         dat    2000     ,-2000
         dat    0800     ,-0800
         dat    3600     ,-3600
         dat    2400     ,-2400
         dat    2800     ,-2800
         dat    1600     ,-1600
         dat    3200     ,-3200
         dat    1200     ,-1200
tab1     dat    3800     ,-3800
     for 60
         dat 0,0
     rof
bomb     jmp    *bs      ,-bs*2
find     sne    *tab1    ,>tab1         ; table scan
         djn.f  find     ,find
         slt.ab #100     ,*find         ; self-detect
         jmp    launch   ,}lcount       ; launch Scimitar, skip pit code
         ;break
         add    *find    ,find
         seq    -20      ,*find
         mov.ab find     ,find
         mov.ba find     ,find
         add    find     ,bomber
         
bloop    mov    bomb     ,*bomber       ; attack after scan
         mov    bomb     ,@bomber
bomber   mov    find-bs  ,*find         
         sub    bomb     ,bomber
         djn    -4       ,#6
         
         mov    tab0     ,>bomber       ; weak vamp attack
launch   mov    <2       ,{2            ; boot Scimitar
lcount   djn    launch-1 ,#8
         jmp    3300     ,Scimitar+8

step      equ   73
count     equ   1000
scGate    equ   (Scimitar-3)
Scimitar  spl   #-step    ,1            ; alternate dat/spl bombing
          mov   }3105     ,}cnt-(2*count*step)-410
          mov   Scimitar  ,@-1
          sub.x #2*step   ,@-3
cnt       djn.f -3        ,<7000
clr       mov   scDat     ,>scGate      ; dclear
          djn.f clr       ,>scGate
scDat     dat   <5335     ,2-scGate
         
          end    find

