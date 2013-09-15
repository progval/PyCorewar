;redcode-94
;name tripod v1.5
;author Brian Haskin
;strategy pspace switcher
;assert CORESIZE == 8000

STRATEGY equ 120
LOSSES equ 180
PSTRAT equ 31
SSTRAT equ 43
CSTRAT equ 47

;paper equ's
dest0   equ     2200
dest1   equ     3740
dest2   equ     -1278   ;pmars optimized
range   equ     933     ;pmars optimized

;skill's equ's
step    equ     1295
SBOOT equ -2500

;pkill equ's
CBOOT equ 1000

	org start

pptr    dat STRATEGY,LOSSES

start   ldp #0,#0
	sne.b start,#-1
	jmp skill
strat   ldp.ab pptr,#0
loss    ldp pptr,#0
	seq.b start,#0
	jmp same
	slt.b loss,#6
	jmp switch
	add #1,loss
	stp.b loss,pptr
same    sne.b strat,#PSTRAT
	jmp paper
	sne.b strat,#SSTRAT
	jmp skill
	jmp pkill
switch  stp #0,pptr
	slt.b strat,#CSTRAT
	jmp paper
	sne.b strat,#PSTRAT
	jmp skill
	jmp pkill

paper   stp.a #PSTRAT,pptr
	mov 100,pptr
	spl     1,      <300    ;\.
	spl     1,      <400    ;-> generate 8 consecutive processes
	spl     1,      <500    ;/.

silk    spl     @0,     {dest0
	mov.i   }-1,    >-1
silk1   spl     @0,     <dest1
	mov.i   }-1,    >-1
	mov.i   bomba,  }range
	mov     {silk1, <silk2
silk2   jmp     @0,     >dest2
bomba   dat     >2667,  >1443



skill   stp.a #SSTRAT,pptr
	mov 100,pptr
sbt     mov stoe,SBOOT
for 6
	mov {sbt,<sbt
rof
sbb     mov snc,SBOOT+sbt+16
	spl @sbt,}SBOOT+200
	mov sdat,SBOOT+sbt+12
	mov sdat,-1
	mov sdat,sbb
	mov sdat,sbt
sdat    dat }-9,>-9
snc     spl #3*step, #3*step

stn     spl #step, >-8
stone   mov step+4, *(2*step)+4
	mov stn, @stone
	mov stn, *stone
sad     add stoe+16, stone
	djn.f stone, <-82
stoe    mov 12, <sad


pkill   stp.a #CSTRAT,pptr
	mov 100,pptr
cbt     mov toe,CBOOT
for 9
	mov {cbt,<cbt
rof
bt      spl (CBOOT+cbt)+(clr-toe)
	mov 100,cbt     ;scramble boot pointers
	mov 100,bt

gate    dat clr,toe+5
	dat 1,-gate+toe+5
	spl #1,-gate+toe+5
clr     spl #2,-gate+toe+5
	mov *gate,>gate
	mov *toe,<toe
	djn.f -2,<-2600
	dat -2,-11
	spl #-2,-11
toe     dat -1,-11
	end
