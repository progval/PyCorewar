;redcode-94
;name Hazy Shade II
;author John K W
;assert CORESIZE == 8000
;strategy p-warrior.  very brainwash resistant.
;strategy v-8.3.  more aggresive post-brainwashing decisions.
;strategy v-8.4.  best of both worlds.

_RESULT equ #0
_LOSS   equ #117
_STR    equ #238
LIMIT   equ 5
_FIRST  equ EvolCap
_SECOND equ lithium
_CODE1  equ 2137
_CODE2  equ 3379

        org res

;********** Evol Cap 10.1

d       equ 2667
BOOT_DIST equ 2600
BOOT_DIST2 equ 2851
S       equ 2365

imp:       mov.i  #d, *0
jclr:      dat    >1, 70

EvolCap:   mov.i  imp,  EvolCap+BOOT_DIST
           mov.i  jclr, EvolCap+BOOT_DIST2+31+5
           mov.i  jclr, EvolCap+BOOT_DIST2+31+5+4000

           spl.i  1, >-1250
           spl.i  1, >-1400
           spl.i  1, >1250

           mov.i  {pptr2, <pptr2
           mov.i  {pptr, <pptr

           spl.i  1, >1250                   ;new
           spl     2                         ;new
           jmp    EvolCap+BOOT_DIST, >1400   ;new
           add.a  #d, -1                     ;new
           spl    @pptr2
           jmp    @pptr

p       spl     #S,     >-S
        mov     }S+1,   -S+2
        add     -2,     -1
        djn.f   -2,     <-560
        mov     32,     >-60
        dat     0,      0
        dat     0,      0
        dat     0,      0

pptr:   nop    0, EvolCap+BOOT_DIST2+8
pptr2:   nop   -1, EvolCap+BOOT_DIST2+8+4000

;*************pcode

won:    ldp     LOS0,   #0
        jmz.b   go,     won   ;if losses is zero, just go
        djn.b   go,     res   ;if it was a tie, just go...
        add.ab  #-1,    won
LOS0:   stp.b   won,    _LOSS
        jmp     go

res:    ldp     _RESULT,#0      ;load last result into B-field
        sne     #-1,    res
        jmp     naive           ;setup start
	jmn     won,    res     ;a one indicates a win in the last round

loss:   ldp     LOS0,   #0      ;_LOSS,  #0
        add     #1,     loss
	slt     loss,   #LIMIT
	jmp     switch

        stp.b   loss,   LOS0

go:     ldp     STR0,   #0

        sne.ab  #_CODE2, go     ;if both of these
        jmp     _SECOND         ;are skipped over,
        sne.ab  #_CODE1, go     ;then we've been brainwashed,
        jmp     _FIRST          ;but we didn't lose

STR0
second  stp     #_CODE2, _STR   ;if the opponent is so un-aggresive
        jmp     _SECOND         ;as to not kill me, when it got a
                                ;chance to brainwash me, then it
                                ;deserves a dose of Lithium

switch: ldp     LOS0,   #0
        stp     #0,     LOS0
swstr:  ldp     STR0,   #0

        sne.ab  #_CODE2, swstr  ;if both of these
        jmp     first           ;are skipped over
        sne.ab  #_CODE1, swstr  ;then we've been
        jmp     second          ;brainwashed, and we lost
        
first   stp     #_CODE1, STR0
        jmp     _FIRST

for 10
dat 0, 0
rof

naive   stp     #LIMIT-1, LOS0
        stp     #_CODE1, STR0
        jmp     _FIRST

for 10
dat 0, 0
rof

;*************Lithium (torch t18)
step    equ     54
count   equ     2000
BOOTDIST equ     2300

lithium spl     1                       ;compressed boot.
        mov     -1,     0               ;5 cycles slower
        mov     {bptr,  <bptr           ;to completion,
        mov     {bptr,  <bptr           ;but 6 lines smaller
        mov     {bptr,  <bptr
        jmp     >bptr

sm2     mov     step+1, >step+1         ; mov half of the incendiary
        dat     -10-341,    26
sp2     spl     #-1-step,-step          ; spl half of the incendiary
        sub     #step+step,1
msm2    mov     sm2,    *tgt2+(-step*2000)-17228
msp2    mov     sp2,    @msm2
tgt2    jmz     sp2+1,  #0
clr2    mov     @1,     >sm2-13
cp2     djn.b   clr2,   {sp2

bptr    dat     0,      BOOTDIST

        end

