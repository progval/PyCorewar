;redcode-tiny
;name Windkeeper
;author Christian Schmidt
;strategy stone/imp
;assert 1

;optimax 123
;optimax work t-wind2b
;optimax rounds 1 200 200 200
;optimax suite fshtiny0.1

;optimax phase2 fshtiny0.1/clr/whitenoise.red
;optimax phase2 100

;optimax phase3 top25
;optimax phase3 clr:pap

istep    equ     2667

sDist    equ     708
sStep    equ     598

iDist    equ     605
iAwa     equ     332
iTrain   equ     506

xRef     equ     pGo

pGo      mov     imp,        xRef+iDist+iAwa
         spl     1,          <397
         spl     1,          <46

         mov     <sBoo,         {sBoo
         mov     <iBoo,         {iBoo
sBoo     spl     xRef+sDist+4,  dStart+4
iBoo     jmp     xRef+iDist+4,  iStart+4

         dat     0,          0
         dat     0,          0
         dat     0,          0
         dat     0,          0


dStart  spl     #sStep,         >-sStep
        mov     {sStep,         {-sStep+1
        add     -2,             -1
pEnd    djn.f   @0,             {-2


imp      mov.i   #istep,     *0

iStart   spl     #0,         <686
         add.a   #istep,     1
launch   spl     iStart+iAwa-(istep*4), <490
         djn.f   sDist-iDist-3, <iTrain

end pGo

