;redcode-94nop verbose
;name Morbid Dread IV
;author Philip Thorne
;strategy   01Dec02 1-Shot scanner with decoy
;strategy   06Dec02 Minor tweaks. A little more robust/+ vs paper/+ vs imp
;
;                   Longer SPL phase plus added anti-imp component to clear.
;                   Scan to Clear transition is more robust
;                   Vaccinated version was submitted as mdvac20 tst.3
;assert 1

START   EQU ((ptr-scan)-(STEP))
STEP    EQU (-2150) ;50
GAP     EQU 25
OFF     EQU 0

;quiz-based
ptr:
zptr:   dat.f   scan+STEP+OFF+GAP, scan+STEP+OFF
        dat     0,              0
        dat.f   <-15,           >2667
        dat.f   <-15,           20
clr:    spl     #-1500,         30
        mov.i   @2,             >zptr
        mov.i   @1,             >zptr
        djn.b   -2,             {clr

    for 4
        dat     0,              0
    rof

;find
scan:   add.f   incr,           ptr
        sne.i   *zptr,          @zptr
        djn.f   scan,           <ptr
        spl     clr,            {0
        mov.i   jbmb,           }ptr
        mov.i   jbmb,           }ptr
        sub.ab  #100,           ptr

    for MAXLENGTH-CURLINE-6 -1
        dat     0,              0
    rof

incr:   dat     #STEP,          #STEP+1
jbmb:   jmp     #0,             0
        dat     0,              0

for 1
;decoy out of HSA
tDecoy: EQU    (zptr+2162-9)      ;for -2150

tStart: mov    <tDecoy+0,       {tDecoy+2     ; make a quick-decoy
        mov    <tDecoy+3,       {tDecoy+5     ; to foil one-shots
        mov    <tDecoy+6,       {tDecoy+8     ; and the occasional q-scan
tEnd:   djn.f  scan,            <tDecoy+10
rof

    end tStart
    end scan

