;redcode-94nop
;name Bravo
;strategy Paper/clear.
; Bravo is its name since it is as stupid as he is. :-)
; Slighltly optimized.
;author Lukasz Grabun
;assert CORESIZE==8000

cBoo    equ     313
pHit0   equ     7599
pDst0   equ     535
pDst1   equ     3875
pDst2   equ     5160

pGo     spl     1       , 0
	spl     1       , 0
        spl     1       , 0

pSilk0  spl     @0      , >pDst0
        mov     }pSilk0 , >pSilk0
pSilk1  spl     pDst1   , 0
        mov     >pSilk1 , }pSilk1
        mov     pBmb    , >pHit0
        mov     <pSilk1 , <pSilk2
pSilk2  djn.f   @0      , >pDst2
pBmb    dat     >5334   , >2667

for 78
dat 0,0
rof

gate	dat	0   , 2000
clear	spl      #0 , #0
	mov    bomb , >gate
	djn.f    -1 , >gate
bomb	dat   >5335 , 15

cSrc	spl	2   , bomb+1
cDst	spl	2   , cBoo-CURLINE
	spl	1   , 0
	mov    <cSrc, <cDst
	djn	cBoo-CURLINE-4, #5
	jmp	pGo	
	end	cSrc

