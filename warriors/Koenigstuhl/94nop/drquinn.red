;redcode-94nop
;name Dr Quinn
;author Philip Thorne
;strategy 28Nov02 1-Shot scanner with decoy from HSA.
;strategy         Same family as (but stronger than) Quincy.
;                 Made #20 on the Sourceforge Redcode Standard hill
;                   http://corewars.sourceforge.net
;assert 1

START   EQU ((ptr-scan)-(STEP+ADJ))
STEP    EQU (-2975)
ADJ     EQU (-1)
FLAG    EQU (scan+1000)

;quiz-based
zptr:   dat.f   clr,            (ptr-zptr)-MAXLENGTH
        dat     0,              0
        dat.f   <-15,           20
clr:    spl     #-2670,         30
        mov.i   @2,             >zptr
        mov.i   @1,             >zptr
eclr:   djn.b   -2,             {clr

    for 2
        dat     0,0
    rof

;find
scan:   add.f       incr,       ptr
ptr:    sne.i       scan+STEP-ADJ+10,  scan+STEP-ADJ-12-3+10
        djn.a       scan,       @ptr
        add.b       ptr,        zptr
ytr:    mov.i       clr,        @ptr
ztr:    mov.i       clr,        *ptr
qtr:    jmp         *0,         {0

    for MAXLENGTH-CURLINE-1-4-1
        dat         0,0
    rof

incr:   dat #STEP+ADJ,      #STEP+ADJ
for 1
;Decoy from HSA
tDecoy    equ    (zptr+5047)    
tStart    mov    <tDecoy+0,{tDecoy+2     ; make a quick-decoy
          mov    <tDecoy+3,{tDecoy+5     ; to foil one-shots
          mov    <tDecoy+6,{tDecoy+8     ; and the occasional q-scan
          djn.f  scan  ,<tDecoy+10
rof
    end tStart
