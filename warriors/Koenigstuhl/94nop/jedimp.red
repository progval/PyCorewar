;redcode-94
;name Return Of The Jedimp
;author John K W
;strategy Return Of The Jedimp with Q^2 scan...
;strategy v.q4 - altered engine.  new qscan.
;strategy v.q52 - fixed spacing and qscan better
;assert 1

org start

step equ 12             ; gap between qbombs
strafelen equ 4         ; coverage area = step*strafelen*3

bomb    dat <1, step
qstep	dat -step, 2*step

;*************** QSCAN

qs    equ   10

QS1   equ   (100)
QS2   equ   (3*QS1)
QS3   equ   (6*QS2)
QBASE equ   (tab+300)

SIG01 equ   a01
SIG02 equ   {a01
SIG03 equ   }a01
SIG04 equ   >a01
SIG05 equ   <a01
SIG06 equ   a01

start   seq     QBASE+QS2*0+QS1*0, QBASE +QS2*0 +QS1*0+QS3
        jmp     aaa,  SIG01
        seq     QBASE+QS2*1+QS1*0, QBASE +QS2*1 +QS1*0+QS3
        jmp     a01,  SIG02
        seq     QBASE+QS2*2+QS1*0, QBASE +QS2*2 +QS1*0+QS3
        jmp     a01,  SIG03
        seq     QBASE+QS2*3+QS1*0, QBASE +QS2*3 +QS1*0+QS3
        jmp     aaa,  SIG04
        seq     QBASE+QS2*4+QS1*0, QBASE +QS2*4 +QS1*0+QS3
        jmp     aaa,  SIG05
        seq     QBASE+QS2*5+QS1*0, QBASE +QS2*5 +QS1*0+QS3
        djn.f   a01,  SIG06

        seq     QBASE+QS2*0+QS1*1, QBASE +QS2*0+QS1*1+QS3
        jmp     a02,  SIG01
        seq     QBASE+QS2*1+QS1*1, QBASE +QS2*1+QS1*1+QS3
        jmp     a02,  SIG02
        seq     QBASE+QS2*2+QS1*1, QBASE +QS2*2+QS1*1+QS3
        jmp     a02,  SIG03
        seq     QBASE+QS2*3+QS1*1, QBASE +QS2*3+QS1*1+QS3
        jmp     a02,  SIG04
        seq     QBASE+QS2*4+QS1*1, QBASE +QS2*4+QS1*1+QS3
        jmp     a02,  SIG05
        seq     QBASE+QS2*5+QS1*1, QBASE +QS2*5+QS1*1+QS3
        djn.f   a02,  SIG06

        seq     QBASE+QS2*0+QS1*2, QBASE+QS2*0+QS1*2+QS3
        jmp     a03,  SIG01
        seq     QBASE+QS2*1+QS1*2, QBASE+QS2*1+QS1*2+QS3
        jmp     a03,  SIG02
        seq     QBASE+QS2*2+QS1*2, QBASE+QS2*2+QS1*2+QS3
        jmp     a03,  SIG03
        seq     QBASE+QS2*3+QS1*2, QBASE+QS2*3+QS1*2+QS3
        jmp     a03,  SIG04
        seq     QBASE+QS2*4+QS1*2, QBASE+QS2*4+QS1*2+QS3
        jmp     a03,  SIG05
        seq     QBASE+QS2*5+QS1*2, QBASE+QS2*5+QS1*2+QS3
        djn.f   a03,  SIG06

        jmp     evopac          ;nothing found

        dat     1*QS2,  4*QS2+QBASE-ptr
tab     dat     0*QS2,  0*QS2+QBASE-ptr
        dat     2*QS2,  3*QS2+QBASE-ptr

a03     add     #QS1,   @a01
a02     add     #QS1,   @a01
a01     add.ab  tab,    tab
aaa     mov.ba  @a01,   ptr

        sne     DEAD,   *ptr  ;which of the two?
        add.a	#QS3,   ptr

	add.ab	ptr,	ptr

qbrun   mov 	bomb, 	@ptr
	mov 	bomb, 	*ptr
ptr     mov 	-0, 	@step
	add.f	qstep, 	-1
        djn     qbrun,  #strafelen
	jmp	evopac

;*************** EVOPAC

DEAD
ded for 32
dat 0, 0
rof

d2    equ 1143
TSTEP equ 1751
bstep equ 1819 ;2283 ;1997
boot  equ 1700-(80+15)*4-1

evopac  spl     1
        spl     1
        spl     1
        mov     <1,     {1
        jmp     boot,   imp2+1
evol:   spl     @evol,  }TSTEP
        mov.i   }evol,  >evol
evoli:  spl     #d2,    bstep-1
        mov     b,      >2
        add.f   evoli,  j
j:      jmp.f   imp2-d2*8, {-6+bstep
b       dat     <1,     1
imp2    mov.i   #d2,    *0

