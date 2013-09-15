;redcode-88
;name The Seed
;author Roy van Rijn
;strategy Tournament Warrior (Redcoders Frenzy) see www.corewar.info
;strategy Qscan - Stone/Paper (bit like Vala by Metcalf)
;assert 1

qs      equ 322
qd      equ 161

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
      jmz pgo           , qscan+15*qs

qa3   add @qs3          , qp
qa2   add @qs2          , @qa3
qa1   add @qs1          , @qa3
qa0   cmp @qp           , <3001
      cmp @0            , 0
      add #qd           , qp
ql    mov qb            , @qp
qp    mov <2345         , <qscan+2*qs
      sub #9            , @ql
      djn ql            , #6

stonedist equ pgo+45
qb
pgo

b1 for   5
      mov    (stone+b1)-1, stonedist+b1
rof
      mov     sbomb    , stonedist+8
      spl stonedist+1  , <1882
      spl stonedist+1  , <590
      spl stonedist+1  , <815
      spl stonedist+1  , <5020
      spl 1            , <3020
      mov -1,0
      mov -1,0
      mov -1,0

paper mov #9,9
      mov <-1,<1
      spl @0,-200-(6633/100)
      mov bomb,<-1
      mov bomb,<-2
      mov bomb-1,<-3
      jmz paper,paper
      mov 0,<1
bomb  dat <2667,<5334


stone   spl 0             , <1761
        mov sbomb+2       , <-123
        mov sbomb+2       , @-1
        add #-107         , -2
        djn -3            , <1840
sbomb   dat <1            , #17

      end qscan

