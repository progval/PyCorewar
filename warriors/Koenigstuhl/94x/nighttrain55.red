;redcode-94
;name Night Train 55440
;author Karl Lewin
;assert CORESIZE==55440
;contact lewin@netcom.com
;NSFCWT Round 8 Entry
;strategy  Yet another Paper/Imp combo based on Paulssons theMystery

D0	EQU	5162
D1	EQU	35932
OFFSET	EQU	500
INUM	EQU	34117

	ORG	first

first	spl	1,	<-2000
	spl	1,	<-3000
	mov	-1,	0
m01	mov	{ptr01,	<ptr01
m02	mov	{ptr02,	<ptr02
m03	mov	{ptr03,	<ptr03
m04	mov	{ptr04,	<ptr04
m05	mov	{ptr05,	<ptr05
m06	mov	{ptr06,	<ptr06
m07	mov	{ptr07,	<ptr07
m08	mov	{ptr08,	<ptr08
m09	mov	{ptr09,	<ptr09
m10	mov	{ptr10,	<ptr10
m11	

ls00	spl	ls02

ls01	spl	ls04	
ls03	spl	ls08
ls07	spl	lj02
lj01	jmp	@ptr01
lj02	jmp	@ptr02
ls08	spl	lj04
lj03	jmp	@ptr03
lj04	jmp	@ptr04
ls04	spl	ls10
ls09	spl	lj06
lj05	jmp	@ptr05
lj06	jmp	@ptr06
ls10	spl	lj08
lj07	jmp	@ptr07
lj08	jmp	@ptr08

ls02	spl	ls06
ls05	spl	ls12
ls11	spl	lj10
lj09	jmp	@ptr09
lj10	jmp	@ptr10
ls12	spl	lj12
lj11	mov	{ptr11,	<ptr11
lj12	jmp	@ptr11
ls06	spl	ls14
ls13	spl	lj14
lj13	mov	{ptr12,	<ptr12
lj14	jmp	@ptr12
ls14	spl	lj16
lj15	mov	{ptr12,	<ptr12
lj16	jmp	@ptr13

ptr01	dat	last1+1,last1+1+OFFSET+INUM*0
ptr02	dat	last1+1,last1+1+OFFSET+INUM*1
ptr03	dat	last1+1,last1+1+OFFSET+INUM*2
ptr04	dat	last1+1,last1+1+OFFSET+INUM*2
ptr05	dat	last1+1,last1+1+OFFSET+INUM*2
ptr06	dat	last1+1,last1+1+OFFSET+INUM*2
ptr07	dat	last1+1,last1+1+OFFSET+INUM*2
ptr08	dat	last1+1,last1+1+OFFSET+INUM*2
ptr09	dat	last1+1,last1+1+OFFSET+INUM*2
ptr10	dat	last1+1,last1+1+OFFSET+INUM*2
ptr11	dat	last1+1,last1+1+OFFSET+INUM*2
ptr12	dat	last1+1,last1+1+OFFSET+INUM*2
ptr13	dat	last1+1,last1+1+OFFSET+INUM*2

is11	spl	D0,	0
im11	mov	>is11,	}is11
im12	mov	<is11,	<is12
is12	spl	@0,	}-D1
	mov	last1,	{120
imp1	mov.i	#0,	INUM
last1	dat	1,	1

