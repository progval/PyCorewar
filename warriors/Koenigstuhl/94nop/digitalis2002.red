;redcode-94nop
;name Digitalis 2002
;author Christian Schmidt
;strategy Mini Q^4 -> d-clear + 7pt imps
;strategy multi-process bootstrapping
;strategy boot away the clear AND the imps
;strategy v0.1 new, optimized constants
;strategy v0.2 fixing a bug in the imp-launcher
;strategy v0.3 fixing a bug with the qscan
;strategy v0.3a rearranging the components
;strategy v0.4 new process allocation
;strategy v0.5 imp-launcher 1 instruction smaller
;assert 1

org qGo

impoff  equ     100
impsize equ     1143
cBoot   equ     2390
iBoot   equ     459

        spl     1,              }qC
qTab2   spl     1,              }qD
        spl     2,              }qE
        djn.f   imp,            <-250
        add.a   imp,            -1
        djn.f   cBoot-iBoot,    <-400
        dat     0,              0
imp     mov.i   #impsize,       *0
        dat     0,              0
        dat     0,              0
iEnd    dat     0,              0

ptr     dat     0,              1800
clrb    dat     >2667,          25

clear   spl     #0,             >ptr-15
loop    mov     clrb-15,        >ptr-15
cc      djn.f   loop,           >ptr-15
        dat     0,              0
        dat     0,              0
cEnd    dat     0,              0

pGo     mov.i   clrb,           cEnd+cBoot-18-3
        mov.i   ptr,            cEnd+cBoot-19-3
        spl     2,              }-345
        spl     1,              }-567
        mov     -1,             0
        mov.i   {cEnd,          {cBoo
        mov.i   {iEnd,          {iBoo
        mov.i   {iEnd,          {iBoo
cBoo    spl     cEnd+cBoot
        spl     1
iBoo    jmp     cEnd+iBoot

        for     15
        dat     0,              0
        rof

        dat     0,              }qA
qTab1   dat     0,              }qB

        for     27
        dat     0,              0
        rof

qX      equ     3080
qA      equ     3532
qB      equ     2051
qC      equ     6177
qD      equ     4696
qE      equ     3215
qF      equ     583

qStep   equ     7
qTime   equ     16
qOff    equ     87

qBomb   dat     {qOff,          qF

qGo     sne     qPtr+qX*qE,     qPtr+qX*qE+qE
        seq     <qTab2+1,       qPtr+qX*(qE-1)+(qE-1)
        jmp     qDec,           }qDec+2

        sne     qPtr+qX*qF,     qPtr+qX*qF+qD
        seq     <qBomb,         qPtr+qX*(qF-1)+qD
        jmp     qDec,           }qDec

        sne     qPtr+qX*qA,     qPtr+qX*qA+qD
        seq     <qTab1-1,       qPtr+qX*(qA-1)+qD
        djn.a   qDec,           {qDec

        sne     qPtr+qX*qB,     qPtr+qX*qB+qD
        seq     <qTab1,         qPtr+qX*(qB-1)+qD
        djn.a   qDec,           *0

        sne     qPtr+qX*qC,     qPtr+qX*qC+qC
        seq     <qTab2-1,       qPtr+qX*(qC-1)+(qC-1)
        jmp     qDec,           {qDec+2

        sne     qPtr+qX*qD,     qPtr+qX*qD+qD
        jmz.f   pGo,            <qTab2

qDec    mul.b   *2,             qPtr
qSkip   sne     <qTab1,         @qPtr
        add.b   qTab2,          qPtr
qLoop   mov     qBomb,          @qPtr
qPtr    mov     qBomb,          }qX
        sub     #qStep,         @qSkip
        djn     qLoop,          #qTime
        djn.f   pGo,            #0

        end

