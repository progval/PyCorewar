;redcode-94 test
;name mScan
;author P.Kline
;assert CORESIZE == 8000
;strategy multiprocess scanner

mStep     equ    45               ; mod-5, > (mScan-mGate+2)
mProc     equ    16               ; number of processes in each loop

mIncr     dat    mStep  ,mStep
mGate     dat    0      ,mStep*10
mPtr      dat    (mStep*11)+1-1 ,(mStep*11+mProc*mStep)+1
      for 6
          dat    0,0
      rof
mGate2    dat    0      ,-1000
          dat    0,0
mAdd      add    mIncr  ,mPtr     ; step scanner
mSync     djn    mAdd   ,#2000    ; count down
mSpl      spl    0,0
          mov    mDat   ,>mGate2  ; d-clear
          djn.f  -1     ,>mGate2
mDat      dat    <5335  ,4-mAdd
      for 7
          dat    0,0
      rof
mReset    mov.ab mPtr   ,mGate    ; adjust pointer
mWipe1    mov    mSpl   ,>mGate   ; continuous spl-wipe
mScan     jmz.f  -1     ,@mPtr    ; f-scan
          jmp    mReset ,#50     ;   found something!
      for 20
          dat    0,0
      rof
      for 26
          dat    0,0
      rof
mStart    spl    1,<500           ; create mProc processes
          spl    1,<600
          spl    1,<600
          spl    1,<700
          spl    mSync,<800       ; start scanning loops
          jmp    mScan,>mGate
          end    mStart
