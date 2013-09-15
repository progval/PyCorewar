;redcode
;name Quicksilver '88
;author Michal Janeczek
;strategy qscan -> stone/imp
;assert CORESIZE == 8000

;I'm sure that Paul wasn't the only one that
;noticed my test on KOTH. However, there was
;a reason for such reckless move;) - I was getting
;some really weird results, and I wasn't sure if
;it was the warrior or just my testing script.
;It turned out that qscan steps interacted with
;boot distances. Next time I'll think twice:)
;Too late to change my main entry, but hmm...
;it doesn't look so bad after all.

sdist equ 4857
dboff equ 11
idist equ 7706
ioff  equ 5817

boot  mov imp+1         , sdist+dboff
iboot spl 2             , boot+idist+3
      spl 1             , boot+ioff+3
      mov imp           , <-1
      mov <stone        , <iboot
      mov -3            , 0
      mov <stone        , <sboot
      djn boot+sdist    , #5
sboot djn boot+idist    , #boot+sdist+5

stone spl 0             , imp
      mov stone+dboff   , <-123
      mov stone+dboff   , @-1
      add #-107         , -2
      djn -3            , <5246

      spl 0             , 0
      add #2668         , 1
      jmp @0            , ioff-idist-2670

imp   mov 0             , 2667
      dat <1            , #17

qs    equ 322
qd    equ 161

qscan cmp 2*qs+qd       , 2*qs
qt1   jmp qa0           , <3*qs
      cmp qscan+5*qs+qd , qscan+5*qs
qt2   jmp qa1           , <4*qs
      cmp qscan+4*qs+qd , qscan+4*qs
qs1   djn qa1           , #qt1
      cmp qscan+10*qs-2 , qscan+10*qs+qd-2  ; qscan-(qt2-1) = -2
qs2   djn qa2           , #qt2
      cmp qscan+9*qs+qd , qscan+9*qs
qt3   jmp qa2           , <6*qs
      cmp qscan+6*qs+qd , qscan+6*qs
      jmp qa2           , <qa1
      cmp qscan+8*qs+qd , qscan+8*qs
      jmp qa2           , <qs1
      cmp qscan+11*qs   , qscan+11*qs+qd
      jmp qa3           , <qa2
      cmp qscan+18*qs-8 , qscan+18*qs+qd-8  ; qscan-(qt3-1) = -8
qs3   djn qa3           , #qt3
      cmp qscan+16*qs-2 , qscan+16*qs+qd-2  ; qscan-(qt2-1) = -2
      jmp qa3           , <qs2
      cmp qscan+12*qs   , qscan+12*qs+qd
      jmp qa3           , <qa1
      cmp qscan+14*qs   , qscan+14*qs+qd
      jmp qa3           , <qs1
      jmz boot          , qscan+15*qs

qa3   add @qs3          , qp
qa2   add @qs2          , @qa3
qa1   add @qs1          , @qa3
qa0   cmp @qp           , <1234
      cmp @0            , 0
      add #qd           , qp
ql    mov qb            , @qp
qp    mov <2345         , <qscan+2*qs
      sub #9            , @ql
      djn ql            , #6
qb    jmp boot          , <43

      end qscan
