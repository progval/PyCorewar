;redcode-94x
;name WingShot T
;author Ben Ford
;strategy 0.80c BiShot-style oneshot
;assert !(CORESIZE%10) && (MAXLENGTH>=20)

start   equ     oscn

oinc    equ     10
oset    equ     (10*((MAXLENGTH+MINDISTANCE)/10)-1)
odif    equ     (10*(CORESIZE/20))
otic    equ     (CORESIZE/10)

optr    spl     {oset,  >odif+oset-3
        dat     {10,    >odif
ospl    spl     #10,    <-MINDISTANCE
oclr    mov     ospl,   >optr
        mov     ospl,   }optr
obmb    djn.a   oclr,   <ospl

        dat     0,      0       ; scanned hi
        dat     0,      0
        dat     0,      0
        dat     0,      0       ; scanned lo

ofnd    sub.f   #-oinc,  optr
oscn    sne.i   *optr,  @optr
        sub.x    ofnd,  @ofnd
        sne.i   *optr,  @optr
        djn      ofnd,  #otic
        djn.f    ospl,  @oscn

        dat     0,      0       ; scanned hi
        dat     0,      0
        dat     0,      0
        dat     0,      0       ; scanned lo

for     MAXLENGTH-CURLINE
        dat     0,      0
rof

end     start





