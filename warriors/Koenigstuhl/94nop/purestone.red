;redcode-94
;name Test - Pure Stone w/ boot
;author Robert Macrae
;strategy Stone
;assert 1

len     EQU 9
fcp     EQU 3039
scp     EQU 2365
tcp     EQU 777

EXTRASET EQU 145

org hattrick

boot	spl	1,	>-3000    ; 7 processes replace 9 in CCPaper
	spl	1,	<-3200    ; for cost of extra Mov in launcher.
	mov	-1,	#0

frog    spl	@0,	<fcp-len
frogmo  mov	}-1,	>-1
frogm2  mov	}-2,	>-2
        spl	@0,	<scp
        mov	}-1,	>-1
        spl	@0,	<tcp
        mov	}-1,	>-1
        mov	2,	<-fcp+len+1   ; Wipe uncle.
        jmp	-1,	<-10
        dat	<2667,	<2667*2
for 10 
	dat 0,0
rof

carbon	spl	#0,	#0
	spl	#0,	<-1151+3
ptr	mov	197,	cad-(197*3500)
cad	add.ab	{0,	}0
cadsu	djn.f	-2,	<-1151

init	mov.i	cbmb,	*ptr
	jmp.b	carbon,	>-4000
for 21
	dat 0,0
rof

cbmb	dat	>-1,	>1

hattrick	mov cadsu, ptr-(197*20)+cs+EXTRASET
	mov {-1, <-1
	mov {-2, <-2
	mov {-3, <-3
	mov {-4, <-4
here	mov cbmb, here-boot+3994+180+11+EXTRASET
	spl @hattrick
	mov hattrick+1, hattrick
	mov hattrick,here 
for 10
dat 0,0
rof

cs	spl.b	#0,		<-700
	spl.b	imp+5334,	<1
	spl.b	imp+2667,	<-1000
imp	mov.i	#2667,		*0


