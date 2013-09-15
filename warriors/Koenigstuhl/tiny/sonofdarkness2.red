;redcode-94x
;name Son of Darkness 2
;author Christian Schmidt
;startegy stone/paper with imps
;strategy v2 add some corecoloring
;assert 1

pStep1 EQU     184
pStep3 EQU     187
x      EQU     742
y      EQU     478 
iStep  EQU     267
sStep  EQU     105

pStart  spl     2,              {257
        spl     1,              0
        spl     1,              {689

        mov     {sEnd,          {sBoo
sBoo    spl     pStart+pStep3,  {693

        mov     {silk1,         {pBoo
pBoo    spl     imp+400,        {530

silk1   spl     @imp+1,         <pStep1
        mov     }silk1,         >silk1
silk2   spl     @0,             <268
        mov     }silk2,         >silk2
        mov.i   <x,             {y
imp     mov.i   #iStep,         *0

        dat     0,              0
        dat     0,              0

sInc:   spl     #-sStep,        >sStep
sPtr:   mov     >-sStep*2,      1+sStep*2
        add     sInc,           sPtr
xx:     djn.f   sPtr,           >sInc+sStep
sEnd    dat     2,              0

        end     pStart

