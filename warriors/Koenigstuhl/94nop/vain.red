;redcode-94nop
;name Vain
;author Ian Oversby
;strategy The Original Vain
;strategy Now with Q^(>2)
;strategy Rosebudish Stone, Impfinity Imps
;strategy and a core-clear
;assert CORESIZE==8000

sdist	equ	(start+3614)
dec	equ	6944
tr	equ	6565
idist	equ	(start+2214)

st	equ	1432
ddist	equ	sdist-1054-2
ist	equ	2667
mx	equ	-7

spin	spl.b	#pump+tr,	>-3000
	sub.f	#-(ist+1),	jump
pump	mov.i	imp,		}spin
jump	jmp.f	tr-2*(ist+1),	<dec
imp	mov.i	#-27,		ist

for 20
	dat.f	0,	0
rof


pGo	spl.b	@0,	spin
	spl.b	dboot,	<-850
for 5
	mov.i	{spos,	{sptr
rof
sptr	spl.b	sdist,	<-700
	div.f	#0,	sptr

	dat.f	0,	0

dboot	mov.i	<spos,	{mptr
	mov.i	<spos,	{mptr
	mov.i	<spos,	{mptr
	spl.b	*mptr,	<-1000
	mov.i	<spos,	@mptr
	mov.ab	#3700,	<mptr
mptr	div.f	#ddist,	#ddist+mx-2
	dat.f	}700,	>800

	spl.b	#0,	<p-st
p	spl.b	#st,	<-st
	mov.i	>0+st,	3-st
	add.f	p,	-1
	djn.f	-2,	<p-st

spos	dat.f	#0,	#dl+1

	dat.f	>1,	#10
	spl.b	#0,	#0
	mov.i	mx,	>mx-1
dl	djn.f	-1,	>mx-2

for 5
	dat.f	0,	0
rof

     qf equ qKil
     qs equ (qd*2)
     qd equ 107
     qi equ 7
     qr equ 11

;    -+)>] 0/1 cycles [(<+-

start
qGo: seq   qd+qf+qs,    qf+qs      ; 1
     jmp   qSki,        {qd+qf+qs+qi
     seq   qd+qf+6*qs,  qf+6*qs    ; B
     jmp   qFas,        {qd+qf+6*qs+qi
     seq   qd+qf+5*qs,  qf+5*qs    ; B-1
     jmp   qFas,        <qBmb
     seq   qd+qf+7*qs,  qf+7*qs    ; B+1
     jmp   qFas,        >qBmb
     seq   qd+qf+9*qs,  qf+9*qs    ; A-1
     djn   qFas,        {qFas
     seq   qd+qf+10*qs, qf+10*qs   ; A
     jmp   qFas,        {qFas

;    -+>)] 2 cycles [(<+-

     seq   qd+qf+3*qs,  qf+3*qs    ; C
     jmp   >qFas,       {qd+qf+3*qs+qi
     seq   qd+qf+2*qs,  qf+2*qs    ; C-1
     jmp   >qFas,       {qSlo
     seq   qd+qf+4*qs,  qf+4*qs    ; C+1
     jmp   >qFas,       }qSlo
     seq   qd+qf+12*qs, qf+12*qs   ; B*C-B
     jmp   qSlo,        {qSlo
     seq   qd+qf+15*qs, qf+15*qs   ; B*C-C
     jmp   qSlo,        <qBmb
     seq   qd+qf+21*qs, qf+21*qs   ; B*C+C
     jmp   qSlo,        >qBmb
     seq   qd+qf+24*qs, qf+24*qs   ; B*C+B
     jmp   qSlo,        }qSlo

     seq   qd+qf+27*qs, qf+27*qs   ; A*C-C
     djn   qSlo,        {qFas
     seq   qd+qf+30*qs, qf+30*qs   ; A*C
     jmp   qSlo,        {qFas

     sne   qd+qf+18*qs, qf+18*qs   ; B*C
     jmz.f pGo,         qd+qf+18*qs-10

qSlo:mul.ab #3,         qKil       ; C=3
qFas:mul.b qBmb,        @qSlo
qSki:sne   >3456,       @qKil
     add   #qd,         qKil
qLoo:mov   qBmb,        @qKil
qKil:mov   qBmb,        *qs
     sub   #qi,         qKil
     djn   qLoo,        #qr
     jmp   pGo,         >10        ; A=10
qBmb:dat   {qi*qr-10,   {6         ; B=6

end start

