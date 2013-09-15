;redcode-94lp verbose
;name Elusive
;author John Metcalf
;strategy Paper for Pizza's limited process hill
;assert CORESIZE==8000 && MAXPROCESSES==8

for 0
Entered the LP hill on Thursday 18th February 1999, taking 23rd place:
23  32.6/ 40.0/ 27.4                   Elusive         John Metcalf 125.3  1
rof

pStep equ 3039
pDist equ 3359

from:mov   #8,       #8
     add.a #pDist,   to
loop:mov   <from,    {to
     mov   <from,    {to
     jmn   loop,     from
     spl   from,     {4000
to:  jmz   pStep,    *0
     dat   }1,       >1
     end   loop

