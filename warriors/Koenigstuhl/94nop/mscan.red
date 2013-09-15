;redcode-94 test
;name mScan
;author P.Kline
;assert CORESIZE == 8000
;strategy multiprocess scanner

mStep     equ    45               ; mod-5, > (mScan-mGate+2)
mProc     equ    8                ; number of processes in each loop

mIncr     dat    mStep  ,mStep
mGate     dat    0      ,mStep*10
mPtr      dat    (mStep*11)+1-1 ,(mStep*11+mProc*mStep)+1
                                  ;
                                  ; mPtr-A tracks mProc steps behind mPtr-B
                                  ; so when a process falls through the jmn.f
                                  ; check it can move mPtr-A to mGate
                                  ; for wiping
      for 8
          dat    0,0
      rof
mAdd      add    mIncr  ,mPtr     ; step scanner
mSync     djn    mAdd   ,#2000    ; count down
mSpl      spl    0,0
          mov    mDat   ,>mAdd    ; d-clear
          djn.f  -1     ,>mAdd
mDat      dat    >5335  ,2-mAdd
      for 7
          dat    0,0
      rof
mReset    mov.ab mPtr   ,mGate    ; adjust pointer and get back in line
mWipe1    mov    mSpl   ,>mGate   ; continuous spl-wipe
mScan     jmz.f  -1     ,@mPtr    ; f-scan
          jmp    mReset           ;   found something!
      for 46
          dat    0,0
      rof
mStart    spl    1,<500           ; create mProc processes
          spl    1,<600
          spl    1,<600
          spl    mSync,<800       ; start scanning loops
          jmp    mScan,>mGate
          end    mStart

