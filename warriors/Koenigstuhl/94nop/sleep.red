;redcode-94
;name Sleep
;author A.S. Mehlos
;assert CORESIZE==8000
;strategy  Entry for round 1 of Ian's Tournament
;strategy 80%c Scanner/bomber
;strategy I think this warrior is just too big for it's own good.

SCANSTEP equ 8         ;
BOMBSTEP equ 3104       ; mod (SCANSTEP*4) = 20
COUNTS   equ (390-143)
MAXSTUNS equ 4
gate equ bomb-20
FIRSTCHK  equ BOMBSTEP-8
org toss

; bomb   mov.i   #SCANSTEP, 1			; mov.i #2340, {1
cPtr   spl   #0,   #3
       dat   #11,   {1    
       spl   #11,    #1
cSt    spl   #11,    #2
fBmb       mov   @cPtr, }cPtr			; mov.i @-4, }-4
       mov   @cPtr, }cPtr			; mov.i @-5, }-5
       mov   @cPtr, }cPtr
jmpr   djn.f fBmb,    <-100			; djn.f -2, <-39
addt   dat  <BOMBSTEP, <BOMBSTEP		; dat <2340, <2340
incr   add.f addt,      scan			; add.f -1,3
toss   mov   cSt-1      ,@scan		        ; mov.i -10,@2
       mov   cSt-1   ,*scan			; mov.i -11,*1
scan   sne.i  *FIRSTCHK ,*FIRSTCHK+(SCANSTEP*2) ; sne.i *nnn , *nnn
dct    djn.b  incr,    #COUNTS			; djn.b -4, #390
aim    add.a   scan, cPtr			; add.a -2, -13
       jmp cSt
for 57
	dat 0,0
rof
for 5
	dat <1,{1
rof
for 3
	dat 0,0
rof
for 5
	dat <1,{1
rof
for 3 
	dat 0,0
rof
for 5
	dat <1,{1
rof

