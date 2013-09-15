;redcode-94
;name Razor
;author Michal Janeczek
;strategy HSA-type scanner
;assert CORESIZE==8000

       org   eInc

eStep1 equ   7
eStep2 equ   9
eSelf  equ   13

eDat   equ   eSpl-1

ePtr   dat   4100       , 150

       for   eStep1-4
       dat   0          , 0
       rof

eSpl   spl   #1         , }1
eWipe  mov   eSpl       , <ePtr
       mov   >ePtr      , >ePtr
       jmn.f eWipe      , >ePtr
eInc   sub.x #-eStep2-2 , -eStep1-1
       sne   {ePtr      , <ePtr
       jmz.f eInc       , <ePtr
       sne   eDat       , >ePtr
       mov.x @eInc      , @eInc
       slt.b @eInc      , #eEnd+3-ePtr
       djn.f eWipe      , @eInc
       djn   eInc       , #eSelf
eEnd   jmp   eInc       , {eWipe

