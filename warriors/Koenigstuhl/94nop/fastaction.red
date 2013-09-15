;redcode-94nop
;name Fast Action
;author Christian Schmidt
;strategy mini Q^4 -> stone, paper and imps
;assert 1

org qGo

pStep1  equ 286  
bStep   equ 4419  
cBoot   equ 3030+(10*pStep1)
impsize equ 2667
uStp    equ 703
uTim    equ 1183

        dat     0,        }qC
qTab2   dat     0,        }qD
        dat     0,        }qE

paper   spl     @0,       >pStep1
        mov     }-1,      >-1
        spl     @0,       <impsize+1
        mov     }-1,      >-1
        mov.i   #1,       {1
imp     mov.i   #bStep,   impsize
iEnd    dat     0,        0

        spl     #0,       #0
uLp     mov     uBmb,     @uPtr
uHit    sub.x   #uStp*2,  @uLp
uPtr    mov     {3582,    }uHit+2*uStp*uTim
        djn.f   @uHit,    }uPtr
uBmb    dat     <uStp,    >1+6
cEnd    dat     0,        0

pGo     spl     1,        }-345
        mov     -1,       0
        spl     1,        }-567
        mov.i   {cEnd,    {cBoo
cBoo    spl     cEnd+cBoot
        spl     *cBoo
iBoo    jmp     paper
        dat     0,        0

        dat     0,        0
        dat     0,        0
        dat     0,        0
        dat     0,        0


for 16
dat 0,0
rof

        dat     0,          }qA
qTab1   dat     0,          }qB

for 27
dat 0, 0
rof

qX equ 3080
qA equ 3532
qB equ 2051
qC equ 6177
qD equ 4696
qE equ 3215
qF equ 583

qStep equ 7
qTime equ 16
qOff equ 87

qBomb dat {qOff , qF


qGo sne qPtr+qX*qE , qPtr+qX*qE+qE
seq <qTab2+1 , qPtr+qX*(qE-1)+(qE-1)
jmp qDec , }qDec+2
sne qPtr+qX*qF , qPtr+qX*qF+qD
seq <qBomb , qPtr+qX*(qF-1)+qD
jmp qDec , }qDec
sne qPtr+qX*qA , qPtr+qX*qA+qD
seq <qTab1-1 , qPtr+qX*(qA-1)+qD
djn.a qDec , {qDec
sne qPtr+qX*qB , qPtr+qX*qB+qD
seq <qTab1 , qPtr+qX*(qB-1)+qD
djn.a qDec , *0
sne qPtr+qX*qC , qPtr+qX*qC+qC
seq <qTab2-1 , qPtr+qX*(qC-1)+(qC-1)
jmp qDec , {qDec+2
sne qPtr+qX*qD , qPtr+qX*qD+qD
jmz.f pGo , <qTab2

qDec mul.b *2 , qPtr
qSkip sne <qTab1 , @qPtr
add.b qTab2 , qPtr
qLoop mov qBomb , @qPtr
qPtr mov qBomb , }qX
sub #qStep , @qSkip
djn qLoop , #qTime
djn.f pGo , #0

end

