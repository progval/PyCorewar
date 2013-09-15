;redcode-x2
;name Reverse Engineering
;author Michal Janeczek
;strategy KOFACOTO Round 3 entry
;strategy Backtracker -> Spiral clear
;assert 1

bStep  equ    16373
iStep  equ    34117
fStep  equ    13

fClear add.a  #iStep+1 , fSplit
       mov    @fClear  , {fSplit
       jmp    fClear   , {fClear-2
       dat    -5       , {iStep
fSplit spl    #1-iStep , 3

fInc   sub.a  #fStep   , fPtr
       jmz.f  fInc     , *fPtr
       add.a  #fStep   , fPtr
fPtr   djn.f  #-13     , {0

       jmn.f  fCheck   , {fPtr
fTrack sub.a  #bStep   , fPtr
       jmz.f  fTrack   , *fPtr
fCheck sne    *fPtr    , {fPtr
       jmp    fTrack   , {fClear-2

fCopy  mov    <fBoot   , {fPtr
       djn    fCopy    , #5
fBoot  jmp    *fPtr    , fSplit+1

       end    fInc+1