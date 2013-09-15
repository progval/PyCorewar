;redcode-94
;name SnooPy
;author P.Kline
;assert CORESIZE == 8000
;strategy blurish scanner, paper, oneshot-clear
;strategy did i mention a wimp?

w0 EQU vBoot
w1 EQU slPaper
w2 EQU cBoot
PSTATE EQU 278

wimp      jmp    #0        ,#0     ; frustrate HSA-types, used with paper
     for 15
         dat 0,0
     rof
clGate    jmp    OsClear,OsClear-6 ; one-shot to a dat-clear
clIncr    dat    13     ,13
OsClear   add    clIncr ,clGate
          sne.x  *clGate,@clGate
          djn.f  OsClear,<-1500
clSpl     spl    #0     ,<clGate
          mov    clBomb ,>clGate
          djn.f  -1     ,>clGate
clBomb    dat    <5535  ,1-clGate
          dat    0,0
btClear   jmp    1000   ,clGate+10-btV
       for 5
          dat 0,0
       rof
think   ldp.a    #0      ,in
        ldp.a    #PSTATE ,table
        mod.ba   *in     ,table
        stp.b    *table  ,#PSTATE

                        ; S  L W T
table   jmp }0   ,0441  ; 00 1 0 0
        dat #w0  ,0154  ; 01 2 0 1 ; w0 = scanner
        dat #w0  ,0163  ; 02 3 2 1 ; w1 = paper
        dat #w0  ,0092  ; 03 4 1 2 ; w2 = one-shot/clear
        dat #w1  ,0102  ; 04 6 4 3
        dat #w2  ,0446  ; 05 6 5 5
        dat #w2  ,0362  ; 06 2 5 2
        dat #w2  ,0362  ; 07 2 5 2
        dat #w2  ,0362  ; 08 2 5 2

in      dat  0,8  ; must have non-zero b-field in the previous cell
        dat  0,7
        dat  0,9

cBoot     mov    btClear  ,btV     ; boot one-shot or scanner
vBoot
     a for 10
          mov    <btV     ,{btV
       rof
btV       jmp    vPtr+10+16*150     ,vPtr+10

       for 10
          dat 0,0
       rof

vStep     equ    16
vGate     equ    (vPtr-3)
Snoop

vPtr      mov    vScan    ,6000    ; Blur-type scanner
vNext     mov    vIncr    ,>vPtr
vScan     seq    vStep-6  ,vStep
          mov.ab vScan    ,vPtr
          add    vIncr    ,vScan
          djn    vNext    ,#7900/16
vIncr     spl    #vStep   ,#vStep
          mov    vClr     ,>vGate
          djn.f  -1       ,>vGate
vClr      dat    <2667    ,2-vGate
     for 8
         dat 0,0
     rof
slPaper  spl   wimp
         spl   1 ,{1000
         spl   1 ,{2000
         spl   1 ,{3000
p1s      mov   p1b,>8              ; imp- and stone-killing paper
p1c      mov   <p1s,<p1n           ; pretty good at killing silks too
p1n      spl   @p1n,>-1356
         mov   p1b,<p1n
         mov   p1b,<-1000
         mov   p1b,>200
         jmn.f @0,>p1s
p1b      dat   <2667,<5334

         end   think
