;redcode-94
;name Freak
;author John K W
;assert CORESIZE == 8000
;strategy based on Kline's mscan, multiprocess scanner
;strategy attempts the ever-elusive 'smart' quality

org mStart

mStep     equ    2365;45               ; mod-5, > (mScan-mGate+2)
mProc     equ    4                ; number of processes in each loop

mGate     dat    0      ,200
mIncr     dat    mStep  ,mStep
offset equ mScan+mStep*11
mPtr      dat    offset-1, offset+mProc*mStep
cptr    dat     0, pump

                                  ; mPtr-A tracks mProc steps behind mPtr-B
                                  ; so when a process falls through the jmn.f
                                  ; check it can move mPtr-A to mGate
                                  ; for wiping
      for 7
          dat    0,0
      rof
mAdd    add     mIncr  ,mPtr  ;   1  4  7
        mov     {mSpl, >mGate ;    2  5  8
mSync   djn     mAdd   ,#1500 ;     3  6  9
        spl     #0,    0
        mov     mDat   ,>cptr    ; d-clear
        djn.f   -1     ,>cptr
mDat    dat     >5335  ,5-cptr

for 7
        dat    0,0
rof

mReset  mov     mSpl,   >mGate;             3 
        mov.ab  mPtr,   mGate ;              4
        mov     }mSpl,  >mGate;   2  5        5
        mov     mSpl,   >mGate;    3  6        6 
mScan   jmz.f   -2,     @mPtr ;  1  4  7        7
        jmp     mReset, }mSpl ;            2
      for 27
          dat    0,0
      rof

;********************** watcher
istep   equ     2667
impoff  equ     (Z+1137)
point equ imp;    (pump-pmpof+impoff)
pmpof   equ     (impoff-100)

watcher jmz.f   0,      mSpl
pump    spl     #0,     0
        mov     ptr+1, <mScan+2
        add.a   #istep+1, ptr
prime   mov.i   point,  point-1
ptr     jmp     point-(istep+1)*3, >prime
;***********************

      for 18
          dat    0,0
      rof

mStart  spl     watcher
        spl     1,      <500    ; create mProc processes
        jmp     2
        dat 0,0
;       spl     1,      <600
        spl     1,      <700
        spl     mSync,  <800    ; start scanning loops
        jmp     mScan,  >mGate
        dat 0,0
        dat 0,0
imp     mov.i   #istep, *0

mSpl
i for 8
spl    0,0
rof

end
