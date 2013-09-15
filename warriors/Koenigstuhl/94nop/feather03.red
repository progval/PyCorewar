;redcode-94
;name Feather v0.3
;author Ian Oversby
;strategy Bomber
;assert 1

gate1   equ     (gate-3)
last    equ     (djmp+1)
dist    equ     384

impstep equ     2667
sval    equ     1300

org     boot

mimp    SPL.B   1,      <-200
        MOV.I   -1,     0
        SPL.B   1,      <-300
        SPL.B   1,      <-400        

        SPL.B   2,      <-500
        JMP.B   imp
        ADD.A   #impstep, -1
die     DAT.F   #0,     #0
imp     MOV.I   #-5,    impstep

boot    MOV.I   {sptr,  <sptr
for 6
        MOV.I   {sptr,  <sptr
rof
        SPL.B   @sptr
        MOV.I   {sptr,  <sptr
        MOV.I   die,    sptr
        JMP.B   mimp
sptr    DAT.F   djmp+1, sval


gate	DAT.F	-25,	last-gate1+3
bombs   SPL.B   #-dist, #dist
loop    MOV.I   bombs,  *2939
        MOV.I   bombs,  @loop
        ADD.AB  #2936,  loop
stream  DJN.F   loop,   <1300
clr	MOV.I	@djmp,	>gate1
djmp	DJN.B	clr,	{bombs

for 71
        DAT.F   $0,     $0
rof

        END

