;redcode
;name Proteus
;author Matthew Hastings
;strategy Boot a small bomber and a replicator, jump to the
;strategy bomber, which runs for several thousand cycles then
;strategy split to the replicator.
;assert 1

ptr:  DAT #0,      #0
mouse:MOV #12,     ptr
loop: MOV @ptr,    <copy
      DJN loop,    ptr
      SPL @copy,   0
      ADD #653,    copy
      JMZ mouse,   ptr
copy: DAT #0,      #833
bmber:MOV -50,     @-50
      ADD #636,    -51
      DJN bmber,   <450
      SPL 1000,    0
      JMP bmber,   1
      DAT #0,      #0
start:MOV #1,      1250
      MOV #1,      1150
      MOV bmber,   arb+997
      MOV bmber+1, arb+998
      MOV bmber+2, arb+999
arb:  MOV bmber+3, arb+1000
      MOV bmber+4, arb+1001
      MOV bmber+5, arb+1002
      MOV mouse,   arb+2000
      MOV mouse+1, arb+2001
      MOV mouse+2, arb+2002
      MOV mouse+3, arb+2003
      MOV mouse+4, arb+2004
      MOV mouse+5, arb+2005
      MOV mouse+6, arb+2006
      JMP arb+997, 0
      END start
