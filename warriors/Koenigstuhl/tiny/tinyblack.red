;redcode-tiny 
;name Tiny Black Knight
;author Christian Schmidt
;strategy stone/imp 
;assert 1 

;optimax 123
;optimax work tiny-black2
;optimax rounds 1 100 200 200
;optimax suite fshtiny0.1

;optimax phase2 fshtiny0.1/clr/tinyshot.red
;optimax phase2 120

;optimax phase3 top20
;optimax phase3 clr:pap

sDist    equ     610
iDist    equ     317
iAwa     equ     612

istep    equ     267 

dStep    equ     754

xRef     equ     pGo 

pGo      mov     cBomb,      xRef+sDist+1+dStep 
         mov     imp,        xRef+iDist+iAwa 
         spl     1,          {39
         spl     1,          }753
         mov     <sBoo,         {sBoo 
         mov     <iBoo,         {iBoo 
sBoo     spl     xRef+sDist+4,  dStart+4 
iBoo     jmp     xRef+iDist+4,  iStart+4 

         dat     0,          0
         dat     0,          0

dStart   spl     #0,         }599 
         mov     dStep,      715
         add.ab  {0,         }0    
         djn.f   -2,         <421

cBomb    dat     >-1,        >1 
imp      mov.i   #istep,     *0 

iStart   spl     #0,         >435
         add.a   #istep,     1 
launch   spl     iStart+iAwa-(istep*4), <458 
         djn.f   sDist-iDist-3, <442

