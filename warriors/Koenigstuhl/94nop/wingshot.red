;redcode-94
;name WingShot
;author Ben Ford
;strategy 0.80c BiShot-style oneshot
;assert !(CORESIZE%10) && (MAXLENGTH>=20)

start   equ     oscn
oinc    equ     10
omod    equ     10
oset    equ     (omod*((MAXLENGTH+MINDISTANCE)/omod)-1)
odif    equ     (omod*((CORESIZE/2)/omod))
otic    equ     (CORESIZE/omod)

optr    spl     {oset,  >odif+oset-3
        dat     {10,    >odif
ospl    spl     #10,    <-MINDISTANCE
oclr    mov     ospl,   }optr
        mov     ospl,   >optr
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

end     start

